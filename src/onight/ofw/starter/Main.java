package onight.ofw.starter;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.felix.framework.util.Util;
import org.apache.felix.main.AutoProcessor;
import org.osgi.framework.Constants;
import org.osgi.framework.FrameworkEvent;
import org.osgi.framework.launch.Framework;
import org.osgi.framework.launch.FrameworkFactory;

public class Main extends org.apache.felix.main.Main {

	private static Framework m_fwk = null;

	public static void main(String[] args) {
		try {
			String cachedir = "felix-cache";
			deleteDir(new File(cachedir));
			System.setProperty("ofwConf", "conf/ofw.properties");
			System.setProperty("logback.configurationFile", "conf/logback.xml");
			
			List<String> arglist = new ArrayList<String>();
			arglist.addAll(Arrays.asList(args));
			arglist.add(cachedir);
			System.out.println(arglist);
			Thread.sleep(1);
			doMain(arglist.toArray(new String[] {}));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void doMain(String[] args) {
		// Look for bundle directory and/or cache directory.
		// We support at most one argument, which is the bundle
		// cache directory.
		String bundleDir = null;
		String cacheDir = null;
		boolean expectBundleDir = false;
		for (int i = 0; i < args.length; i++) {
			if (args[i].equals(org.apache.felix.main.Main.BUNDLE_DIR_SWITCH)) {
				expectBundleDir = true;
			} else if (expectBundleDir) {
				bundleDir = args[i];
				expectBundleDir = false;
			} else {
				cacheDir = args[i];
			}
		}

		if ((args.length > 3) || (expectBundleDir && bundleDir == null)) {
			System.out.println("Usage: [-b <bundle-deploy-dir>] [<bundle-cache-dir>]");
			System.exit(0);
		}

		// Load system properties.
		Main.loadSystemProperties();

		// Read configuration properties.
		Map<String, String> configProps = Main.loadConfigProperties();
		// If no configuration properties were found, then create
		// an empty properties object.
		if (configProps == null) {
			System.err.println("No " + CONFIG_PROPERTIES_FILE_VALUE + " found.");
			configProps = new HashMap<String, String>();
		}
		
		
		Map<String, String> startupConfig = loadStartupConfig();
		if(startupConfig!=null){
			System.out.println("startupConfig=="+startupConfig);
			configProps.putAll(startupConfig);
		}

		// Copy framework properties from the system properties.
		Main.copySystemProperties(configProps);

		// If there is a passed in bundle auto-deploy directory, then
		// that overwrites anything in the config file.
		if (bundleDir != null) {
			configProps.put(AutoProcessor.AUTO_DEPLOY_DIR_PROPERTY, bundleDir);
		}

		// If there is a passed in bundle cache directory, then
		// that overwrites anything in the config file.
		if (cacheDir != null) {
			configProps.put(Constants.FRAMEWORK_STORAGE, cacheDir);
		}

		// If enabled, register a shutdown hook to make sure the framework is
		// cleanly shutdown when the VM exits.
		String enableHook = configProps.get(SHUTDOWN_HOOK_PROP);
		if ((enableHook == null) || !enableHook.equalsIgnoreCase("false")) {
			Runtime.getRuntime().addShutdownHook(new Thread("Felix Shutdown Hook") {
				public void run() {
					try {
						if (m_fwk != null) {
							m_fwk.stop();
							m_fwk.waitForStop(0);
						}
					} catch (Exception ex) {
						System.err.println("Error stopping framework: " + ex);
					}
				}
			});
		}

		try {
			// Create an instance of the framework.
			FrameworkFactory factory = getFrameworkFactory();
			m_fwk = factory.newFramework(configProps);
			// Initialize the framework, but don't start it yet.
			m_fwk.init();
			// Use the system bundle context to process the auto-deploy
			// and auto-install/auto-start properties.
			AutoProcessor.process(configProps, m_fwk.getBundleContext());
			FrameworkEvent event;
			do {
				// Start the framework.
				m_fwk.start();
				// Wait for framework to stop to exit the VM.
				event = m_fwk.waitForStop(0);
			}
			// If the framework was updated, then restart it.
			while (event.getType() == FrameworkEvent.STOPPED_UPDATE);
			// Otherwise, exit.
			System.exit(0);
		} catch (Exception ex) {
			System.err.println("Could not create framework: " + ex);
			ex.printStackTrace();
			System.exit(0);
		}

	}

	private static FrameworkFactory getFrameworkFactory() throws Exception {
		URL url = Main.class.getClassLoader()
				.getResource("META-INF/services/org.osgi.framework.launch.FrameworkFactory");
		if (url != null) {
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			try {
				for (String s = br.readLine(); s != null; s = br.readLine()) {
					s = s.trim();
					// Try to load first non-empty, non-commented line.
					if ((s.length() > 0) && (s.charAt(0) != '#')) {
						return (FrameworkFactory) Class.forName(s).newInstance();
					}
				}
			} finally {
				if (br != null)
					br.close();
			}
		}

		throw new Exception("Could not find framework factory.");
	}

	public static  Map<String, String> loadStartupConfig() {
		URL propURL = null;
		String custom = System.getProperty(CONFIG_PROPERTIES_PROP);
		if (custom != null) {
			try {
				propURL = new URL(custom);
			} catch (MalformedURLException ex) {
				System.err.print("Main: " + ex);
				return null;
			}
		} else {
			// Determine where the configuration directory is by figuring
			// out where felix.jar is located on the system class path.
			File confDir = null;
			String classpath = System.getProperty("java.class.path");
			int index = classpath.toLowerCase().indexOf("felix.jar");
			int start = classpath.lastIndexOf(File.pathSeparator, index) + 1;
			if (index >= start) {
				// Get the path of the felix.jar file.
				String jarLocation = classpath.substring(start, index);
				// Calculate the conf directory based on the parent
				// directory of the felix.jar directory.
				confDir = new File(new File(new File(jarLocation).getAbsolutePath()).getParent(), CONFIG_DIRECTORY);
			} else {
				// Can't figure it out so use the current directory as default.
				confDir = new File(System.getProperty("user.dir"), CONFIG_DIRECTORY);
			}

			try {
				propURL = new File(confDir, "startup.properties").toURL();
			} catch (MalformedURLException ex) {
				System.err.print("Main: " + ex);
				return null;
			}
		}
		// Read the properties file.
		Properties props = new Properties();
		InputStream is = null;
		try {
			// Try to load config.properties.
			is = propURL.openConnection().getInputStream();
			props.load(is);
			is.close();
		} catch (Exception ex) {
			// Try to close input stream if we have one.
			try {
				if (is != null)
					is.close();
			} catch (IOException ex2) {
				// Nothing we can do.
			}

			return null;
		}

		// Perform variable substitution for system properties and
		// convert to dictionary.
		Map<String, String> map = new HashMap<String, String>();
		for (Enumeration e = props.propertyNames(); e.hasMoreElements();) {
			String name = (String) e.nextElement();
			map.put(name, Util.substVars(props.getProperty(name), name, null, props));
		}

		return map;

	}

	public static void deleteDir(File dir) {
		if (dir != null || !dir.exists())
			return;
		for (File child : dir.listFiles()) {
			if (child.isDirectory()) {
				deleteDir(child);
			} else {
				child.delete();
			}
		}
		dir.delete();

	}
}

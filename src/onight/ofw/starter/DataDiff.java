package onight.ofw.starter;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;

public class DataDiff {

	public static HashMap<String, String> parseFile(String file){
		HashMap<String, String> map = new HashMap<String, String>();
		try (FileInputStream fin = new FileInputStream(file);
				BufferedReader reader = new BufferedReader(new InputStreamReader(fin))) {
			String hash=null;
			while((hash=reader.readLine())!=null){
			if(hash!=null){
				if(map.containsKey(hash)){
					System.out.println("duplicatedhash:"+hash+"@file="+file);
				}
				map.put(hash, hash);
			}
			}
		} catch (Exception e) {
		}
		return map;
	}
	public static void main(String[] args) {
		HashMap<String,String> charge =parseFile("/Users/brew/Downloads/logs/chargesort.txt");
		HashMap<String,String> game = parseFile("/Users/brew/Downloads/logs/gamesort.txt");
		Iterator<String> it = charge.keySet().iterator();
		while(it.hasNext()){
			String hash = it.next();
//			System.out.println("exist:"+hash);
			if(!game.containsKey(hash)){
				System.out.println(hash);
			}
		}
		System.out.println("end...");

	}

}

#!/bin/sh
export LC_ALL="en_US.UTF-8"

echo disable all start level but level 5:opolicy
#sed  -i -e 's/^felix.auto.start./#felix.auto.start./g' -e 's/^#felix.auto.start.5/felix.auto.start.5/g' /opt/bruntime/conf/config.properties
#sed  -i -e 's/^felix.auto.start.3/d/g' /opt/bruntime/conf/config.properties
#sed  -i -e 's/^felix.auto.start.4/d/g' /opt/bruntime/conf/config.properties
#-XX:+UnlockCommercialFeatures -XX:+FlightRecorder

echo add bundles to config.properties

if [ -f /bundles/config.properties ] ; then
	mkdir -p /bundles/bkconfig
    cp /opt/bruntime/conf/config.properties "/bundles/bkconfig/config.properties.bk`date`"
	cat /bundles/config.properties >> /opt/bruntime/conf/config.properties
	sort -u /opt/bruntime/conf/config.properties > /opt/bruntime/conf/config.properties.u
	cp /opt/bruntime/conf/config.properties.u /opt/bruntime/conf/config.properties
fi


cd /opt/bruntime
rm -rf felix-cache/
java -cp sbin/bcprov-jdk16-140.jar:sbin/felix.jar:sbin/protobuf-java-3.0.0-alpha-3.1.jar -DofwConf=conf/ofw.properties  -Dlogback.configurationFile=conf/logback-server.xml ${JAVA_OPTS} org.apache.felix.main.Main

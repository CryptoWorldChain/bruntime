From jdk:1.7
RUN echo 'export LC_ALL="en_US.UTF-8"' >> /etc/profile
ADD bundle  /opt/bruntime/bundle
ADD conf  /opt/bruntime/conf
ADD modules /opt/bruntime/modules
ADD genesis /opt/bruntime/genesis
ADD sbin  /opt/bruntime/sbin
ADD startup.sh /opt/bruntime/
RUN rm /opt/bruntime/bundle/org.apache.felix.gogo*.jar /opt/bruntime/bundle/org.apache.felix.ipojo.gogo*.jar
CMD sh /opt/bruntime/startup.sh && sleep 10s && tail -f /opt/bruntime/logs/*.log


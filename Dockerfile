FROM 811668436784.dkr.ecr.us-east-1.amazonaws.com/tc-website:base

RUN mkdir -p /nfs_shares && mkdir -p /data/tc-website/package && rm -rf /home/web/jboss-4.0.4.GA/bin/run.conf

#COPY jbossserverconfig/run.conf /home/web/jboss-4.0.4.GA/bin/run.conf
#COPY jbossserverconfig/start.sh /data/tc-website/start.sh
#COPY topcoder.jar /data/tc-website/package/topcoder.jar
#COPY jbossserverconfig/packagedeploy.sh /data/tc-website/packagedeploy.sh

COPY [ "jbossserverconfig/run.conf" , "jbossserverconfig/start.sh", "topcoder.jar", "jbossserverconfig/packagedeploy.sh", "/data/tc-website/"]

RUN chown -Rf web:apps /data/tc-website && runuser -l web  -c "/data/tc-website/packagedeploy.sh" 

WORKDIR /data/tc-website

CMD ./start.sh

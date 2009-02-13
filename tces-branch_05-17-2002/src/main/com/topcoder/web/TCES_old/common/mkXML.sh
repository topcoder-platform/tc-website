#!/bin/sh
if [ ! -d META-INF ]
then
	mkdir META-INF
fi
cat > META-INF/ejb-jar.xml <<\EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE ejb-jar PUBLIC "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN" "http://java.sun.com/j2ee/dtds/ejb-jar_1_1.dtd">
<ejb-jar id="ejb-jar_ID">
   <enterprise-beans>
EOF
cat > META-INF/weblogic-ejb-jar.xml <<\EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE weblogic-ejb-jar PUBLIC "-//BEA Systems, Inc.//DTD WebLogic 5.1.0 EJB//EN"
"http://www.bea.com/servers/wls510/dtd/weblogic-ejb-jar.dtd">
<weblogic-ejb-jar>
EOF
#
# all session EJBs must be listed (without extensions) in beans.lst
#
SESS_ID=1
cat beans.lst | while read CLASS_NAME
do
	cat >> META-INF/ejb-jar.xml <<EOF
      <session id="Session_$SESS_ID">
         <ejb-name>${CLASS_NAME}2</ejb-name>
         <home>com.topcoder.web.TCES.ejb.${CLASS_NAME}2Home</home>
         <remote>com.topcoder.web.TCES.ejb.${CLASS_NAME}2</remote>
         <ejb-class>com.topcoder.web.TCES.ejb.${CLASS_NAME}2Bean</ejb-class>
         <session-type>Stateless</session-type>
         <transaction-type>Container</transaction-type>
      </session>
EOF
	cat >> META-INF/weblogic-ejb-jar.xml <<EOF
   <weblogic-enterprise-bean>
      <ejb-name>${CLASS_NAME}2</ejb-name>
      <caching-descriptor>
         <max-beans-in-free-pool>200</max-beans-in-free-pool>
         <initial-beans-in-free-pool>10</initial-beans-in-free-pool>
      </caching-descriptor>
      <jndi-name>com.topcoder.web.TCES.ejb.${CLASS_NAME}2</jndi-name>
   </weblogic-enterprise-bean>
EOF
	SESS_ID=`expr $SESS_ID + 1`
done
cat >> META-INF/ejb-jar.xml <<EOF
   </enterprise-beans>
   <assembly-descriptor>
   </assembly-descriptor>
</ejb-jar>
EOF
echo "</weblogic-ejb-jar>" >> META-INF/weblogic-ejb-jar.xml

echo -----------------------------
echo Stopping Studio JBoss server. 
echo Press y to confirm stopping
echo -----------------------------
cd /tmp
./kill.sh

echo --------------------------------------------------------------
echo Updating configuration, sources, libraries for Studio Website
echo application
echo --------------------------------------------------------------
cd /tmp
cp -r ./src /mnt/shared/web

echo ------------------------------------------------------------
echo Updating configuration for Studio JBoss server
echo ------------------------------------------------------------
cd /tmp
cp -r ./home/studio/jboss-4.0.4.GA /home/studio

echo ---------------------------------------------
echo Copying static content to Apache HTTP server
echo ---------------------------------------------
cd /tmp
cp -r ./studiodocs /mnt/apache

echo -------------------------------------------------
echo Building PACTS Client Services EJB
echo -------------------------------------------------
cd /home/studio/web
ant -f build_tc.xml package-EJB-PactsClientServicesBean

echo -------------------------------------------------
echo Building and deploying Studio application
echo -------------------------------------------------
cd /home/studio/web
ant -f build_studio.xml war-studio

echo -----------------------------
echo Starting Studio JBoss server
echo -----------------------------
cd /home/studio/jboss-4.0.4.GA/bin
./start.sh

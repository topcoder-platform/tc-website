echo -----------------------------
echo Stopping TC JBoss server.
echo Press y to confirm stopping
echo -----------------------------
cd /home/tc/jboss-4.0.4.GA/bin
./kill.sh

echo ------------------------------------------------------------
echo Updating configuration for TC JBoss server
echo ------------------------------------------------------------
cd /tmp
cp -r ./home/tc/jboss-4.0.4.GA /home/tc

echo -----------------------------
echo Starting TC JBoss server
echo -----------------------------
cd /home/tc/jboss-4.0.4.GA/bin
./start.sh

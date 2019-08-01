#!/bin/sh

#Creates the cron job at the actual directory
CPATH=$PWD

echo "Installing python dependencies ..."
#Instalar las dependencias de python 
pip install requests
pip install firebase-admin

echo "Creating runner"
echo "#!/bin/sh" > runner.sh
echo "cd $CPATH " >> runner.sh
echo "/usr/bin/python2 comodoro.py " >> runner.sh

echo "Giving permissions ..."
#Running permissions
chmod +x runner.sh
chmod +x comodoro.py

echo "Creating the cronjob ..."

#Every 5 minutes
JOB="*/5 * * * * /bin/sh $CPATH/runner.sh"
(crontab -l ; echo "$JOB") | crontab -

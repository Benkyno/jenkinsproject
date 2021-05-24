#/bin/bash
crumb=$(curl -u "jenkinss:1597" -s 'http://10.0.1.21:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl -u "jenkinss:1597" -H "$crumb" -X POST http://10.0.1.21:8080/job/ENV/build?delay=0sec
curl -u "jenkinss:1597" -H "$crumb" -X POST  http://10.0.1.21:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backp


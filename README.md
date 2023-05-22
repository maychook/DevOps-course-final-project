# Final Project - Devops

## GIT:
1. Create/find a simple web application (jsp) (1)
2. Store the code in new project on GitHub

## Jenkins:
3. Create folder name in your ubuntu server
4. pull Jenkins docker image (latest version)
5. Run and start the Jenkins container with volume mapping (2)
6. First config (make sure that Jenkins available from outside)
7. Deploy the simple web application into production environment (jenkins job that
will take the jsp file from git to our new folder) (3)

## Tomcat:
8. pull tomcat docker image (latest version)
9. Run and start the Tomcat container with volume mapping (4)
10. Make sure that tomcat server is available

## Monitor:
11. Create availability monitor to the tomcat application (5)
12. Create another (separate) monitor Jenkins job, the job will monitor the website
every 1 minute. (6)
13. If the monitor Jenkins job will fail, trigger the build job

## Jenkins+Tomcat:
15. Make change in git
16. Make sure that application is automatically updated (Jenkins responsibility)

## Appendix
(1) Creative jsp file
(2) we are using -v flag in order to map volumes in docker
(3) deploy the jsp file to the mapped folder
(4) mapped the same new folder to /usr/local/tomcat/webapps
(<new-folder>:/usr/local/tomcat/webapps)
(5) Use Jenkins plugin
(6) Choose different monitor implementation from the previous paragraph
(7) docker compose - Bonus 5 Points

Finished– Great!

### Take a screenshot of :
1. Your git repository + URL
2. Jenkins web page
3. Jenkins jobs
4. Tomcat web page (with your application)
5. Run docker ps ( with command output)
6. Your docker-compose file
7. Monitor result
8. Second Monitor Job result

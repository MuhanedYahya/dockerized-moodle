# Dockerized Moodle
Dockerized moodle version for easier and faster moodle installation without any requirements on the host

### first you need to download moodle project from its official page and it should appear as moodle next to docker-compose.yml file.
<a>https://download.moodle.org/releases/latest/</a>
### to install and run the project
<code>docker-compose up -d --build</code>
### When moodle installation starts, if there is a problem with the moodledata folder, you will need to give it the necessary permission from host.
<code>chown www-data:www-data -R /var/www/moodledata/</code>
### During the moodle installation, you need to write the name of the mysql container written in the docker-compose.yml file as the database host.
#### You can type moodle or root as database user.

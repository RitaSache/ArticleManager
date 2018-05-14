# README

* To get the application up and running:
install Ruby version 2.3.3p222
install Rails version 5.1.6

clone the repository to your computer, cd into the directory

* run on terminal to create the ArticleManager database:

bin/rails db:migrate

* to access the database, the username is 'root'. If you need to change the 
username, go to the config/database.yml file in my project and change the username, then update 
username and password.

* run the server with command:
bin/rails server

* go to your browser and type:
localhost:3000

* upon request for authorization for manipulating articles, authors, tags, and comments, 
use username is 'rita' and the password is "secret"
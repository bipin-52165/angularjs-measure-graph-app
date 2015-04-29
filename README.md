AngularJS-RubyOnRails - Mesure & Graph Application

Features
----------------------

- Mesure Heart Rate Tracking: 
- Mesure Blood Glucose Level
- Mesure Weight Level


User Input Screen: 
------------------

User determines their Heart Rate/Glucose Level/ Weight with the help of a timer on the app. The app automatically stores date and time along with the measurement.

Output: 
--------

User is able to edit their most recent measurements (within a specified number of days), and view past measurements on a graph

Technology
------------------

1) AngularJS
2) Ruby on Rails
3) Angular Highchart
4) Bootstrap

Installation guide
--------------------------

1 install ruby version with below command:
  
        $ rvm install ruby-2.2.0

2. Run `bundle install`

        $ bundle install

3. We manage javascript libraries with [bower](http://bower.io/). Install [Node.js](http://nodejs.org/) and [bower](http://bower.io/). At the moment we keep JavaScript dependencies in this repository so you might be OK to skip this step 3 and 4 if you don't need to install new JavaScript libraries.

        $ brew install node
        $ npm install -g bower

4. Install JavaScript dependencies.

        $ bower install

5. Run below command to create database and generate tables

        $ rake db:create && rake db:migrate

6. Then start rails application.

        $ rails s
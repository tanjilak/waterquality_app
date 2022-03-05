# Smart Water Quality Monitoring App

This is a real time water quality tracking application. It can connect to a database that has real time water data stored inside. 

## Table of contents

- [Overview](#overview)
  - [This Project](#this-project)
  - [Application Layout](#application-layout)
  - [Links](#links)
- [My Process](#my-process)
  - [Built with](#built-with)
  - [What I Learned](#what-i-learned)
  - [Continued Development](#continued-development)
- [Author](#author)
- [Acknowledgments](#acknowledgments)


## Overview

### This Project

Users should be able to:

- Sign up and sign in for their own profile
- Connect to a Raspberry PI device
- See real time data for pH, Temperature, and ORP values for water flowing out of a sink
- Sign out and have their information saved

### Application Layout

Users will see a welcome page after clicking the application. 
![screenshot](https://user-images.githubusercontent.com/70307218/156902364-e789d699-788d-45c8-81e8-3aec4c7573d9.jpg =100x20)

The water quality data is formatted as shown below:
![image](https://user-images.githubusercontent.com/70307218/156902395-1c90059e-c715-4cbe-93fa-0dbcdc6976c0.png = 100x20)


### Links

- Website : 
- App Demo Video : 

## My Process

### Built with

- Flutter/Dart
- Firebase
- MYSQL/phpMyAdmin
- PHP

### What I Learned

I gained a wide understanding of Flutter and Dart syntax. 

Connecting to a database was very confusing for me, at least from the beginning. 

I was able to understand SQL commands to connect to php files and even insert new data into tables.
For example,

SELECT ph_values FROM data
   WHERE week_id=1
   
would only show ph column from the 'data' table when the week_id is only '1'. 


### Continued Development

For future projects, I would love to get a better understanding of SQL and actually analyzing more of the data. Incorporating SQL techniques for the database would improve the application. 


I would also try to use different application languages. Next time, I might use JAVA instead of Flutter for a better understanding of mobile applications. 

## Author

- Website - [Tanjila Kabir](https://tanjilak.github.io/)

## Acknowledgments

Due to this being my first application, I took inspiration and help from many tutorials online.

Sign in and Sign Up pages: 
Firebase Authentication:
Flutter Connection to PHP files & SQL Database:
Flutter Connection to CSV files:
Machine Learning Algorithm: 



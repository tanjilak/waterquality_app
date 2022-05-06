# Smart Water Quality Monitoring App

This is a real time water quality tracking application. It can connect to a database that has real time water data stored inside. This was completed for a 2021-2022 Capstone course.

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


## Overview

### This Project

Users should be able to:

- Sign up and sign in for their own profile
- Connect to an Arduino device
- See real time data for pH, Temperature, and ORP values for water flowing out of a sink
- Sign out and have their information saved
- See predicted values for the next week

### Application Layout

The GUI interface of the application is displayed below <br/>

![Water Quality Monitoring App](https://user-images.githubusercontent.com/70307218/167204247-c89202ca-aff7-493f-bc90-0659831f56ec.png)

## My Process

### Links

Please visit our website for a better understanding of the whole project and all the team members who contributed!

- Website - [H2O - Water Quality Monitoring System](https://h2owaterquality.com/)

### Built with

- Flutter/Dart
- Firebase
- MYSQL/phpMyAdmin
- PHP

### What I Learned

I gained a wide understanding of Flutter and Dart syntax. <br/>

Connecting to a database was very confusing for me, at least from the beginning. <br/>

I was able to understand SQL commands to connect to php files and even insert new data into tables. <br/>
For example, <br/>

SELECT ph_values FROM data <br/>
   WHERE week_id=1 <br/>
   
would only show ph column from the 'data' table when the week_id is only '1'.  

### Continued Development

For future projects, I would love to get a better understanding of SQL and actually analyzing more of the data. Incorporating SQL techniques for the database would improve the application. <br/>

I would also try to use different application languages. Next time, I might use React Native or Xcode instead of Flutter for a better understanding of mobile applications. 

## Author

- Website - [Tanjila Kabir](https://tanjilak.github.io/)




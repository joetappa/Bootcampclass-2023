# Overview 

## MERN Web stack consists of following components:

- MongoDB: A document-based, No-SQL database used to store application data in a form of documents.
- ExpressJS: A server side Web Application framework for Node.js.
- ReactJS: A frontend framework developed by Facebook. It is based on JavaScript, used to build User Interface (UI) components.
- Node.js: A JavaScript runtime environment. It is used to run JavaScript on a machine rather than in a browser.


![proj3](https://user-images.githubusercontent.com/85270361/210118416-5abdf8d5-5fb8-4caf-b315-3d98d45a9e3d.PNG)


As shown on the illustration above, a user interacts with the ReactJS UI components at the application front-end residing in the
browser. This frontend is served by the application backend residing in a server, through ExpressJS running on top of NodeJS.

Any interaction that causes a data change request is sent to the NodeJS based Express server, which grabs data from the MongoDB 
database if required, and returns the data to the frontend of the application, which is then presented to the user.


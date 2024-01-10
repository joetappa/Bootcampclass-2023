
Step 1: Install NodeJs
Node.js is a JavaScript runtime built on Chrome’s V8 JavaScript engine. Node.js is used in this tutorial to set up the Express
routes and AngularJS controllers.

Update ubuntu

```
sudo apt update
```

Upgrade ubuntu

```
sudo apt upgrade
```

Add certificates

```
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```

Install NodeJS

```
sudo apt install -y nodejs
```

Step 2: Install MongoDB
MongoDB stores data in flexible, JSON-like documents. Fields in a database can vary from document to document and data structure can
be changed over time. For our example application, we are adding book records to MongoDB that contain book name, isbn number, author,
and number of pages.

mages/WebConsole.gif

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
```

```
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" |
sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
```

Install MongoDB

```
sudo apt install -y mongodb
```

Start The server

```
sudo service mongodb start
```

Verify that the service is up and running

```
sudo systemctl status mongodb
```

Install npm – Node package manager.

```
sudo apt install -y npm
```

Install body-parser package

We need ‘body-parser’ package to help us process JSON files passed in requests to the server.


```
sudo npm install body-parser
```

Create a folder named ‘Books’

```
mkdir Books && cd Books
```

In the Books directory, Initialize npm project

```
npm init
```

Add a file to it named server.js

```
vi server.js
```

Copy and paste the web server code below into the server.js file.

```
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
require('./apps/routes')(app);
app.set('port', 3300);
app.listen(app.get('port'), function() {
    console.log('Server up: http://localhost:' + app.get('port'));
});
```
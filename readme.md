# City of Heroes/Villains Build Hub

A place to keep all your builds

## Installation Requirements

* Lucee 5+ or Adobe ColdFusion (with minor modifications)
* A local MariaDB or MySQL server installation
* Registered datasource (default datasource name is "web")

## Database Generation

Assuming MariaDB/MySQL

```sql
CREATE TABLE `builds` (
  `id` varchar(48) NOT NULL DEFAULT '',
  `author` varchar(48) NOT NULL DEFAULT '',
  `archetype` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` binary(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `id` varchar(48) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` binary(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
```

## CommandBox Embedded Server Setup
Getting up and running quickly
* Clone the repo
* `box install`
* `box server start`
* The server will start, but will error out until you have configured your Lucee instance
* Configure the datasource Lucee Server Admin (http://127.0.01/lucee/admin/server.cfm)

Once the datasource has been configured you can edit the datasource to get the datasources config block for Application.cfc. 

## Application Setup
I develop locally using the CommandBox embedded server with the Lucee 5 engine. This should be the default configuration.
My datasource is configured in Application.cfc, you will need to configure the datasources in Lucee server administrator and
copy the configuration block to your Application.cfc.

```cfml
	this.datasources["web"] = {
	  class: 'com.mysql.jdbc.Driver'
	, bundleName: 'com.mysql.jdbc'
	, bundleVersion: '5.1.40'
	, connectionString: 'jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true'
	, username: 'Your User'
	, password: "encrypted:your encrypted password"
	// optional settings
	, connectionLimit:100 // default:-1
	, storage:true // default: false
	};

	this.datasource = "web";
	this.clientManagement = true;
```

This is required because commandbox instances do not maintain data sources if the instance is restarted. Adding this to your Application.cfc
will prevent you from having to add the datasource every time you start the embedded server.

##
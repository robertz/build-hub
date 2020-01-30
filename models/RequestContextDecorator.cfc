component extends="coldbox.system.web.context.RequestContextDecorator" {

	property name="Controller" inject="coldbox";

	function configure(){
		var rc = getRequestContext().getCollection();
		var prc = getRequestContext().getCollection(private = true);

		if(!client.keyExists("userId")) client['userId'] = variables.Controller.getSetting("defaultUser");

		prc['env'] = variables.Controller.getSetting("Environment");
		prc['isIdentified'] = client.userId == variables.Controller.getSetting("defaultUser") ? false : true;

		prc['userId'] = client.userId;
		prc['baseURL'] = prc.env == "production" ?  "https://hub.kisdigital.com/" : "http://127.0.0.1:8080/";

		prc['jsonData'] = {};

		prc['seo'] = {
			"og:title": "KISDigital.com: Build Hub",
			"og:type": "Website",
			"og:url": "https://hub.kisdigital.com",
			"og:image": "https://hub.kisdigital.com/assets/images/city-of-heroes-hd-wallpapers-32893-8207197.jpg",
			"og:description": "A database of character builds for City of Heroes and City of Villains",
			"og:locale": "en_US",
			"og:site_name": "KISDigital.com Build Hub"
		};

		return this;
	}

}
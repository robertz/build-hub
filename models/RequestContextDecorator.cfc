component extends="coldbox.system.web.context.RequestContextDecorator" {

	property name="Controller" inject="coldbox";

	function configure(){
		var rc = getRequestContext().getCollection();
		var prc = getRequestContext().getCollection(private = true);

		prc['env'] = variables.Controller.getSetting("Environment");
		prc['scripts'] = [];
		prc['css'] = [];
		prc['jsonData'] = {};

		if(prc.env == "production"){
			prc['baseURL'] = "https://hub.kisdigital.com/";
			prc.css.append("https://hub.kisdigital.com/assets/css/site.css");
		} else {
			prc['baseURL'] = "http://127.0.0.1:8080/";
			prc.css.append("/assets/css/site.css");
		}

		return this;
	}

}
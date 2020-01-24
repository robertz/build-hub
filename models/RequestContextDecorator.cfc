component extends="coldbox.system.web.context.RequestContextDecorator" {

	property name="Controller" inject="coldbox";

	function configure(){
		var rc = getRequestContext().getCollection();
		var prc = getRequestContext().getCollection(private = true);

		prc['env'] = variables.Controller.getSetting("Environment");
		prc['baseURL'] = prc.env == "production" ?  "https://hub.kisdigital.com/" : "http://127.0.0.1:8080/";

		prc['jsonData'] = {};

		return this;
	}

}
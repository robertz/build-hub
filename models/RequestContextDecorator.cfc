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
			prc.css.append("https://hub.kisdigital.com/assets/css/site.css");
		} else {
			prc.css.append("/assets/css/site.css");
		}

		return this;
	}

}
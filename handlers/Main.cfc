component extends="coldbox.system.EventHandler"{

	property name = "UserService" inject = "model";
	property name = "BuildService" inject = "model";

	// Default Action
	function index(event,rc,prc){
		prc['jsonData']['builds'] = BuildService.getBuilds();
		event.setView("main/index");
	}

	function login (event, rc, prc) {
		client['userId'] = UserService.validateLogin(user = rc.user, pass = rc.pass);
		relocate("main");
	}

	function logout (event, rc, prc) {
		client['userId'] = getSetting("defaultUser");
		relocate("main");
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit(event,rc,prc){
		application['jsver'] = dateTimeFormat(now(), "yyyymmdd.HHnnss");
	}

	function onRequestStart(event,rc,prc){

	}

	function onRequestEnd(event,rc,prc){

	}

	function onSessionStart(event,rc,prc){

	}

	function onSessionEnd(event,rc,prc){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	function onException(event,rc,prc){
		event.setHTTPHeader( statusCode = 500 );
		//Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		//Place exception handler below:

		setNextEvent("main/uhoh");
	}

	function pageNotFound (event, rc, prc) {
		event.setView("main/pageNotFound");
	}

	function uhoh (event, rc, prc) {
		event.setView("main/uhoh");
	}

}
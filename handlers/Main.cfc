component extends="coldbox.system.EventHandler"{

	property name = "UserService" inject = "model";
	property name = "BuildService" inject = "model";

	// Default Action
	function index(event,rc,prc){
		prc['builds'] = BuildService.getBuilds();
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
	}

	function pageNotFound (event, rc, prc) {
		event.setView("main/pageNotFound");
	}

}
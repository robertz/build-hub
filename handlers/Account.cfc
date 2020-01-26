component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function index (event, rc, prc) {
		if(client.userid == defaultUser) relocate("main");
		event.setView("account/index");
	}

}
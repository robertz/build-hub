component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "BuildService" inject;

	// Main account screen
	function index (event, rc, prc) {
		if(client.userid == defaultUser) relocate("main"); // not logged in
		prc['jsonData']['builds'] = BuildService.getBuildsByAccount( id = client.userId );
		event.setView("account/index");
	}

	function join (event, rc, prc) {
		prc['jsonData']['token'] = client.cfid;
		event.setView("account/join");
	}

}
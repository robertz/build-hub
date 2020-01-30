component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "BuildService" inject;

	function index (event, rc, prc) {
		if(client.userid == defaultUser) relocate("main");

		prc['jsonData']['builds'] = BuildService.getBuildsByAccount( id = client.userId );
		event.setView("account/index");
	}

	function join (event, rc, prc) {
		prc['jsonData']['token'] = client.cfid;
		event.setView("account/join");
	}

}
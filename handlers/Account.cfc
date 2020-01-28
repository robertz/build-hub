component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "BuildService" inject;

	function index (event, rc, prc) {
		if(client.userid == defaultUser) relocate("main");

		prc['builds'] = BuildService.getBuildsByAccount( id = client.userId );
		event.setView("account/index");
	}

}
component output = "false" {

	property name = "BuildService" inject;

	function index (event, rc, prc) {
		relocate("main");
	}

	function view (event, rc, prc) {
		if(!rc.keyExists("id")) relocate("main");

		prc['build'] = BuildService.getBuild(rc.id);
		event.setView("build/view");
	}

}
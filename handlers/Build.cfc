component output = "false" {

	property name = "BuildService" inject;
	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function index (event, rc, prc) {
		relocate("main");
	}

	function view (event, rc, prc) {
		if(!rc.keyExists("id")) relocate("main");

		prc['build'] = BuildService.getBuild(rc.id);
		event.setView("build/view");
	}

	function create (event, rc, prc) {
		if(client.userId == defaultUser) relocate("main");
		prc['id'] = "";
		prc['archetype'] = "";
		prc['primary'] = "";
		prc['secondary'] = "";
		prc['title'] = "";
		prc['description'] = "";
		event.setView("build/edit");
	}

	function edit (event, rc, prc) {
		if(client.userId == defaultUser) relocate("main");
		if(!rc.keyExists("id")) relocate("main");

		var b = buildService.getBuild(id = rc.id);

		prc['id'] = rc.id;
		prc['author'] = client.userId;
		prc['archetype'] = b.archetype;
		prc['primary'] = b.primary;
		prc['secondary'] = b.secondary;
		prc['title'] = b.title;
		prc['description'] = b.description;

		event.setView("build/edit");
	}

	function update (event, rc, prc) {
		BuildService.putBuild(rc);
		relocate("main");
	}

}
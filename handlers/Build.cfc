component output = "false" {

	property name = "BuildService" inject;
	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function index (event, rc, prc) {
		relocate("main");
	}

	function view (event, rc, prc) {
		if(!rc.keyExists("id")) relocate("main");

		prc['build'] = BuildService.getBuild(rc.id)[1];
		event.setView("build/view");
	}

	function create (event, rc, prc) {
		if(client.userId == defaultUser) relocate("main");
		prc.jsonData['id'] = "";
		prc.jsonData['archetype'] = "";
		prc.jsonData['primary'] = "";
		prc.jsonData['secondary'] = "";
		prc.jsonData['title'] = "";
		prc.jsonData['description'] = "";

		event.setView("build/edit");
	}

	function edit (event, rc, prc) {
		if(client.userId == defaultUser) relocate("main");
		if(!rc.keyExists("id")) relocate("main");
		var b = buildService.getBuild(id = rc.id)[1];

		prc.jsonData['id'] = rc.id;
		prc.jsonData['author'] = client.userId;
		prc.jsonData['archetype'] = b.archetype;
		prc.jsonData['primary'] = b.primary;
		prc.jsonData['secondary'] = b.secondary;
		prc.jsonData['title'] = b.title;
		prc.jsonData['description'] = b.description;

		event.setView("build/edit");
	}


}
component output = "false" {

	property name = "BuildService" inject;
	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function index (event, rc, prc) {
		relocate("main");
	}

	function view (event, rc, prc) {
		if(!rc.keyExists("id")) relocate("main");
		try{
			prc['build'] = BuildService.getBuild(rc.id)[1];

			prc['seo']['og:type'] = "article";
			prc['seo']['og:title'] = prc.build.title;

		}
		catch(any e) {
			relocate("main");
		}

		event.setView("build/view");
	}

	function create (event, rc, prc) {
		if(client.userId == defaultUser) relocate("main");

		prc.jsonData['at'] = BuildService.getArchetypes();

		prc.jsonData['id'] = "";
		prc.jsonData['archetype'] = "";
		prc.jsonData['primary'] = "";
		prc.jsonData['secondary'] = "";
		prc.jsonData['title'] = "";
		prc.jsonData['description'] = "";

		event.setView("build/edit");
	}

	function edit (event, rc, prc) {
		if(client.userId == defaultUser) relocate("main"); // not logged in
		if(!rc.keyExists("id")) relocate("main"); // no id present
		try{
			var b = buildService.getBuild(id = rc.id)[1];
		}
		catch(any e) {
			relocate("main");
		}

		if(client.userId != b.authorId) relocate("main"); // not the author of the build

		prc.jsonData['at'] = BuildService.getArchetypes();

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
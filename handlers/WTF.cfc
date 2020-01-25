component output = "false" {

	property name = "UserService" inject;
	property name = "BuildService" inject;

	function index (event, rc, prc) {
		abort;
	}

	function getUUID (event, rc, prc) {
		writeDump(var=lcase(createUUID()), abort = true, label = "getUUID");
	}

	function robsHood (event, rc, prc) {
		writeDump(var=UserService.validateLogin(user = "Slightly", pass = "password"), abort = true, label = "label");
	}

	function dumpContexts (event, rc, prc) {
		writeDump(var=[rc, prc, client], abort = true, label = "scopes");
	}

	function getBuilds (event, rc, prc) {
		var builds = "SELECT builds.id, builds.archetype, builds.primary, builds.secondary, builds.title, builds.description, users.username AS author FROM builds, users WHERE builds.author = users.id";

		writeDump(var=queryExecute(builds), abort = true, label = "label");
	}
}

component output = "false" {

	property name = "UserService" inject;

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
}

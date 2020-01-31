component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;

	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {
		writeDump(var="#application#", abort = true, label = "label");
	}
}

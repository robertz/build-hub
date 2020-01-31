component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "AntiSamy" inject = "antisamy@cbantisamy";


	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {
		writeDump(var="#antisamy#", abort = true, label = "label");
	}
}

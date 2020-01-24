component output = "false" {

	property name = "wami" inject = "coldbox:setting:env";

	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {

		writeDump(var=wami, abort = true, label = "label");

	}

}
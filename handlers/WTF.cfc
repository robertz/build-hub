component output = "false" {

	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {

		writeDump(var=getSetting("ENVIRONMENT"), abort = true, label = "label");

	}

}
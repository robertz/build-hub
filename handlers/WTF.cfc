component output = "false" {

	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {

		writeDump(var=cgi, abort = true, label = "label");

	}

}
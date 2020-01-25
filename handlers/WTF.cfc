component output = "false" {

	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {

		writeDump(var=[rc,prc], abort = true, label = "label");

	}

}

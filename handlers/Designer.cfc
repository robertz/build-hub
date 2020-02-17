component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "ResourceService" inject;

	function index (event, rc, prc) {
		// prc['jsonData']['arches'] = BuildService._getArchetypes();
		// prc['jsonData']['arch'] = BuildService.getClass(className = "Class_Blaster");

		prc['jsonData']['toon'] = {
			"name": "dev the mighty",
			"class": "Class_Blaster"
		};

		var ec = binaryEncode(toBinary(toBase64(serializeJSON(prc.jsonData.toon))), "hex");


		writeDump(var=ec, abort = false, label = "label");
		writeDump(var=toString(binaryDecode(ec, "hex")), abort = true, label = "label");
	}

}
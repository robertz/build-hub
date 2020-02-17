component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "ResourceService" inject;

	function index (event, rc, prc) {
		// prc['jsonData']['arches'] = BuildService._getArchetypes();
		// prc['jsonData']['arch'] = BuildService.getClass(className = "Class_Blaster");

		// https://github.com/ImaginaryDevelopment/imaginary-hero-designer/blob/master/Base/Base/Data_Classes/Archetype.cs
		prc['jsonData']['archtype'] = {
			'baseThreat': 1,
			'baseRegen:': 1,
			'baseRecovery': 1.67,
			'playable': true,
			'poolGroup': "POOL",
			'epicGroup': "EPIC",
			'secondaryGroup': "",
			'primaryGroup': "",
			'className': "",
			'perceptionCap': 1153,
			'ancillary': [],
			'secondary': [],
			'primary': [],
			'origin': [],
			'recoveryCap': 5,
			'regenCap': 20,
			'damageCap': 4,
			'rechargeCap': 5,
			'resCap': 90,
			'descShort': "",
			'descLong': "",
			'hpCap': 5000,
			'hitPoints': 5000,
			'classType': "",
			'displayName': "New Archtype",
			'className': "NewClass"
		};

		var ec = binaryEncode(toBinary(toBase64(serializeJSON(prc.jsonData.archtype))), "hex");


		writeDump(var = ec, abort = false, label = "label");
		writeDump(var = toString(binaryDecode(ec, "hex")), abort = true, label = "label");
	}

}
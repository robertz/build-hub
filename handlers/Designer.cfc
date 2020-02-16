component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "ResourceService" inject;

	function index (event, rc, prc) {
		prc['jsonData']['arches'] = BuildService._getArchetypes();
		prc['jsonData']['arch'] = BuildService.getClass(className = "Class_Blaster");

		writeDump(var=prc, abort = true, label = "label");
	}

}
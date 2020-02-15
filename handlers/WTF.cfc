component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "AntiSamy" inject = "antisamy@cbantisamy";


	function index (event, rc, prc) {
		abort;
	}

	function robsHood (event, rc, prc) {
		var q = queryExecute("SELECT identifier FROM resources WHERE identifier LIKE 'Class_Brute%'", [], { returnType: "array" });
		var pools = [];
		q.each(function(p) {
			if(!pools.contains(p.identifier.listFirst("."))) pools.append(p.identifier.listFirst("."));
		});
		writeDump(var=pools, abort = true, label = "label");
	}

}

component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "AntiSamy" inject = "antisamy@cbantisamy";
	property name = "ResourceService" inject;

	function index (event, rc, prc) {
		abort;
	}

	function dumpATs (event, rc, prc) {
		writeDump(var=ResourceService.getResource(id = 'I12'), abort = true, label = "label");
	}

	function buildATs (event, rc, prc) {
		var ATs = [];
		var data = ResourceService.getResource(id = 'I12');

		data.archetypes.each(function(at) {
			if(at.keyExists("Playable")){
				ATs.append({
					'displayName': at.displayName,
					'className': at.className,
					'primaryGroup': at.primaryGroup,
					'secondaryGroup': at.secondaryGroup
				});
			}
		});

		writeDump(var=ATs, abort = true, label = "label");
	}

	function robsHood (event, rc, prc) {
		var q = queryExecute("SELECT * FROM resources WHERE identifier LIKE 'Class_Brute%'", [], { returnType: "array" });
		var pools = {
			'primary': [],
			'secondary': []
		};

		for(var r in q){
			var pool = deserializeJSON(r.data);

			writeDump(var=pool, abort = true, label = "label");

			if(pool.SetType == 1){
				pools.primary.append({ 'name': pool.fullName, 'label': pool.displayName });
			}
			else {
				pools.secondary.append({ 'name': pool.fullName, 'label': pool.displayName })
			}
		}

		// q.each(function(p) {
		// 	if(!pools.contains(p.identifier.listFirst("."))) pools.append(p.identifier.listFirst("."));
		// });

		writeDump(var=pools, abort = true, label = "label");
	}

}

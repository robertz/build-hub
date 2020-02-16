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

		var ret = cacheGet("archetypes");
		if (isNull(ret)) {
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
			cachePut("archetypes", ATs);
			ret = ATs;
		}

		writeDump(var=ret, abort = true, label = "label");
	}

	function robsHood (event, rc, prc) {
		var data = ResourceService.getResource(id = 'I12');
		writeDump(var=data, abort = true, label = "label");
	}

	function get (event, rc, prc) {
		if(rc.keyExists("r")) writeDump(var=ResourceService.getResource( id = r ), abort = true, label = "label");
		abort;
	}

}

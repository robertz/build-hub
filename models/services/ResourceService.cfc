component output = "false" {

	// return a json resource from the db
	function getResource (required string id) {
		var params = {
			'id': { value: id, type: 'cf_sql_varchar' }
		};
		var rq = queryExecute("SELECT * FROM resources WHERE identifier = :id", params);
		return rq.recordCount ? deserializeJSON(rq.data) : {};
	}

	// return power/slots level data
	function getLevels () {
		return [
			{ 'level': 1, 'power': 1, 'slots': 0, 'inspirations': 3},
			{ 'level': 2, 'power': 1, 'slots': 0, 'inspirations': 4},
			{ 'level': 3, 'power': 0, 'slots': 2, 'inspirations': 8},
			{ 'level': 4, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 5, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 6, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 7, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 8, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 9, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 10, 'power': 1, 'slots': 0, 'inspirations': 10},
			{ 'level': 11, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 12, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 13, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 14, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 15, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 16, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 17, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 18, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 19, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 20, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 21, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 22, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 23, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 24, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 25, 'power': 0, 'slots': 2, 'inspirations': 15},
			{ 'level': 26, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 27, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 28, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 29, 'power': 0, 'slots': 2, 'inspirations': 0},
			{ 'level': 30, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 31, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 32, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 33, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 34, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 35, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 36, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 37, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 38, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 39, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 40, 'power': 0, 'slots': 3, 'inspirations': 20},
			{ 'level': 41, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 42, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 43, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 44, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 45, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 46, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 47, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 48, 'power': 0, 'slots': 3, 'inspirations': 0},
			{ 'level': 49, 'power': 1, 'slots': 0, 'inspirations': 0},
			{ 'level': 50, 'power': 0, 'slots': 3, 'inspirations': 0}
		]
	}

	// Return data needed to display playable ATs
	function getArchetypes () {
		var res = cacheGet("archetypes");
		if (isNull(res)) {
			var ATs = [];
			var data = getResource(id = 'I12');
			data.archetypes.each(function(at) {
				if (at.keyExists("Playable")) {
					ATs.append({
						'displayName': at.displayName,
						'className': at.className,
						'primaryGroup': at.primaryGroup,
						'secondaryGroup': at.secondaryGroup
					});
				}
			});
			cachePut("archetypes", ATs);
			res = ATs;
		}
		return res;
	}
}
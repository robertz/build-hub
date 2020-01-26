component output = "false" {

	function init () {
		return this;
	}

	function getBuilds () {
		var buildSQL = "SELECT builds.id, builds.archetype, builds.primary, builds.secondary, builds.title, builds.description, users.username AS author FROM builds, users WHERE builds.author = users.id";
		return queryExecute(buildSQL);
	}

	function getBuild (required string id) {
		var buildSQL = "SELECT builds.id, builds.archetype, builds.primary, builds.secondary, builds.title, builds.description, users.username AS author FROM builds, users WHERE builds.author = users.id AND builds.id = :id";
		return queryExecute(buildSQL, { "id": { value: id, type: "cf_sql_varchar" }});
	}

}
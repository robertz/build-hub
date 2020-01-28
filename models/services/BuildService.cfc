component output = "false" {

	function init () {
		return this;
	}

	function getBuilds () {
		var buildSQL = "
			SELECT builds.id, builds.archetype, builds.primary, builds.secondary, builds.title, builds.description, users.username AS author
			FROM builds, users
			WHERE builds.author = users.id";
		return queryExecute(buildSQL);
	}

	function getBuild (required string id) {
		var buildSQL = "
			SELECT builds.id, builds.archetype, builds.primary, builds.secondary, builds.title, builds.description, users.username AS author
			FROM builds, users
			WHERE builds.author = users.id AND builds.id = :id";
		return queryExecute(buildSQL, { "id": { value: id, type: "cf_sql_varchar" }});
	}

	function putBuild (required struct criteria) { // persist a build
		var defaults = {
			'id': "",
			'archetype': "",
			'primary': "",
			'secondary': "",
			'title': "",
			'description': ""
		};
		criteria.append(defaults, false);
		var isInsert = !criteria.id.len() ? true : false;
		if(isInsert){
			var params = {
				'id': { value: lcase(createUUID()), type: "cf_sql_varchar" },
				'author': { value: client.userId, type: "cf_sql_varchar" },
				'archetype': { value: criteria.archetype, type: "cf_sql_varchar" },
				'primary': { value: criteria.primary, type: "cf_sql_varchar" },
				'secondary': { value: criteria.secondary, type: "cf_sql_varchar" },
				'title': { value: criteria.title, type: "cf_sql_varchar" },
				'description': { value: criteria.description, type: "cf_sql_longvarchar" },
			};
			var sqlString = "
				INSERT INTO builds (id, author, archetype, `primary`, secondary, title, description)
				VALUES (:id, :author, :archetype, :primary, :secondary, :title, :description)";
			queryExecute(sqlString, params);
		} else {
			var params = {
				'id': { value: criteria.id, type: "cf_sql_varchar" },
				'archetype': { value: criteria.archetype, type: "cf_sql_varchar" },
				'primary': { value: criteria.primary, type: "cf_sql_varchar" },
				'secondary': { value: criteria.secondary, type: "cf_sql_varchar" },
				'title': { value: criteria.title, type: "cf_sql_varchar" },
				'description': { value: criteria.description, type: "cf_sql_longvarchar" },
			};
			var sqlString = "
				UPDATE builds
				SET archetype = :archetype, `primary` = :primary, secondary = :secondary, title = :title, description = :description
				WHERE id = :id";
			queryExecute(sqlString, params);
		}
		return;
	}

}
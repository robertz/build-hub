component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function init () {
		return this;
	}

	function hashString (required string strToHash) {
		var hashed = strToHash & ":3c0a4039-5e55-409a-8572f3d52f4062b3";
		var reps = 384;
		for (var i = 1; i <= reps; i++) hashed = lcase(hash(hashed, "SHA-256"));
		return hashed;
	}

	function validateLogin (required string user, required string pass) {
		var params = {
			'user': { value: lcase(user), type: "cf_sql_varchar" },
			'pass': { value: hashString(pass), type: "cf_sql_varchar" }
		};
		var q = queryExecute("SELECT * FROM users WHERE LCASE(username) = :user and password = :pass", params);
		return q.recordCount ? q.id : variables.defaultUser;
	}

}
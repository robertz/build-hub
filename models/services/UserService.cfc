component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function init () {
		return this;
	}

	function hashString (required string strToHash) {
		var salt = "3c0a4039-5e55-409a-8572f3d52f4062b3";
		var str = strToHash & ":" & salt;
		var reps = 384;
		var hashed = str;
		for (var i = 1; i <= reps; i++) {
			hashed = lcase(hash(hashed, "SHA-256"));
		}
		return hashed;
	}

	function validateLogin (required string user, required string pass) {
		var q = queryExecute("SELECT * FROM users WHERE LCASE(username) = ? and password = ?", [ lcase(user), hashString(pass)], { datasource: "web"} );
		return q.recordCount ? q.id : variables.defaultUser;
	}

}
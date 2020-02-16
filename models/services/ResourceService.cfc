component output = "false" {

	function getResource (required string id) {
		var params = {
			'id': { value: id, type: 'cf_sql_varchar' }
		};
		var rq = queryExecute("SELECT * FROM resources WHERE identifier = :id", params);
		return rq.recordCount ? deserializeJSON(rq.data) : {};
	}

}
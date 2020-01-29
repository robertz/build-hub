component output = "false" {

	property name = "BuildService" inject;

	function index(event, rc, prc){
		var res = {
			'meta_data': {

			},
			'errors': [],
			'response': {}
		}
		if(rc.keyExists("id")){
			res.response.append(BuildService.getBuild(id = rc.id)[1]);
		} else {
			res.response['builds'] = BuildService.getBuilds();
		}

		return res;
	}

	function update (event, rc, prc) {
		if(isJSON(toString(event.getHTTPContent()))){
			rc.append(deserializeJSON(toString(event.getHTTPContent())));
		}
		var res = {
			'meta_data': {},
			'errors': [],
			'response': {}
		}
		BuildService.putBuild(rc);
		return res;
	}

}
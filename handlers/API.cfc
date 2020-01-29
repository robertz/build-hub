component output = "false" {

	property name = "BuildService" inject;

	function index(event, rc, prc){
		var res = {
			'meta_data': {
				'code': 200,
				'message': "success",
				'status': "success",
    			'type': "OK"
			},
			'errors': [],
			'response': {}
		}

		try{
			if(rc.keyExists("id")){
				res.response.append(BuildService.getBuild(id = rc.id)[1]);
			} else {
				res.response['builds'] = BuildService.getBuilds();
			}
		}
		catch(any e){
			res.meta_data.code = 400;
			res.meta_data.message = "error";
			res.meta_data.status = "error";
			res.meta_data.type = "error";
		}

		return res;
	}

	function update (event, rc, prc) {
		if(isJSON(toString(event.getHTTPContent()))){
			rc.append(deserializeJSON(toString(event.getHTTPContent())));
		}
		var res = {
			'meta_data': {
				'code': 200,
				'message': "success",
				'status': "success",
    			'type': "OK"
			},
			'errors': [],
			'response': {}
		}
		BuildService.putBuild(rc);
		return res;
	}

	function delete(event, rc, prc) {
		var res = {
			'meta_data': {
				'code': 200,
				'message': "success",
				'status': "success",
    			'type': "OK"
			},
			'errors': [],
			'response': {}
		}
		if(rc.keyExists("id")){
			try{
				var b = BuildService.getBuild(id = rc.id)[1];
				if(b.authorId == client.userId) BuildService.deleteBuild(rc.id);
			}
			catch(any e){}
		}
		return res;
	}

}
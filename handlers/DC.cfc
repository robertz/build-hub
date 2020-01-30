component output = "false" {

	property name = "BuildService" inject;
	property name = "UserService" inject;

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
		// merge http content to rc
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

	function validateLogin(event, rc, prc) {
		var res = {
			'meta_data': {
				'code': 400,
				'message': "User already exists",
				'status': "Bad request",
    			'type': "Bad request"
			},
			'errors': [],
			'response': {}
		}
		if(rc.keyExists("user")){
			var ue = UserService.userExists(rc.user);
			res['meta_data']['code'] = ue ? 400 : 200;
			res['meta_data']['message'] = ue ? "User already exists" : "User available";
			res['meta_data']['status'] = ue ? "Bad request" : "success";
			res['meta_data']['type'] = ue ? "Bad request" : "OK";
		}
		return res;
	}

	function createAccount(event, rc, prc) {
		// merge http content to rc
		if(isJSON(toString(event.getHTTPContent()))){
			rc.append(deserializeJSON(toString(event.getHTTPContent())));
		}

		// token was not passed in or doesn't match
		if(!rc.keyExists("token") || rc.token != client.cfid){
			return {
				'meta_data': {
					'code': 401,
					'message': "Invalid token",
					'status': "Unauthorized",
					'type': "Unauthorized"
				},
				'errors': [],
				'response': {}
			}
		}

		var res = {
			'meta_data': {
				'code': 200,
				'message': "Account creation successful",
				'status': "success",
    			'type': "success"
			},
			'errors': [],
			'response': {}
		};

		var qRes = {};
		try{
			qRes.append(UserService.createAccount(rc.user, rc.pass));
			client['userId'] = qRes.sqlParameters[1];
		}
		catch(any e){}

		return res;
	}

}
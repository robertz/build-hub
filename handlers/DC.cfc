component output = "false" {

	property name = "BuildService" inject;
	property name = "UserService" inject;
	property name = "AntiSamy" inject = "antisamy@cbantisamy";
	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	// builds getter
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
		try {
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

	// create/update build
	// needs to be cleaned up
	function update (event, rc, prc) {
		// merge http content to rc
		if(isJSON(toString(event.getHTTPContent()))){
			rc.append(deserializeJSON(toString(event.getHTTPContent())));
		}
		// sanitize all inputs
		for(var k in rc){
			rc[k] = AntiSamy.clean(rc[k]);
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
		// validate the user owns the build
		var b = (rc.keyExists("id") && rc.id.len()) ? BuildService.getBuild(id = rc.id) : [];
		// there is an id and the author matches the logged in user OR no id and the user is logged in
		if((b.len() && b[1].authorId == client.userId) || (!rc.id.len() && client.userId != defaultUser) ) {
			BuildService.putBuild(rc);
		} else {
			res['meta_data'] = {
				'code': 401,
				'message': "You are not authorized to perform this action",
				'status': "Unauthorized",
    			'type': "error"
			};
		}
		return res;
	}

	// delete build
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
			var b = BuildService.getBuild(id = rc.id);
			if(b.len() && b[1].authorId == client.userId){
				BuildService.deleteBuild(rc.id);
			} else {
				res['meta_data'] = {
					'code': 401,
					'message': "You are not authorized to update the build",
					'status': "Unauthorized",
					'type': "error"
				};
			}
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
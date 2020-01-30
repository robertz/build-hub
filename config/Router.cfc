component{

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		route("/dc/build/:id?")
			.withAction({
				GET: 'index',
				POST: 'update',
				PUT: 'update',
				DELETE: 'delete'
			})
			.toHandler("dc");


		post("/dc/account/create")
			.to("dc.createAccount")


		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
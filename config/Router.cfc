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

		route("/api/build/:id?")
			.withAction({
				GET: 'index',
				POST: 'update',
				PUT: 'update',
				DELETE: 'delete'
			})
			.toHandler("api");


		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
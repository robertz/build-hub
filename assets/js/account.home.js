new Vue({
	el: '#app',
	data() {
		return {
			builds: window.kdfe.builds
		}
	},
	methods: {
		removeBuild: function ( buildId ) {

			fetch(`/api/build/${buildId}`, {
				method: 'DELETE',
			})
			.then(res => res.json())
			.then(res => {
				document.location = document.location.href
			});
		}
	}
})
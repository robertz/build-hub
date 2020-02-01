new Vue({
	el: '#app',
	data() {
		return {
			id: window.kdfe.id,
			archetype: window.kdfe.archetype,
			primary: window.kdfe.primary,
			secondary: window.kdfe.secondary,
			title: window.kdfe.title,
			description: window.kdfe.description,

			archetypes: window.kdfe.at,
			pools: window.kdfe.pools

		}
	},
	methods: {
		submitForm: function () {

			var postBody = {
				id: this.id,
				archetype: this.archetype,
				primary: this.primary,
				secondary: this.secondary,
				title: this.title,
				description: this.description
			}

			fetch('/dc/build', {
				method: 'PUT',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(postBody)
			})
			.then(res => res.json())
			.then(res => {
				document.location = '/account'
			});
		}
	},
	computed: {
		atPrimary: function () {
			if(!(this.archetype in this.pools)) return []
			return this.pools[this.archetype].primary
		},
		atSecondary: function () {
			if (!(this.archetype in this.pools)) return []
			return this.pools[this.archetype].secondary || []
		}
	}
})
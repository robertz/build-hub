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
		adjustPools: function () {
			// if we switch powersets default to the first power
			this.primary = (this.primary in this.pools[this.archetype].primary) ? this.primary : this.pools[this.archetype].primary[0]
			this.secondary = (this.secondary in this.pools[this.archetype].secondary) ? this.secondary : this.pools[this.archetype].secondary[0]
		},
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
		},
		detectBuild: function () {
			let parsed = this.description.split('\n')
			let atLine = parsed.filter(line => {
				return line.includes('Level')
			})
			let primaryLine = parsed.filter(line => {
				return line.includes('Primary Power Set:')
			})
			let secondaryLine = parsed.filter(line => {
				return line.includes('Secondary Power Set:')
			})
			let detectedAT = ''
			for (i in this.archetypes) {
				detectedAT = atLine[0].includes(this.archetypes[i]) ? this.archetypes[i] : detectedAT
			}
			let detectedPrimary = primaryLine[0].replace('Primary Power Set:', '').trim()
			let detectedSecondary = secondaryLine[0].replace('Secondary Power Set:', '').trim()
			this.archetype = detectedAT
			this.primary = detectedPrimary
			this.secondary = detectedSecondary
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
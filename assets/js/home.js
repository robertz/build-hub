new Vue({
	el: '#app',
	data() {
		return {
			builds: window.kdfe.builds,
			filteredAT: ''
		}
	},
	computed: {
		distinctATs: function () {
			let distinct = []
			this.builds.forEach(b => {
				if (distinct.indexOf(b.archetype) < 0) {
					distinct.push(b.archetype)
				}
			})
			return distinct
		},
		filteredBuilds: function () {
			let filtered = this.builds;
			if (!this.filteredAT.length) return filtered

			filtered = this.builds.filter(b => {
				return b.archetype === this.filteredAT ? true : false
			})
			return filtered
		}
	}
})
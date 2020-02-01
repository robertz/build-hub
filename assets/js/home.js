new Vue({
	el: '#app',
	data() {
		return {
			builds: window.kdfe.builds,
			filteredAT: '',
			filteredPrimary: '',
			filteredSecondary: ''
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
		distinctPrimaries: function () {
			let distinct = []
			this.builds.forEach(b => {
				if (distinct.indexOf(b.primary) < 0) {
					distinct.push(b.primary)
				}
			})
			return distinct
		},
		distinctSecondaries: function () {
			let distinct = []
			this.builds.forEach(b => {
				if (distinct.indexOf(b.secondary) < 0) {
					distinct.push(b.secondary)
				}
			})
			return distinct
		},
		filteredBuilds: function () {
			let filtered = this.builds;
			if (!this.filteredAT.length && !this.filteredPrimary.length && !this.filteredSecondary.length) return filtered

			if(this.filteredAT.length){
				filtered = filtered.filter(b => {
					return b.archetype === this.filteredAT ? true : false
				})
			}

			if (this.filteredPrimary.length) {
				filtered = filtered.filter(b => {
					return b.primary === this.filteredPrimary ? true : false
				})
			}

			if (this.filteredSecondary.length) {
				filtered = filtered.filter(b => {
					return b.secondary === this.filteredSecondary ? true : false
				})
			}

			return filtered
		}
	},
	filters: {
		ago: function (value) {
			return new moment(value).fromNow()
		}
	}
})
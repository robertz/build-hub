new Vue({
	el: '#app-account',
	data() {
		return {
			valid: null,
			user: "",
			pass: "",
			token: window.kdfe.token
		}
	},
	methods: {
		validateUser: function () {
			fetch('/dc/validateLogin/user/' + this.user )
				.then(res => res.json())
				.then(res => {
					this.valid = !!(res.meta_data.code === 200)
				});
		},
		createAccount: function () {
			let postBody = {
				"user": this.user,
				"pass": this.pass,
				"token": this.token
			}
			fetch('/dc/account/create', {
				method: 'POST',
				headers: {
					'Content-Type': "application/json"
				},
				body: JSON.stringify(postBody)
			})
			.then(res => res.json())
			.then(res => {
				if(res.meta_data.code === 200) document.location = "/"
			});
		}
	},
	computed: {
		formValid() {
			return this.valid && this.pass.length
		}
	}
})
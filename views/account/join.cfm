<cfoutput>
<div id="app-account" class="content-container" style="width: 500px; margin: auto;">
	<p>Login stuff here</p>
	<div class="row">
		<div class="col-3 p-2">
			Username
		</div>
		<div class="col-7">
			<input type="text" class="form-control mb-1" v-model="user" v-on:blur="validateUser"/>
		</div>
		<div class="col-2 pt-2">
			<i class="fa fa-check fa-lg" aria-hidden="true" style="color: green;" v-if="valid === true"></i>
			<i class="fa fa-ban fa-lg" aria-hidden="true" style="color: red;" v-if="valid === false"></i>
		</div>

		<div class="col-3 p-2">
			Password
		</div>
		<div class="col-7">
			<input type="password" class="form-control mb-2" v-model="pass" />
		</div>
		<div class="col-2"></div>


		<div class="col-3">
		</div>
		<div class="col-7">
			<input type="button" class="btn btn-primary" value="Create Account" :disabled="!formValid" v-on:click="createAccount" />
		</div>

	</div>
</div>
<script language="javascript" src="/assets/js/account.create.js?v=#application.jsver#"></script>
</cfoutput>
<cfoutput>
<div id="app">
	<div class="row">
		<div class="col-4">
			<select v-model="cls" class="form-control">
				<option v-for="at in archetypes" :value="at.className">{{ at.displayName }}</option>
			</select>
		</div>
		<div class="col-8">

		</div>
	</div>
</div>
<script src="/assets/js/designer.js?v=#application.jsver#"></script>
</cfoutput>
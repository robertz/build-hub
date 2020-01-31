<cfoutput>
<div class="content-container" id="app">
	<p>City of Heroes Build Database<p>
	<div class="row build-container" v-for="build in builds">
		<div class="col-2">
			{{ build.primary }} / {{ build.secondary }} {{ build.archetype }}
		</div>
		<div class="col-10">
			<a v-bind:href="'/build/view/id/' + build.id">{{ build.title }}</a><br />
			{{ build.author }}
		</div>
	</div>
</div>
<script language="javascript" src="/assets/js/home.js?v=#application.jsver#"></script>
</cfoutput>
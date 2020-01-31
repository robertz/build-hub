<cfoutput>
<div class="content-container" id="app">
	<p>City of Heroes Build Database<p>

	<div style="border-radius: 8px; border: 1px solid silver; margin: 4px; padding: 4px; background-color: skyblue;" class="mb-3">
		<h6>Filter Builds</h6>
		<div class="row">
			<div class="col-md-2 col-xs-12">
				Archetype:
			</div>
			<div class="col-md-2 col-xs-12">
				<select  v-model="filteredAT">
					<option value="">All</option>
					<option v-for="at in distinctATs" :value="at">{{ at }}</option>
				</select>
			</div>
		</div>
	</div>

	<div class="row build-container" v-for="build in filteredBuilds">
		<div class="col-4">
			{{ build.primary }} / {{ build.secondary }} {{ build.archetype }}
		</div>
		<div class="col-8">
			<a v-bind:href="'/build/view/id/' + build.id">{{ build.title }}</a><br />
			{{ build.author }}
		</div>
	</div>
</div>
<script language="javascript" src="/assets/js/home.js?v=#application.jsver#"></script>
</cfoutput>
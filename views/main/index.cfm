<cfoutput>
<div class="content-container" id="app">
	<p>City of Heroes Build Database<p>

	<div class="card mb-3">
		<div class="card-body bg-dark text-white">
			<h5 class="card-title">Filter</h5>
			<div class="row">
				<div class="col-3">
					<select class="form-control" v-model="filteredAT">
						<option value="">All</option>
						<option v-for="at in distinctATs" :value="at">{{ at }}</option>
					</select>
				</div>
			</div>
		</div>
	</div>

	<table class="table table-dark table-striped">
		<thead>
			<tr>
				<th scope="col">AT</th>
				<th scope="col">Powersets</th>
				<th scope="col">Description</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="build in filteredBuilds">
				<td>{{ build.archetype }}</td>
				<td>{{ build.primary }} / {{ build.secondary }}</td>
				<td><a v-bind:href="'/build/view/id/' + build.id">{{ build.title }}</a><br />{{ build.author }}</td>
			</tr>
		</tbody>
	</table>

</div>
<script language="javascript" src="/assets/js/home.js?v=#application.jsver#"></script>
</cfoutput>
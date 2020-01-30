<cfoutput>
<div id="app" class="content-container">
	<h5>Account Management</h5>

	<p>
		<a href="/main/logout" class="btn btn-danger">Log Out</a>
	</p>

	<h6>Your builds</h6>
	<table class="table table-condensed table-dark table-striped">
		<thead>
			<tr>
				<th></th>
				<th>Archetype</th>
				<th>Primary</th>
				<th>Secondary</th>
				<th>Title</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="build in builds">
				<td>
					<i class="fas fa-trash-alt" v-on:click="removeBuild( build.id )"></i>
					<i class="fas fa-edit" v-on:click="edit( build.id )"></i>
				</td>
				<td><a v-bind:href="'/build/view/id/' + build.id">{{ build.archetype }}</a></td>
				<td>{{ build.primary }}</td>
				<td>{{ build.secondary }}</td>
				<td>{{ build.title }}</td>
			</tr>
		</tbody>
	</table>
	<p><a href="/build/create" class="btn btn-primary">Create a Build</a></p>
</div>
<script language="javascript" src="/assets/js/account.home.js"></script>
</cfoutput>
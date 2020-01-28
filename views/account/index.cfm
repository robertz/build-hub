<cfoutput>
<div class="content-container">
	<h5>Account Management</h5>

	<h6>Your builds</h6>
	<table class="table table-condensed table-dark table-striped">
		<thead>
			<tr>
				<th>Archetype</th>
				<th>Primary</th>
				<th>Secondary</th>
				<th>Title</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="#prc.builds#">
				<tr>
					<td><a href="/build/view/id/#id#">#archetype#</a></td>
					<td>#primary#</td>
					<td>#secondary#</td>
					<td>#title#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	<p><a href="/builds/create" class="btn btn-primary">Create a Build</a></p>
</div>
</cfoutput>
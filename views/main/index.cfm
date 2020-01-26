<cfoutput>
<div class="content-container">
	<p>City of Heroes Build Database<p>

	<table class="table table-condensed table-dark table-striped">
		<thead>
			<tr>
				<th>Archetype</th>
				<th>Primary</th>
				<th>Secondary</th>
				<th>Title</th>
				<th>Added By</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="#prc.builds#">
				<tr>
					<td><a href="/build/view/id/#id#">#archetype#</a></td>
					<td>#primary#</td>
					<td>#secondary#</td>
					<td>#title#</td>
					<td>#author#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</div>
</cfoutput>
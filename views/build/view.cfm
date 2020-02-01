<cfoutput>
<div class="content-container table-responsive">

	<table class="table table-dark table-bordered">
		<tr>
			<td style="width: 175px;">Archetype</td>
			<td>#prc.build.archetype#</td>
		</tr>

		<tr>
			<td>Primary</td>
			<td>#prc.build.primary#</td>
		</tr>

		<tr>
			<td>Secondary</td>
			<td>#prc.build.secondary#</td>
		</tr>

		<tr>
			<td>Title</td>
			<td>#prc.build.title#</td>
		</tr>

		<tr>
			<td>Created</td>
			<td>#dateFormat(prc.build.created, "dd-mmm-yy")# at #timeFormat(prc.build.created, "h:mm tt")#</td>
		</tr>

		<tr>
			<td>Updated</td>
			<td>#dateFormat(prc.build.updated, "dd-mmm-yy")# at #timeFormat(prc.build.updated, "h:mm tt")#</td>
		</tr>

		<tr>
			<td>Description</td>
			<td>
				<pre class="text-white">#prc.build.description#</pre>
			</td>
		</tr>
	</table>
</div>
</cfoutput>
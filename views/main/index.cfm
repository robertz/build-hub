<cfoutput>
<div class="content-container">
	<p>City of Heroes Build Database<p>

	<cfloop query="#prc.builds#">
		<div class="row build-container">
			<div class="col-2">
				#primary# /
				#secondary#
				#archetype#
			</div>
			<div class="col-10">
				<a href="/build/view/id/#id#">#title#</a><br />
				#author#
			</div>
		</div>
	</cfloop>

</div>
</cfoutput>
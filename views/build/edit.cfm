<cfoutput>
<form action="/build/update" method="post">

	<cfif prc.keyExists("id") and prc.id.len()>
		<input type="hidden" name="id" value="#prc.id#" />
	</cfif>

	<div class="content-container">
		<div class="row">
			<div class="col-2">Archetype</div>
			<div class="col-10"><input type="text" name="archetype" class="form-control" value="#prc.archetype#" /></div>

			<div class="col-2">Primary</div>
			<div class="col-10"><input type="text" name="primary" class="form-control" value="#prc.primary#" /></div>

			<div class="col-2">Secondary</div>
			<div class="col-10"><input type="text" name="secondary" class="form-control" value="#prc.secondary#" /></div>

			<div class="col-2">Title</div>
			<div class="col-10"><input type="text" name="title" class="form-control" value="#prc.title#" /></div>

			<div class="col-2">Description</div>
			<div class="col-10" style="height: 100vh;"><textarea name="description" style="width: 100%; height: 100vh;">#prc.description#</textarea></div>
		</div>
		<input type="submit" value="Submit" />
	</div>
</form>
</cfoutput>
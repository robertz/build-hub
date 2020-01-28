<cfoutput>
<form action="/build/update" method="post">

	<cfif prc.keyExists("id") and prc.id.len()>
		<input type="hidden" name="id" value="#prc.id#" />
	</cfif>

	<div class="content-container">
		<div class="row">
			<div class="col-2">Archetype</div>
			<div class="col-10"><input type="text" name="archetype" class="form-control mt-1 mb-1" value="#prc.archetype#" required /></div>

			<div class="col-2">Primary</div>
			<div class="col-10"><input type="text" name="primary" class="form-control mt-1 mb-1" value="#prc.primary#" required /></div>

			<div class="col-2">Secondary</div>
			<div class="col-10"><input type="text" name="secondary" class="form-control mt-1 mb-1" value="#prc.secondary#" required /></div>

			<div class="col-2">Title</div>
			<div class="col-10"><input type="text" name="title" class="form-control mt-1 mb-1" value="#prc.title#" required /></div>

			<div class="col-2">Description</div>
			<div class="col-10" style="height: 100vh;"><textarea name="description" class="form-control mt-1 mb-1" style="width: 100%; height: 100vh;" required>#prc.description#</textarea></div>

			<div class="col-2"></div>
			<div class="col-10"><br /><input type="submit" class="btn btn-primary" value="Submit" /></div>

		</div>

	</div>
</form>
</cfoutput>
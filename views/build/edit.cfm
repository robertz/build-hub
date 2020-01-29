<cfoutput>
<div id="app" class="content-container">
	<div class="row">
		<div class="col-2">Archetype</div>
		<div class="col-10"><input type="text" v-model="archetype" class="form-control mt-1 mb-1" required /></div>

		<div class="col-2">Primary</div>
		<div class="col-10"><input type="text" v-model="primary" class="form-control mt-1 mb-1" required /></div>

		<div class="col-2">Secondary</div>
		<div class="col-10"><input type="text" v-model="secondary" class="form-control mt-1 mb-1" required /></div>

		<div class="col-2">Title</div>
		<div class="col-10"><input type="text" v-model="title" class="form-control mt-1 mb-1" required /></div>

		<div class="col-2">Description</div>
		<div class="col-10" style="height: 25vh;"><textarea v-model="description" class="form-control mt-1 mb-1" style="width: 100%; height: 25vh;" required></textarea></div>

		<div class="col-2"></div>
		<div class="col-10"><br /><a class="btn btn-primary" v-on:click="submitForm">Submit</a></div>

	</div>
</div>
<script src="/assets/js/build.editor.js"></script>
</cfoutput>
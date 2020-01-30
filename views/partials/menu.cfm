<cfoutput>
<div class="fixed-header">
	<div class="container">
		<div class="brand">
			<a href="/"><strong>Build Hub</strong></a>
		</div>
		<cfif prc.isIdentified>
			<div class="menu-links">
				<a href="/account">My Account</a>
			</div>
		<cfelse>
			<div class="menu-links">
				<form action="/main/login" method="post">
				 	<div class="form-row">
					 	<div class="col">
							<input type="text" name="user" placeholder="Username" class="form-control" />
						</div>
						<div class="col">
							<input type="password" name="pass" placeholder="Password" class="form-control" />
						</div>
						<div class="col">
							<input type="submit" class="btn btn-primary" value="Login" />
							<input type="button" class="btn btn-success join-button" value="Join" />
						</div>
					</div>
				</form>
			</div>
		</cfif>
	</div>
</div>
<script language="javascript">
$(document).ready(function(){
	$(document)
	 	.on('click', '.join-button', function(e){
			document.location = '/account/join'
		})
});
</script>
</cfoutput>
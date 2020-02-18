component output = "false" {

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";
	property name = "UserService" inject;
	property name = "BuildService" inject;
	property name = "ResourceService" inject;
	property name = "SerializerService" inject;

	function index (event, rc, prc) {
		event.setLayout('Designer');

		// prc['jsonData']['arches'] = BuildService._getArchetypes();
		// prc['jsonData']['arch'] = BuildService.getClass(className = "Class_Blaster");

		// https://github.com/ImaginaryDevelopment/imaginary-hero-designer/blob/master/Base/Base/Data_Classes/Archetype.cs
		prc.jsonData.append({
			'archetypes': ResourceService.getArchetypes(),
			'character': {
				'name': "",
				'powersets': [0, 0, 0, 0, 0, 0, 0, 0]
			}
		});


		// var ec = SerializerService.serialize(prc.jsonData.archetype);


		// writeDump(var = ec, abort = false, label = "label");
		// writeDump(var = SerializerService.deserialize(ec), abort = true, label = "label");
	}

}
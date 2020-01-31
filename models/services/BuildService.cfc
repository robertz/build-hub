component output = "false" {

	property name = "AntiSamy" inject = "antisamy@cbantisamy";

	function init () {
		return this;
	}

	function getBuilds () {
		var buildSQL = "
			SELECT builds.id, builds.author AS authorId, builds.archetype, builds.primary, builds.secondary, builds.title, builds.created, builds.updated, users.username AS author
			FROM builds, users
			WHERE builds.author = users.id AND builds.deleted = 0
			ORDER BY builds.updated DESC";
		return queryExecute(buildSQL, [], { returnType: "array" });
	}

	function getBuildsByAccount (required string id) {
		var params = {
			'id': { value: id, type: "cf_sql_varchar" }
		};
		var buildSQL = "
			SELECT builds.id, builds.author AS authorId, builds.archetype, builds.primary, builds.secondary, builds.title, builds.created, builds.updated, users.username AS author
			FROM builds, users
			WHERE  builds.author = users.id AND builds.author = :id AND builds.deleted = 0
			ORDER BY builds.updated DESC";
		return queryExecute(buildSQL, params, { returnType: "array" });
	}

	function deleteBuild (required string id) {
		var params = {
			'id': { value: id, type: "cf_sql_varchar" }
		};
		var buildSQL = "
			UPDATE builds
			SET deleted = 1
			WHERE  id = :id";
		queryExecute(buildSQL, params);
		return true;
	}

	function getBuild (required string id) {
		var buildSQL = "
			SELECT builds.id, builds.author AS authorId, builds.archetype, builds.primary, builds.secondary, builds.title, builds.description, builds.created, builds.updated, users.username AS author
			FROM builds, users
			WHERE builds.author = users.id AND builds.id = :id AND builds.deleted = 0";
		return queryExecute(buildSQL, { "id": { value: id, type: "cf_sql_varchar" }}, { returnType: "array" });
	}

	function putBuild (required struct criteria) { // persist a build
		var defaults = {
			'id': "",
			'archetype': "",
			'primary': "",
			'secondary': "",
			'title': "",
			'description': ""
		};
		var res = {
			'isInsert': (!criteria.keyExists("id") || !criteria.id.len()) ? true : false,
			'authMatch': (!criteria.keyExists("id") || !criteria.id.len()) ? true : (getBuild(id = criteria.id)[1].authorId == client.userId)
		};
		criteria.append(defaults, false);
		if(res.isInsert){ // create build
			var params = {
				'id': { value: lcase(createUUID()), type: "cf_sql_varchar" },
				'author': { value: client.userId, type: "cf_sql_varchar" },
				'archetype': { value: AntiSamy.clean(criteria.archetype), type: "cf_sql_varchar" },
				'primary': { value: AntiSamy.clean(criteria.primary), type: "cf_sql_varchar" },
				'secondary': { value: AntiSamy.clean(criteria.secondary), type: "cf_sql_varchar" },
				'title': { value: AntiSamy.clean(criteria.title), type: "cf_sql_varchar" },
				'description': { value: AntiSamy.clean(criteria.description), type: "cf_sql_longvarchar" },
			};
			var sqlString = "
				INSERT INTO builds (id, author, archetype, `primary`, secondary, title, description)
				VALUES (:id, :author, :archetype, :primary, :secondary, :title, :description)";
			queryExecute(sqlString, params);
		} else {
			var params = { // update build
				'id': { value: criteria.id, type: "cf_sql_varchar" },
				'archetype': { value: AntiSamy.clean(criteria.archetype), type: "cf_sql_varchar" },
				'primary': { value: AntiSamy.clean(criteria.primary), type: "cf_sql_varchar" },
				'secondary': { value: AntiSamy.clean(criteria.secondary), type: "cf_sql_varchar" },
				'title': { value: AntiSamy.clean(criteria.title), type: "cf_sql_varchar" },
				'description': { value: AntiSamy.clean(criteria.description), type: "cf_sql_longvarchar" }
			};
			var sqlString = "
				UPDATE builds
				SET archetype = :archetype, `primary` = :primary, secondary = :secondary, title = :title, description = :description
				WHERE id = :id";
			if(res.authMatch) queryExecute(sqlString, params);
		}
		return res;
	}

	function getArchetypes () {
		return [
			'Blaster',
			'Controller',
			'Defender',
			'Scrapper',
			'Tank',
			'Mastermind',
			'Stalker',
			'Brute',
			'Dominator',
			'Corruptor',
			'Warshade',
			'Peacebringer',
			'Arachnos Soldier',
			'Arachnos Widow',
			'Sentinel'
		];
	}

	function getPowersets () {
		return {
			'Blaster': {
				'primary': [
					'Archery',
					'Assault Rifle',
					'Beam Rifle',
					'Dark Blast',
					'Dual Pistols',
					'Electrical Blast',
					'Energy Blast',
					'Ice Blast',
					'Psychic Blast',
					'Radiation Blast',
					'Sonic Attack',
					'Water Blast'
				],
				'secondary': [
					'Darkness Manipulation',
					'Devices',
					'Electricity Manipulation',
					'Energy Manipulation',
					'Fire Manipulation',
					'Ice Manipulation',
					'Martial Combat',
					'Mental Manipulation'
				]
			},
			'Brute': {
				'primary': [
					'Battle Axe',
					'Broad Sword',
					'Claws',
					'Dark Melee',
					'Electrical Melee',
					'Energy Melee',
					'Fiery Melee',
					'Katana',
					'Kinetic Melee',
					'Psionic Melee',
					'Radiation Melee',
					'Savage Melee',
					'Staff Fighting',
					'Stone Melee',
					'Street Justice',
					'Super Strength',
					'Titan Weapons',
					'War Mace'
				],
				'secondary': [
					'Bio Armor',
					'Dark Armor',
					'Electric Armor',
					'Energy Aura',
					'Fiery Aura',
					'Invulnerability',
					'Radiation Armor',
					'Regeneration',
					'Shield Defense',
					'Stone Armor',
					'Super Reflexes',
					'Willpower'
				]
			},
			'Controller': {
				'primary': [
					'Darkness Control',
					'Earth Control',
					'Electric Control',
					'Fire Control',
					'Gravity Control',
					'Ice Control',
					'Illusion Control',
					'Mind Control',
					'Plant Control',
					'Wind Control'
				],
				'secondary': [
					'Cold Domination',
					'Darkness Affinity',
					'Empathy',
					'Force Field',
					'Kinetics',
					'Nature Affinity',
					'Poison',
					'Radiation Emission',
					'Sonic Resonance',
					'Storm Summoning',
					'Thermal Radiation',
					'Time Manipulation',
					'Trick Arrow'
				]
			},
			'Corruptor': {
				'primary': [
					'Archery',
					'Assault Rifle',
					'Beam Rifle',
					'Dark Blast',
					'Dual Pistols',
					'Electrical Blast',
					'Energy Blast',
					'Ice Blast',
					'Psychic Blast',
					'Radiation Blast',
					'Sonic Attack',
					'Water Blast'
				],
				'secondary': [
					'Cold Domination',
					'Dark Miasma',
					'Kinetics',
					'Nature Affinity',
					'Pain Domination',
					'Poison',
					'Radiation Emission',
					'Sonic Resonance',
					'Storm Summoning',
					'Thermal Radiation',
					'Time Manipulation',
					'Traps',
					'Trick Arrow'
				]
			},
			'Defender': {
				'primary': [
					'Cold Domination',
					'Dark Miasma',
					'Empathy',
					'Force Field',
					'Kinetics',
					'Radiation Emission',
					'Sonic Resonance',
					'Storm Summoning',
					'Time Manipulation',
					'Traps',
					'Trick Arrow'
				],
				'secondary': [
					'Archery',
					'Assault Rifle',
					'Beam Rifle',
					'Dark Blast',
					'Dual Pistols',
					'Electrical Blast',
					'Energy Blast',
					'Ice Blast',
					'Psychic Blast',
					'Radiation Blast',
					'Sonic Attack',
					'Water Blast'
				]
			},
			'Dominator': {
				'primary': [
					'Darkness Control',
					'Earth Control',
					'Electric Control',
					'Fire Control',
					'Gravity Control',
					'Ice Control',
					'Mind Control',
					'Plant Control',
					'Wind Control'
				],
				'secondary': [
					'Dark Assault',
					'Earth Assault',
					'Electricity Assault',
					'Energy Assault',
					'Fiery Assault',
					'Icy Assault',
					'Martial Assault',
					'Psionic Assault',
					'Thorny Assault'
				]
			},
			'Mastermind': {
				'primary': [
					'Beast Mastery',
					'Demon Summoning',
					'Mercenaries',
					'Necromancy',
					'Ninjas',
					'Robotics',
					'Thugs'
				],
				'secondary': [
					'Dark Miasma',
					'Force Field',
					'Nature Affinity',
					'Pain Domination',
					'Poison',
					'Sonic Resonance',
					'Storm Summoning',
					'Thermal Radiation',
					'Time Manipulation',
					'Traps',
					'Trick Arrow',
				]
			},
			'Scrapper': {
				'primary': [
					'Battle Axe',
					'Broad Sword',
					'Claws',
					'Dark Melee',
					'Dual Blades',
					'Electrical Melee',
					'Fiery Melee',
					'Katana',
					'Kinetic Melee',
					'Psionic Melee',
					'Radiation Melee',
					'Savage Melee',
					'Spines',
					'Staff Fighting',
					'Street Justice',
					'Titan Weapons',
					'War Mace'
				],
				'secondary': [
					'Bio Armor',
					'Dark Armor',
					'Electric Armor',
					'Energy Aura',
					'Fiery Aura',
					'Invulnerability',
					'Radiation Armor',
					'Regeneration',
					'Shield Defense',
					'Super Reflexes',
					'Willpower'
				]
			},
			'Stalker': {
				'primary': [
					'Broad Sword',
					'Claws',
					'Dark Melee',
					'Dual Blades',
					'Electrical Melee',
					'Energy Melee',
					'Kinetic Melee',
					'Ninja Blade',
					'Psionic Melee',
					'Radiation Melee',
					'Savage Melee',
					'Spines',
					'Staff Fighting',
					'Street Justice'
				],
				'secondary': [
					'Bio Armor',
					'Dark Armor',
					'Electric Armor',
					'Energy Aura',
					'Ice Armor',
					'Ninjitsu',
					'Radiation Armor',
					'Regeneration',
					'Super Reflexes',
					'Willpower'
				]
			},
			'Tanker': {
				'primary': [
					'Bio Armor',
					'Dark Armor',
					'Electric Armor',
					'Fiery Aura',
					'Ice Armor',
					'Invulnerability',
					'Radiation Armor',
					'Shield Defense',
					'Stone Armor',
					'Super Reflexes',
					'Willpower'
				],
				'secondary': [
					'Battle Axe',
					'Dark Melee',
					'Dual Blades',
					'Electrical Melee',
					'Energy Melee',
					'Fiery Melee',
					'Ice Melee',
					'Kinetic Melee',
					'Psionic Melee',
					'Radiation Melee',
					'Savage Melee',
					'Staff Fighting',
					'Stone Melee',
					'Street Justice',
					'Super Strength',
					'Titan Weapons',
					'War Mace'
				]
			}
		}
	}

}
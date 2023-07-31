Wash = {}
Wash.Debug = false

Wash.Type = 'target' -- / 'zone', 'target'
Wash.Notify = 'ox' -- / 'ox', 'qb', 'esx'
Wash.DrawText = 'ox' -- / 'ox', 'qb' / -- for Wash.Type = 'zone'
Wash.Target = 'ox' -- / 'ox', 'qb' / -- for Wash.Type = 'target'
Wash.Inventory = 'ox' -- / 'ox', 'qb'
Wash.Progress = 'circle' -- / 'bar', 'circle' / -- ox_lib's
Wash.SkillCheck = 'ox' -- / WIP
Wash.Ban = false

Wash.QBDrawAlignment = 'top' -- / 'left', 'top', 'right' -- / For QB DrawText

Wash.PerItemDuration = true -- if true, wash duration will be based on how many markedbills you're gonna wash. ex. 1 markedbills = 5 seconds / 2 markedbills = 10 seconds / 5 markedbills = 25 seconds
Wash.Duration = 3 -- in seconds
Wash.Item = 'markedbills'

Wash.Tax = 0.9 -- currently set at 10% set to 1 to disable tax

Wash.Metadata = true -- Set to false if you're not using metadata
Wash.DefaultWorth = 100 -- if Wash.Metadata = false every markedbills will count as $100 each

Wash.Animation = { dict = 'missheist_agency3aig_23', clip = 'urinal_sink_loop'}

Wash.Locations = { -- For Target
	vec4(1135.84, -992.21, 46.13, 96.28),
	vec4(1135.67, -990.91, 46.11, 98.86),
	vec4(1135.47, -989.49, 46.11, 96.73),
	vec4(1135.32, -988.18, 46.11, 96.73)
}

Wash.Zones = { -- For Zones/Poly
    [1] = {
		vec3(1134.7399902344, -993.04998779297, 46.0),
		vec3(1137.0, -993.0, 46.0),
		vec3(1136.0, -987.0, 46.0),
		vec3(1134.0, -988.0, 46.0),
    }
}
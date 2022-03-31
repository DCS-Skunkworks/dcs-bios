import aircraftJson from "../json/AircraftAliases.json" assert { type: "json" }

// ensure that metadata end is first, then start, then commondata
const docdata = {};
docdata["MetadataEnd"] = {}
docdata["MetadataStart"] = {}
docdata["CommonData"] = {}

const modulesSet = new Set()
modulesSet.add("MetadataStart")
modulesSet.add("MetadataEnd")

// we can parse the values of AircraftAliases.json to find the json files for all modules
Object.entries(aircraftJson).forEach(entry => {
	const values = entry[1]
	if (values !== undefined && values !== null) {
		values.forEach(value => modulesSet.add(value))
	}
})

// once the first three items are added, all others should be added in alphabetical order
const modules = Array.from(modulesSet).sort()

for (let i = 0; i < modules.length; i++) {
	const module = modules[i]
	const { default: moduleJson } = await import(`../json/${module}.json`, { assert: { type: "json" } });
	docdata[module] = moduleJson
}

export { docdata }

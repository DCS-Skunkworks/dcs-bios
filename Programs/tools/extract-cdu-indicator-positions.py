#!python3

import os
import re
import json
from pprint import pprint

CDU_PATH=r"C:\Program Files\Eagle Dynamics\DCS World\Mods\aircraft\A-10C\Cockpit\Scripts\CDU\indicator\Implementation"

ADDTEXT_PATTERN=r'AddText\s*\(\s*"(?P<id>[^"]+)"\s*,\s*(?P<x>\d+)\s*,\s*(?P<y>\d+)\s*,\s*(?P<alignment>LFT|RGHT)'
ADDSTATICTEXT_PATTERN=r'AddStaticText\s*\(\s*"(?P<id>[^"]+)"\s*,\s*(?P<x>\d+)\s*,\s*(?P<y>\d+)\s*,\s*(?P<alignment>LFT|RGHT)'

cdu_indicator_map = {}

def parse_file(contents, filename):
	assert filename.lower().startswith("cdu_page_")
	cdu_page = filename.upper()[len("cdu_page_"):]
	assert cdu_page.lower().endswith(".lua")
	cdu_page = cdu_page[:-len(".lua")]
	statictext = False

	def handle_match(m):
		d = { "id": m.group("id"), "x": int(m.group("x")), "y": int(m.group("y")), "alignment": m.group("alignment") }
		d["cdu_pages"] = [cdu_page]
		d["statictext"] = statictext
		id = d["id"]

		if id not in cdu_indicator_map:
			cdu_indicator_map[id] = []

		for e in cdu_indicator_map[id]:
			if d["alignment"] == e["alignment"] and d["x"] == e["x"] and d["y"] == e["y"] and d["statictext"] == e["statictext"]:
				e["cdu_pages"].extend(d["cdu_pages"])
				return

		d["index"] = len(cdu_indicator_map[id])
		cdu_indicator_map[id].append(d)

	for m in re.finditer(ADDTEXT_PATTERN, contents):
		handle_match(m)
	statictext = True
	for m in re.finditer(ADDSTATICTEXT_PATTERN, contents):
		handle_match(m)

for dirpath, dirnames, filenames in os.walk(CDU_PATH):
	for filename in filenames:
		if filename.lower().endswith(".lua"):
			print(filename)
			with open(os.path.join(dirpath, filename), "r") as f:
				parse_file(f.read(), filename)

with open("CDU.json", "w") as f:
	json.dump(cdu_indicator_map, f, sort_keys=True, indent=4, separators=(",", ": "))

print("")

for k, v in cdu_indicator_map.items():
	if len(v) > 1:
		print("*** "+k)
		for d in v:
			pprint(d["cdu_pages"])
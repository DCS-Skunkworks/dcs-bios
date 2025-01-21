[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![Discord][discord-shield]][discord-url]
[![Release][release-shield]][release-url]
![Downloads][downloads-shield]

<br />
<div align="center">
  <a href="https://github.com/DCS-Skunkworks/dcs-bios">
    <img src="https://avatars.githubusercontent.com/u/34946890?s=200&v=4" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">DCS-BIOS</h3>

  <p align="center">
    a DCS data exporting tool
    <br />
    <a href="https://github.com/DCS-Skunkworks/dcs-bios/wiki"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/DCS-Skunkworks/dcs-bios/discussions">Ask a Question</a>
    ·
    <a href="https://github.com/DCS-Skunkworks/dcs-bios/issues/new?assignees=charliefoxtwo&labels=bug%2Cneeds+triage&projects=&template=10_bug_report.yml">Report Bug</a>
    ·
    <a href="https://github.com/DCS-Skunkworks/dcs-bios/issues/new?assignees=charliefoxtwo&labels=enhancement%2Cneeds+triage&projects=&template=20_control_request.yml">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
      <ul>
        <li><a href="#panel-builders">Panel Builders</a></li>
      </ul>
      <ul>
        <li><a href="#software-developers">Software Developers</a></li>
      </ul>
    <li><a href="#modules">Modules</a></li>
      <ul>
        <li><a href="#official">Official</a></li>
      </ul>
      <ul>
        <li><a href="#mods">Mods</a></li>
      </ul>
      <ul>
        <li><a href="#adding-a-mod">Adding a Mod</a></li>
      </ul>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

DCS-BIOS is an `Export.lua` script for use with [DCS: World][dcs-url], enabling external hardware and software to interact with the clickable cockpit of a DCS aircraft.

> [!NOTE]
> DCS-Skunkworks DCS-BIOS is a continuation of the [original DCS-BIOS][original-dcs-bios-url], which is no longer updated.

## Getting Started

Getting started with DCS-BIOS is easy! Just follow these simple steps. 

### Prerequisites

#### Find your DCS Scripts folder

Start by finding your DCS Saved Games folder. On Windows, this is likely either:
- `C:\Users\USERNAME\Saved Games\DCS`
- `C:\Users\USERNAME\Saved Games\DCS.openbeta`

Within that folder, you find the folder called `Scripts`. Create one if it does not exist. The final path should look like:
- `C:\Users\USERNAME\Saved Games\DCS\Scripts`
- `C:\Users\USERNAME\Saved Games\DCS.openbeta\Scripts`

### Installation

> [!Note]
> The process for updating DCS-BIOS is exactly the same as installing it.

1. Go to the [latest release][latest-release-url]
2. Download `DCS-BIOS_x.y.z.zip`
3. Extract the zip file
4. Within the extracted folder, copy the `DCS-BIOS` folder into the previously mentioned scripts folder.
5. **If your Scripts folder does not have an `Export.lua` file**, copy the `Export.lua` file over
6. **If your scripts folder _does_ have an `Export.lua` file**, add the following line to the end 
```dofile(lfs.writedir() .. [[Scripts\DCS-BIOS\BIOS.lua]])```

> [!Tip]
> Still having trouble? Check out our [wiki][wiki-url], ask a question in [Discussions][discussions-url] or get in touch on [Discord][discord-url].

## Usage

### Panel Builders

Arduino Users should download the `Source code (zip)` on the Release page to get all needed files.

You don't need to be a programmer or electrical engineer to build your own panels. The [DCS-BIOS User Guide][user-guide-url] includes step-by-step instructions on how to connect your panel to DCS using DCS-BIOS and the beginner-friendly [Arduino microcontroller platform](http://arduino.cc). You don't have to write any code yourself.

#### Connect DCS-BIOS stream to your serial ports

Both `socat` and [DCSBIOSBridge](dcsbiosbridge-url) can be used to connect to your device.

> [!Important]
> If using `socat`, the files in the .zip file must be unzipped directly in the socat folder. The path **must** be `/socat/socat.exe`

#### Debugging

If you are working a lot with hardware, it may come in handy to log and replay dcs-bios data. There are two scripts in [Programs/tools](Programs/tools/) that allow you to do so.

`python connect-logger.py` will log all dcs-bios data to `dcsbios_data.json`. Ensure that you start the logger before loading a mission in order to capture the mission-start message properly.

`python replay-log.py` will ask for a serial port like `connect-serial-port.cmd` and replay the data to that com-port. When it reaches the end of the file, it will loop forever until you close it. The first message will not be repeated as this is usualy the mission-start message and should only be sent once.

`dcsbios_data.json` This file contains the logged data in hex format. If you are familiar with the format of dcs-bios messages, you may modify the file by hand if needed. The included sample file is a recording of the A-10C with a blinking Master Caution light.

### Software Developers

The [Developer Guide][developer-guide-url] explains how to connect to and interpret the DCS-BIOS export data stream and how to send commands to DCS-BIOS in order to operate controls inside the cockpit.

There are also a variety of client libraries available, including (but not limited to):
| Language | Library |
|-|-|
| C# | [DCS-BIOS Communicator](client-lib-dcs-bios-communicator-url) |

## Modules

> [!Note]
> Aircraft with multiple variants (e.g. A-10C/A-10C II, F-14A/B, etc.) are considered single modules.

Currently, DCS-BIOS supports the following aircraft modules:

### Official
| Module | Status | Contributors |
|-|-|-|
| A-10C/A10C-II | ✅ | _FSF-Ian, WarLord_ |
| AH-64D | ✅ | _WarLord_ |
| AJS-37 | ✅ | _pdmarsh, WarLord, ArturDCS, Matchstick_ |
| AV-8B N/A | ✅ | _WarLord, Matchstick_ |
| Bf-109-K-4 | ✅ | _ArturDCS_ |
| C-101CC/EB | ✅ | _WarLord, cdpkobra_ |
| CH-47F | 🚧 | _[WIP](https://github.com/DCS-Skunkworks/dcs-bios/issues/926)_ |
| Christen Eagle II | ✅ | _WarLord, cdpkobra_ |
| F-14A/B | ✅ | _WarLord, ArturDCS, Bullitt_ |
| F-15E | ✅ | _WarLord, Maverick87Shaka_ |
| F-16C | ✅ | _WarLord, cdpkobra, Matchstick, BuzzKillington_ |
| F-4E | ✅ | |
| F-5E-3 | ✅ | _geebeer2, WarLord_ |
| F-86F | ✅ | _ArturDCS_ |
| F/A-18C | ✅ | _AndrewW_ |
| Fw 190 A-8 | ✅ | _WarLord, MD44_ |
| Fw 190 D-9 | ✅ | _ArturDCS_ |
| I-16 | ✅ | _WarLord, NightStalker_ |
| JF-17 | ✅ | _WarLord, cdpkobra_ |
| Ka-50/Ka-50 3 | ✅ | _airtom, WarLord_ |
| L-39ZA/C | ✅ | _kadda11, WarLord_ |
| M-2000C | ✅ | _Exo7, ArturDCS, Matchstick_ |
| MB-339 | ✅ | _WarLord_ |
| Mi-8MTV2 | ✅ | _ArturDCS, WarLord_ |
| Mi-24P | ✅ | _WarLord, BaD CrC_ |
| MiG-15bis | ✅ | _WarLord, Steve Gee_ |
| MiG-19P | ✅ | _WarLord_ |
| MiG-21Bis | ✅ | _wraith444_ |
| Mirage F1 | ✅ | _WarLord_ |
| Mosquito FB Mk.VI | ✅ | _WarLord_ |
| OH-58D | ✅ | |
| P-47D | ✅ | _WarLord, Donators_ |
| P-51D/TF-51D | ✅ | _pdmarsh_ |
| Spitfire LF Mk. IX | ✅ | _WarLord_ |
| SA342 | ✅ |  |
| UH-1H | ✅ | _FSF-Ian_ |
| Yak-52 | ✅ | _WarLord, cdpkobra_ |
| Flaming Cliffs (all modules) | ✅ | _danvac, WarLord_ |

### Full-Fidelity Mods

| Module | Status | Contributors | Link |
|-|-|-|-|
| A-4E-C | ✅ | _Dehuman, WarLord_ | [GitHub](https://github.com/heclak/community-a4e-c) |
| A-29B | ✅ | _WarLord_ | [GitHub](https://github.com/luizrenault/a-29b-community) |
| AH-6J | ✅ | _WarLord_ | [DCS Forums](https://forum.dcs.world/topic/228394-helicopter-efm-demo) |
| Alphajet | ✅ | _WarLord_ | [Developer](http://www.jetesons.com/telechargement.html) |
| Edge-540/Extra-330SR | ✅ | _WarLord_ | [Developer](http://virtualairrace.com/downloads/) |
| F-18E/F/G | ✅ |  | [DCS Forums](https://forum.dcs.world/topic/316971-cjs-super-hornet-community-mod-v23-official-thread/) |
| F-22A | ✅ | _WarLord_ | [Developer](https://grinnellidesigns.com/f22) |
| T-45 | ✅ | _WarLord_ | [DCS Forums](https://forum.dcs.world/topic/203816-vnao-t-45-goshawk/) |

### Flaming Cliffs Mods
- AC-130
- Civil Aircraft mod
- MIG-23UB Project
- Mirage F.1
- PAK-FA Project
- SU-30 FAMILY PROJECT
- Upuaut's Bell-47G
- Virtual Cockpits
- VSN-Mods


### Adding a Mod

DCS-BIOS supports many community mods out-of-the-box.

In order to a Flaming-Cliffs-based mod which is not supported by DCS-BIOS, add the following to the bottom of `DCS-BIOS/lib/AircraftList.lua`:

```lua
add("PlaneName", false)
```
> [!Tip]
> To get the correct plane name, open the DCS-BIOS Reference Tool (`MetadataStart`) while you fly that plane and look what value `_ACFT_NAME` has.

> [!Important]
> Please consider submitting a pull request to add support for the module to DCS-BIOS for all users!


## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You may also simply [open an issue][issues-url].

Please see [Contributing.md][contributing-url] for more information.

> [!Important]
> If you plan on submitting a pull request, **please** read the Contributing Guide first.

## License

Distributed under the `GPL 3.0` license. See [LICENSE][license-url] for more information.

The [original DCS-BIOS][original-dcs-bios-url] was created by [FSF]Ian under the `SimPL 2.0` license.

The copy of `socat` that comes with DCS-BIOS is licensed under `GPL 2.0` (see [Programs/socat/COPYING](Programs/socat/COPYING)).

## Contact

For questions, consider asking in our [Discussions][discussions-url] page, or reach out to us on [Discord][discord-url].

## Acknowledgments

- [Original DCS-BIOS][original-dcs-bios-url]
- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
- [luacheck](https://github.com/lunarmodules/luacheck)
- [LuaUnit](https://github.com/bluebird75/luaunit)
- [StyLua](https://github.com/JohnnyMorganz/StyLua)
- [lua-language-server](https://github.com/LuaLS/lua-language-server)

## Related Projects

- [Arduino Library](https://github.com/DCS-Skunkworks/dcs-bios-arduino-library)
- [Arduino Examples](https://github.com/DCS-Skunkworks/dcs-bios-arduino_examples)
- [Bort DCS-BIOS Reference Tool](https://github.com/DCS-Skunkworks/bort)
- [BIOSBuddy DCS-BIOS Reference Tool](https://github.com/DCS-Skunkworks/biosbuddy)
- [DCS-BIOS Bridge](https://github.com/DCS-Skunkworks/dcsbiosbridge)


[contributors-shield]: https://img.shields.io/github/contributors/DCS-Skunkworks/dcs-bios.svg?style=for-the-badge
[contributors-url]: https://github.com/DCS-Skunkworks/dcs-bios/graphs/contributors
[issues-shield]: https://img.shields.io/github/issues/DCS-Skunkworks/dcs-bios.svg?style=for-the-badge
[issues-url]: https://github.com/DCS-Skunkworks/dcs-bios/issues
[license-shield]: https://img.shields.io/github/license/DCS-Skunkworks/dcs-bios.svg?style=for-the-badge
[license-url]: https://github.com/DCS-Skunkworks/dcs-bios/blob/main/LICENSE
[release-shield]: https://img.shields.io/github/release/DCS-Skunkworks/dcs-bios.svg?style=for-the-badge
[release-url]: https://github.com/DCS-Skunkworks/dcs-bios/releases
[discord-shield]: https://img.shields.io/discord/533342958712258572?style=for-the-badge
[discord-url]: https://discord.gg/5svGwKX
[downloads-shield]: https://img.shields.io/github/downloads/DCS-Skunkworks/dcs-bios/total?style=for-the-badge

[dcs-url]: http://www.digitalcombatsimulator.com
[original-dcs-bios-url]: https://github.com/dcs-bios/dcs-bios
[latest-release-url]: https://github.com/DCS-Skunkworks/dcs-bios/releases/latest
[wiki-url]: https://github.com/DCS-Skunkworks/dcs-bios/wiki/
[discussions-url]: https://github.com/DCS-Skunkworks/dcs-bios/discussions/
[user-guide-url]: https://github.com/DCS-Skunkworks/dcs-bios/blob/main/Scripts/DCS-BIOS/doc/userguide.adoc
[dcsbiosbridge-url]: https://github.com/DCS-Skunkworks/DCSBIOSBridge/releases
[developer-guide-url]: https://github.com/DCS-Skunkworks/dcs-bios/blob/main/Scripts/DCS-BIOS/doc/developerguide.adoc
[contributing-url]: https://github.com/DCS-Skunkworks/dcs-bios/blob/main/CONTRIBUTING.md

[client-lib-dcs-bios-communicator-url]: https://github.com/charliefoxtwo/DCS-BIOS-Communicator

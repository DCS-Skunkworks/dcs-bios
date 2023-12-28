# DCS-Skunkworks DCS-BIOS

[![Static Badge](https://img.shields.io/badge/license-SimPL--2.0-green)](https://github.com/DCS-Skunkworks/dcs-bios/blob/master/LICENCE)
[![GitHub release](https://img.shields.io/github/release/DCS-Skunkworks/dcs-bios.svg)](https://github.com/DCS-Skunkworks/dcs-bios/releases)
[![Discord](https://img.shields.io/discord/533342958712258572)](https://discord.gg/5svGwKX)

DCS-BIOS is a ```Export.lua``` file for use with [DCS: World](http://www.digitalcombatsimulator.com).
It provides a stable, documented interface for external hardware and software to interact with the clickable cockpit of a DCS: World aircraft.

This version is a fork of [DCS-BIOS](https://github.com/dcs-bios/dcs-bios) created and programmed by [jboecker](https://github.com/jboecker).
While the original repo has gone stale this is continously updated.

This fork is similar to the original DCS-BIOS before it was updated to the BIOS-HUB version.
Fully compatible for pit builders and Arduino users.

  If want to support us, You find info at the bottom of this page.
  With that money, we buy the planes to integrade them in this DCS-BIOS fork.

- Release/Prerelease are mostly for the stable version of DCS.
- DCS Beta Users should use the ```DCS-BIOS Openbeta``` nightly release. Starting a mission will generate the json files.
- Arduino Users should download the ```Source code(zip)``` on the Release page to get all needed files

[Problems/Info see our Wiki](https://github.com/DCS-Skunkworks/dcs-bios/wiki)

[Quick Setup Guide](https://github.com/DCS-Skunkworks/dcs-bios/blob/master/Scripts/DCS-BIOS/doc/DCS-BIOS-FLIGHTPANELS_Install%20Guide.pdf)

## For Users

[What do I download?](https://github.com/DCS-Skunkworks/dcs-bios/wiki/What-do-I-download%3F)

## For Panel Builders

You don't need to be a programmer or electrical engineer.
The [DCS-BIOS User Guide](https://github.com/DCS-Skunkworks/dcs-bios/blob/master/Scripts/DCS-BIOS/doc/userguide.adoc) will show you step by step how to connect your panel to DCS using DCS-BIOS and the beginner-friendly [Arduino microcontroller platform](http://arduino.cc).
You don't have to write any program code yourself.

## For Software Developers

The [developer guide](https://github.com/DCS-Skunkworks/dcs-bios/blob/master/Scripts/DCS-BIOS/doc/developerguide.adoc) explains how to connect to and interpret the DCS-BIOS export data stream and how to send commands to DCS-BIOS to operate controls inside the cockpit.

## Is My Aircraft Supported?

Currently, DCS-BIOS supports the following aircraft modules:

* **A-4E-C** _(contributed by Dehuman, revised by WarLord) [get the mod here](https://github.com/heclak/community-a4e-c)
* **A-10C / A10C-II** _(contributed by FSF-Ian, extended by WarLord) (use A-10C for All Versions)_
* **A-29B** _(contributed by WarLord) [get the mod here](https://github.com/luizrenault/a-29b-community)
* **AH-6J** _(contributed by WarLord) [get the mod here](https://forums.eagle.ru/showthread.php?t=267143)
* **AH-64D** _(contributed by WarLord)_
* **AJS-37** _(contributed by pdmarsh extended by WarLord,ArturDCS,Matchstick)_
* **Alphajet** _(contributed by WarLord) [get the mod here](http://www.jetesons.com/telechargement.html)
* **AV8BNA** _(contributed by WarLord,Matchstick)_
* **Bf-109-K-4** _(contributed by ArturDCS)_
* **C-101CC / EB** _(contributed by WarLord,cdpkobra) (use C-101 for All Versions)_
* **Christen Eagle II** _(contributed by WarLord,cdpkobra)_
* **Edge-540** _(contributed by WarLord) [get the mod here](http://virtualairrace.com/downloads/)
* **Extra-330SR** _(contributed by WarLord) (use Edge-540) [get the mod here](http://virtualairrace.com/downloads/)
* **F-14B / A** _(contributed by WarLord,ArturDCS,Bullitt) (use F-14 for All Versions)_
* **F-15E** _(contributed by WarLord,Maverick87Shaka)_
* **F-16C** _(contributed by WarLord,cdpkobra,Matchstick,BuzzKillington)_
* **F-22A** _(contributed by WarLord) [get the mod here](https://grinnellidesigns.com/f22)
* **F-5E-3** _(contributed by geebeer2, extended by WarLord)_
* **F-86F** _(contributed by ArturDCS)_
* **F/A-18C** _(contributed by AndrewW)_
* **FW-190-A8** _(contributed by WarLord,MD44)_
* **FW-190-D9** _(contributed by ArturDCS)_
* **I-16** _(contributed by WarLord,NightStalker)_
* **JF-17** _(contributed by WarLord,cdpkobra)_
* **Ka-50 / Ka-50 3** _(contributed by airtom, revised by WarLord)_
* **L-39ZA / C** _(contributed by kadda11, revised by WarLord) (use L-39 for All Versions)_
* **M-2000C** _(contributed by Exo7,ArturDCS,Matchstick)_
* **MB-339** _(contributed by WarLord) (use MB-339PAN for All Versions)_
* **Mi-8** _(contributed by ArturDCS,revised by WarLord)_
* **Mi-24P** _(contributed by WarLord,BaD CrC)_
* **MiG-15bis** _(contributed by WarLord,Steve Gee)_
* **MiG-19P** _(contributed by WarLord)_
* **MiG-21Bis** _(contributed by wraith444)_
* **Mirage F1** _(contributed by WarLord) (use Mirage F1 for All Versions)_
* **Mosquito FB Mk.VI** _(contributed by WarLord)_
* **NS430** _(contributed by Capt_Zeen, extended by Imp, revised by Celemourn)_
* **P-47D** _(contributed by WarLord and Donators) (use P-47D for All Versions)_
* **P-51D** _(contributed by pdmarsh)_
* **Spitfire** _(revised by WarLord)_
* **SA 342** _(all Versions; use SA342 for All)_
* **T-45** _(contributed by WarLord) [get the mod here](https://forums.eagle.ru/topic/203816)
* **TF-51D** _(contributed by pdmarsh, ArturDCS) (use P-51D)_
* **UH-1H** _(contributed by FSF-Ian)_
* **Yak-52** _(contributed by WarLord,cdpkobra)_
* Externals for all Airplanes _(Speedbrake and Lights; Weight on Wheels Code from DeadMeat)_
* All Flaming Cliffs 3 Modules _(FC3) (A-10A; F-15C; J-11A; MiG-29A;
  MiG-29S; Su-25; Su-25T; Su-27; Su-33) (contributed by danvac, extended by WarLord)_
* Superbug mod _(F-18 E+F+Growler)_
* Mods (FC3): **VSN-Mods, PAK-FA Project, Civil Aircraft mod, Upuaut's Bell-47G, Mirage F.1, SU-30 FAMILY PROJECT, MIG-23UB Project,
              Virtual Cockpits, AC-130**

  Always use the latest version of the Mods!

If you want to add support for another module, please get in touch.(see below)

## For Hardware Developers

If you are working a lot with hardware, it may come in handy to log and replay dcs-bios data. There are two scripts in ```\Programs\tools``` that allow you to do so.

```python connect-logger.py``` will log all dcs-bios data to ```dcsbios_data.json```. Ensure that you start the logger before loading a mission, to capture the mission-start message properly.

```python replay-log.py``` will ask for a serial port like ```connect-serial-port.cmd``` and replay the data to that com-port. When it reaches the end of the file, it will loop forever until you close it. The first message will not be repeated as this is usualy the mission-start message and should only be sent once.

```dcsbios_data.json``` This file contains the logged data in hex format. If you are familiar with the format of dcs-bios messages, you may modify the file by hand if needed. The included sample file is a recording of the A-10C with a blinking Master Caution light.

## Mod Support

If you want to add a FC3 based mod (eg. VSN_Mod Planes) for commondata support, you must follow
these instructions:

Add at the bottom in \DCS-BIOS\lib\AircraftList.lua the entry :

```a("PlaneName", false)```

To get the correct plane name, open the [control-reference](https://github.com/DCS-Skunkworks/dcs-bios/wiki/DCS-BIOS-Control-Reference-Page) page (```MetadataStart```) while you fly that plane.

## socat

There are 2 socat versions, 32 and 64 bit. Choose that version that fits best for you.
The files in the zip File must be unzipped direct in the socat folder.

  The path must be: /socat/socat.exe

## Video Tutorials

[DCS-BIOS Channel on Youtube](https://www.youtube.com/channel/UCwECFPfC3QJiNYS5fskF2vg/)

## Contribute

If you have a question or found a bug, please [open an issue on the GitHub issue tracker](https://github.com/DCS-Skunkworks/dcs-bios/issues).

If you want to contribute code or documentation, please send a pull request on GitHub.

### License

The [orginal DCS-BIOS](https://github.com/dcs-bios/dcs-bios) was programmed by [FSF]Ian. This is a fork of his older repository.

DCS-BIOS is released under a slightly modified Simple Public License 2.0 (think "a version of the GPL readable by mere mortals"). Please see the file ```LICENSE```.

The copy of `socat` that comes with DCS-BIOS is licensed under the GPLv2 (see `/Programs/socat/COPYING`).

## Support

* Here you find our [DCS-Skunkworks Discord Server](https://discord.gg/5svGwKX)
* Here you find the [arduino-library](https://github.com/DCS-Skunkworks/dcs-bios-arduino-library)
* Here you find the [arduino-Examples](https://github.com/DCS-Skunkworks/dcs-bios-arduino_examples)

* [If you want to support us.](https://www.paypal.me/FPDCSBIOS)

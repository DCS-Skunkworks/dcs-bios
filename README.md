dcs-bios
========

DCS-BIOS is intended to become a common platform to interface external
software and hardware with the cockpit of a DCS: World aircraft.

For a first draft of the protocol specification, see [protocol-spec.md](protocol-spec.md).

For a list of defined messages (values that can be exported or influenced, such as the state of a toggle switch), see `doc/documentation.html`.

Currently, most of the A-10C and UH-1H is supported.

Setup
=====

* Copy the `Scripts\DCS-BIOS` directory to `%USERPROFILE%\Saved Games\DCS\Scripts`
* Add the following line to your Export.lua file:
	`dofile(lfs.writedir()..[[Scripts\DCS-BIOS\BIOS.lua]])`
* Optionally edit BIOSConfig.lua to add a new target for the export stream (e.g. if you are using an Arduino Ethernet Shield)

Listening to the Export Stream
==============================

Start `multicast-console.cmd` to view the export stream. To access this data, you have several options:
* listen for UDP packets on multicast address 239.255.50.10, port 5010 (specify the `reuseaddr` option to avoid blocking this method for other programs)
* edit `BIOSConfig.lua` to make DCS-BIOS send a copy of the export data stream via UDP to an IP address and port of your choice
* use `socat` to connect a serial port to DCS-BIOS (see below)

Sending Commands to DCS
=======================

To send a message to DCS-BIOS, you can:
* send UDP packets to port 7778 (on the computer that DCS is running on)
* use `socat` to connect a serial port to DCS-BIOS (see below)

For messages that are marked "settable" in the documentation, you can set the value directly. For example, to set the A-10C's Master Arm switch to its SAFE position, send:
`AHCP_MASTER_ARM 1\n`

Since the `AHCP_MASTER_ARM` message supports the `DEC` and `INC` actions, you can also send `AHCP_MASTER_ARM INC` to advance the switch towards the top and `AHCP_MASTER_ARM DEC` to advance it toward the bottom.

Connect a serial port to DCS-BIOS
=================================

Using the `socat` program (included in the DCS-BIOS repository, see http://dest-unreach.org/socat for documentation), you can connect a serial port to DCS-BIOS.
* edit `connect-serial-port.cmd` to specify the serial port and baud rate
* run `connect-serial-port.cmd`

See also
========

To find out what messages to listen for and what values to send, see the `doc` folder.

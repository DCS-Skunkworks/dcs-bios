# DCS-BIOS Protocol Specification

Second Draft, Revision 0

# The Import and Export Streams

The DCS-BIOS protocol defines an "export stream", which exports
cockpit state out of DCS, and an "import stream", which can be used to
manipulate controls in the cockpit, such as setting the position of
switches or turning a rotary knob in a particular direction.

# Transport Layer

This specification talks about streams of bytes. Those streams can be
transported over a lot of different transports including TCP, UDP and
a serial port.

DCS-BIOS will listen on UDP port 7778 for input stream data.

DCS-BIOS will send output stream data via UDP to the multicast address
239.255.50.10, port 5010 on the loopback interface (127.0.0.1).

Mnemonic for the last address part and port: ED released the Ka-50 first,
followed by the A-10C.

Any program that listens to the export stream must specify the
"allowreuseaddr" socket option so it does not prevent additional
programs from connecting.

The IPv4 multicast address block 239.255.0.0/16 is defined in RFC 2365
as the "IPv4 Local Scope". It is part of the "Administratively Scoped
IPv4 Multicast Space", which is to multicast as the private address
ranges 10.0.0.0/8, 192.168.0.0/16 and 172.16.0.0/12 are to unicast
Ipv4.

This design allows multiple programs to connect to DCS-BIOS without
coordinating with each other.

For those who do not want to deal with network programming, the
windows version of `socat` can be used to connect almost anything
(including a serial port) to the import and export stream.

# Export Stream Protocol

The export stream protocol is designed to be as space-efficient as
possible to enable the export of the complete cockpit state over a
115200 bps serial connection.

Each piece of cockpit state is encoded as an integer or a string and
is assigned an address within a 16-bit address space.

## Integer values

The location of an integer value is defined by a 16-bit word address
which specifies the start of the 16-bit word in which the data is
located, a 16-bit mask which specifies which bits in that word belong
to the value, and a shift value (which can also be deduced from the
mask).

Given the start address, mask and shift values, the following pseudo C
code decodes a value:
`char[] state;`
`(((uint16_t*)state)[start_address<<2] & mask) << shift`

Changes to the state data are encoded as write accesses to this
address space and written to the export data stream in the following
format:

`<start address (16 bit)>` `<data length (16 bit)>` `data`

Both the start address and the data length will always be
even. This ensures that no write access partially updates
a value (an integer may occupy no more than 16 bit).

## String values

The location of a string is defined by its 16-bit start address and
the length in bytes (all string values have a fixed length and start
on a 16-bit aligned address).

## Synchronization sequence

DCS-BIOS will regularly send the four bytes `0x55 0x55 0x55
0x55`. These do *not* specify a 65535-byte write access to the address
0x5555. Instead, they are used by consumers of the data stream to find
the start of a packet to synchronize to.

DCS-BIOS ensures that this byte sequence cannot appear in the normal
data stream. In the event that the byte sequence `0x55 0x55 0x55 0x55`
would appear in a single write access, DCS-BIOS will split that access
into two separate writes to avoid that situation.

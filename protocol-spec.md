# DCS-BIOS Protocol Specification

First Draft, Revision 0

# Design Goals

DCS-BIOS aims to become a common platform to interface external
software and hardware with the cockpit of a DCS: World aircraft. It
will include a reference implementation for the Arduino platform, but
it is not specific to any particular microcontroller platform.

The protocol has been designed to be human-readable and
human-writeable. This makes manual testing as easy as attaching a
console window to the import or export stream.

Binary messages are supported for exceptional cases where a binary
representation is absolutely required for performance reasons.


# The Import and Export Streams

The DCS-BIOS protocol defines an "export stream", which exports
cockpit state out of DCS, and an "import stream", which can be used to
manipulate controls in the cockpit, such as setting the position of
switches or turning a rotary in a particular direction.

Both streams are a sequence of messages.

| Message Format | Description |
| -------------- | ----------- |
| `<message-type> '\n'` | no payload |
| `<message-type> ' ' <text payload> '\n'` | text payload (arbitrary length, cannot contain line break) |
| `<message-type> 'b' <payload length byte> <binary payload> '\n'` | binary payload (max. 255 bytes) |

A message consists of the message type, an optional payload, and a line break.

The *message type* can only contain upper case characters, numbers and underscores and must start with a letter, i.e. it must match the following regular expression:
`[A-Z][A-Z0-9_]*`

In a text payload, any byte except a line break is allowed, but it is
recommended to stick to characters that can be typed on a keyboard to
make debugging easier.

# Transport Layer

This specification talks about streams of bytes. Those streams can be
transported over a lot of different transports including TCP, UDP and
a serial port.

Because each message is terminated by a line break, clients can
eventually recover from transmission errors, so it is safe to use
unreliable transport meachanisms such as UDP.

DCS-BIOS will listen on UDP port 7778 for input stream messages.

DCS-BIOS will send output stream data via UDP to the multicast address
239.255.50.10, port 5010 on the loopback interface (127.0.0.1).

Mnemonic for the last address part and port: ED released the Ka-50 first,
followed by the A-10C.

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

# Message Types

Most message types will be defined by aircraft-specific DCS-BIOS
modules. Usually, a message type will be defined for each piece of
exported information (such as the state of an indicator light) and for
each supported input command (e.g. to set the position of a toggle
switch).

While it is possible to define a message type that maps to a
`performClickableAction()` call or that sets the state of a particular
cockpit argument, this would leak DCS implementation details into the
protocol and should be avoided.

This specification defines two message types: `AIRCRAFT` and `SYNC`.
The `AIRCRAFT` message specifies the currently active aircraft (e.g. `A-10C` or `UH-1H`). If the player is not in an aircraft, the value is `NONE`.
For the `SYNC` message, see the next section.

# Caching

Most messages contain some state information as the payload, such as
the position of a toggle switch or whether a light is turned on or
not. In order not to overwhelm slow transport mechanisms such as a
serial connection, these messages must only be sent once for each
state change, except after receiving a `SYNC` message.

To implement this, cache the payload of the last message sent for each
message type. When sending a message, only send it if its cache entry
is empty or the payload differs from the cached payload.

## `SYNC` message

A `SYNC` message has a single-character text payload that is either
'E' (for export) or 'I' (for import). When receiving a `SYNC E`
message, DCS-BIOS will send the full cockpit state to the export
stream.

When receiving a `SYNC I` message, all programs that send state
information to the input stream (e.g. custom panel controllers) should
send their current state.

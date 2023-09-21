import socket
import time
import json
import base64

IP_ADDRESS = "0.0.0.0"
UDP_PORT = 5010
BUFFER_SIZE = 4096  # Increase buffer size
GROUP = "239.255.50.10"

# Setup UDP Socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((IP_ADDRESS, UDP_PORT))
sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, socket.inet_aton(GROUP) + socket.inet_aton(IP_ADDRESS))

# Initialize log array
log_data = []

last_time = time.time()

def write_to_file():
    with open("dcsbios_data.json", "w") as f:
        json.dump(log_data, f)

# Collect the data
while True:
    data, _ = sock.recvfrom(BUFFER_SIZE)
    now = time.time()
    elapsed = now - last_time
    last_time = now

    # Create dictionary object
    packet_dict = {
        "timing": elapsed,
        "data": base64.b64encode(data).decode("utf-8")
    }

    # Append the packet to the log_data array
    log_data.append(packet_dict)

    # Write to file every 100 packets for example
    if len(log_data) % 100 == 0:
        write_to_file()

    # Replace this with an appropriate stopping condition if needed
    if len(log_data) > 1000:  # Example: stop after 100 packets
        break

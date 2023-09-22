import socket
import time
import json

IP_ADDRESS = "0.0.0.0"
UDP_PORT = 5010
BUFFER_SIZE = 4096 # Increase buffer size
GROUP = "239.255.50.10"

# Filename
filename = "dcsbios_data.json"

# Display message on start
print(f"Logging to {filename}")
print(f"Press Ctrl-C to stop.")

# Setup UDP Socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((IP_ADDRESS, UDP_PORT))
sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, socket.inet_aton(GROUP) + socket.inet_aton(IP_ADDRESS))

# Initialize log array
log_data = []

last_time = time.time()

def write_to_file():
    with open(filename, "w") as f:
        json.dump(log_data, f)

# Flag to identify first message
first_message = True

# Collect the data
try:
    while True:
        data, _ = sock.recvfrom(BUFFER_SIZE)
        hex_data = data.hex().upper()
        now = time.time()
        
        if first_message:
            elapsed = 2.0  # Set timing for the first message to 2.0 seconds, this gives the Arduino enough time to boot after its reset by accessing the com-port.
            first_message = False
        else:
            elapsed = now - last_time
        
        last_time = now

        message_dict = {
            "timing": elapsed,
            "data": hex_data
        }

        # Append the message to the log_data array
        log_data.append(message_dict)

        # Write to file every 10 messages
        if len(log_data) % 10 == 0:
            write_to_file()

except KeyboardInterrupt:
    print("Ctrl+C detected. Stopping and saving data.")

finally:
    write_to_file()
    print("Data saved. Exiting.")
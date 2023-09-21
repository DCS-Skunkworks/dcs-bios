import json
import base64
import serial
import time

def read_packets(file_path):
    with open(file_path, "r") as f:
        data = json.load(f)
        
    packets = [(item['timing'], base64.b64decode(item['data'])) for item in data]
    return packets

if __name__ == "__main__":
    com_port_number = input("Enter a COM Port Number: ")
    com_port = f'COM{com_port_number}'
    
    packets = read_packets("dcsbios_data.json")  # Make sure the file name matches the one you used for logging
    
    with serial.Serial(com_port, 250000, timeout=1) as ser:
        first_loop = True
        while True:
            loop_packets = packets if first_loop else packets[1:]
            
            for elapsed_time, data in loop_packets:
                try:
                    elapsed_time_float = float(elapsed_time)
                except ValueError:
                    print(f"Failed to convert {elapsed_time} to float")
                    continue

                print(f"Sending packet with elapsed time {elapsed_time_float} seconds")
                
                ser.write(data)
                time.sleep(elapsed_time_float)
            
            first_loop = False

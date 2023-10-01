import json
import serial
import time

def read_messages(file_path):
    with open(file_path, "r") as f:
        data = json.load(f)

    # Decode the hex string back into bytes
    messages = [(item['timing'], bytes.fromhex(item['data'])) for item in data]
    return messages

if __name__ == "__main__":
    com_port_number = input("Enter a COM Port Number: ")
    com_port = f'COM{com_port_number}'
    
    messages = read_messages("dcsbios_data.json")
    
    with serial.Serial(com_port, 250000, timeout=1) as ser:
        first_loop = True
        while True:
            loop_messages = messages if first_loop else messages[1:]
            
            for elapsed_time, data in loop_messages:
                try:
                    elapsed_time_float = float(elapsed_time)
                except ValueError:
                    print(f"Failed to convert {elapsed_time} to float")
                    continue

                print(f"Sending message with elapsed time {elapsed_time_float} seconds")
                
                ser.write(data)
                time.sleep(elapsed_time_float)
            
            first_loop = False


#!/bin/bash

# Remove and reload the thinkpad_acpi module
sudo modprobe -r thinkpad_acpi
sudo modprobe thinkpad_acpi

# Set the fan to disengaged
echo level disengaged | sudo tee /proc/acpi/ibm/fan

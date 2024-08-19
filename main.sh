#!/usr/bin/env python3
 
import random

def random_hex_block(length=4):
    """Generate a random hexadecimal block with a given length."""
    max_value = 16**length - 1
    return f"{random.randint(0, max_value):0{length}x}"

def generate_ipv6(patterns):
    addresses = []
    for pattern in patterns:
        address = pattern
        while '****' in address:
            address = address.replace('****', random_hex_block(4), 1)
        while '*****' in address:
            address = address.replace('*****', random_hex_block(5), 1)
        while '***0' in address:
            address = address.replace('***0', random_hex_block(3) + '0', 1)
        addresses.append(address)
    return addresses

# Patterns for the IP addresses
patterns = [
    "2606:4700:****::****:1",
    "2606:4700:****::****:1",
    "2606:4700:****::****:1",
    "2001:1a50:****::*****::1",
    "2001:1a50:****::*****::1",
    "2001:1a50:****::*****::1",
    "a000:****::****::1",
    "a000:****::****::1",
    "a000:****::****::1",
    "0000:****::***0::***0::1"
]

# Generate the IPv6 addresses
all_addresses = generate_ipv6(patterns)

# Print the generated addresses
for idx, address in enumerate(all_addresses):
    print(f"Address {idx + 1}: {address}")

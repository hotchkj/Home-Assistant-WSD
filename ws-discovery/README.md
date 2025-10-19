# Home Assistant Add-on: WS-Discovery

_WS-Discovery daemon to make Linux servers visible in Windows Network Browser_

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

## About

This Home Assistant add-on provides WS-Discovery (Web Services Dynamic Discovery) support, making your Home Assistant server and any Samba shares discoverable by Windows computers on your network. It's particularly useful for users who want their Linux-based Home Assistant installation to appear in the Windows Network Browser alongside other network devices.

## What is WS-Discovery?

WS-Discovery is a Microsoft protocol that enables automatic discovery of services on a local network. When enabled, Windows computers can automatically find and connect to network devices without manual configuration. This add-on implements the necessary protocols (LLMNR and WS-Discovery) to make your Home Assistant server visible in the Windows Network neighborhood.

## Implementation Details

This add-on uses [wsdd](https://github.com/christgau/wsdd) by Steffen Christgau, a Python implementation of the WS-Discovery protocol. The wsdd daemon is fetched directly from the official GitHub repository during the Docker build process, ensuring you always get an authentic and up-to-date implementation.

## Use Cases

- **Media Servers**: Make your Home Assistant media files discoverable by Windows media players
- **File Sharing**: Complement Samba file sharing with automatic discovery
- **Network Visibility**: Ensure your Home Assistant server appears in network scans
- **Enterprise Networks**: Join Active Directory domains for centralized network management
- **Mixed Networks**: Bridge Linux and Windows networking protocols seamlessly

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

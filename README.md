# WS-Discovery Home Assistant Add-on Repository

![Supports amd64 Architecture][amd64-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

## About

This repository contains a Home Assistant add-on that provides WS-Discovery (Web Services Dynamic Discovery) support. It makes Linux/Samba servers visible in the Windows Network Browser, allowing Windows computers to discover your Home Assistant server and any Samba shares on your network.

This add-on uses [wsdd](https://github.com/christgau/wsdd) by Steffen Christgau - a Python implementation of a WS-Discovery server that implements the LLMNR and WS-Discovery protocols. The wsdd.py script is fetched from the upstream repository at a specific commit (e9325b5ce312423f9b83f7175949694097a161b2) for deterministic builds.

## Installation

### Add the Repository

1. Navigate to the Supervisor Add-on Store in Home Assistant
2. Click on the three dots in the top right corner and select "Repositories"
3. Add this repository URL: `https://github.com/hotchkj/Home-Assistant-WSD`
4. Find "WS-Discovery" in the add-on store and click it
5. Click "Install"
6. Configure the add-on (see Configuration section below)
7. Start the add-on
8. Check the logs to see if everything is working correctly

Alternatively, click the button below to add this repository automatically:

[![Open your Home Assistant instance and show the add add-on repository dialog with this repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fhotchkj%2FHome-Assistant-WSD)

## Configuration

Add-on configuration:

```yaml
workgroup: WORKGROUP
hostname: ""
domain: ""
localsubnet: ""
debug: false
```

### Option: `workgroup`

The Windows workgroup name. Default is `WORKGROUP`.

### Option: `hostname`

The hostname to advertise. If left empty, the system hostname will be used.

### Option: `domain`

Report being a member of an Active Directory domain. If set, this disables the WORKGROUP option. Leave empty if not using AD.

### Option: `localsubnet`

The fixed part of your local network IPv4 address, with dots escaped by double backslashes. For example: `192\\.168\\.1` for the 192.168.1.0/24 subnet. Leave empty to auto-detect.

### Option: `debug`

Enable debug mode. When set to `true`, the add-on will output verbose logging. Default is `false`.

## Repository Structure

```
.
├── ws-discovery/        # Home Assistant add-on directory
│   ├── Dockerfile      # Builds custom image with wsdd.py
│   ├── build.yaml      # Build configuration for multiple architectures
│   ├── config.json     # Add-on configuration schema
│   ├── run.sh          # Add-on startup script
│   ├── README.md       # Add-on documentation
│   └── CHANGELOG.md    # Add-on changelog
├── archive/            # Legacy files from previous implementation
├── repository.yaml     # Home Assistant repository configuration
└── README.md           # This file
```

## Maintainer Notes

This add-on fetches wsdd.py from the upstream christgau/wsdd repository at commit e9325b5ce312423f9b83f7175949694097a161b2 for deterministic builds. If you prefer a self-contained add-on that doesn't require fetching external files during build, the wsdd.py file could be embedded directly into the repository.

## Support

Got questions?

You could open an issue on GitHub:

- [Open an issue](https://github.com/hotchkj/Home-Assistant-WSD/issues)

## License

MIT License - see [LICENSE](LICENSE) file for details.

The underlying [wsdd](https://github.com/christgau/wsdd) implementation is licensed under the MIT License.

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

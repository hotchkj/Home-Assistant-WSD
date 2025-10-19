# WS-Discovery Home Assistant Add-on

![Supports amd64 Architecture][amd64-shield]

## About

This add-on provides WS-Discovery (Web Services Dynamic Discovery) support for Home Assistant. It makes Linux/Samba servers visible in the Windows Network Browser, allowing Windows computers to discover your Home Assistant server and any Samba shares on your network.

This add-on uses the [hihp/wsdd](https://github.com/hihp/wsdd) Docker image, which implements [wsdd](https://github.com/christgau/wsdd) by Steffen Christgau - a Python implementation of a WS-Discovery server that implements the LLMNR and WS-Discovery protocols.

## Installation

1. Click the Home Assistant My button below to open the add-on on your Home Assistant instance:

   [![Open your Home Assistant instance and show the add-on store.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/)

2. Search for "WS-Discovery" and install the add-on
3. Configure the add-on (see Configuration section below)
4. Start the add-on
5. Check the logs to see if everything is working correctly

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

Enable debug mode. When set to `true`, the healthcheck script will output status messages to the Docker log. Default is `false`.

## Support

Got questions?

You could open an issue on GitHub:

- [Open an issue](https://github.com/hotchkj/Home-Assistant-WSD/issues)

## License

MIT License - see [LICENSE](LICENSE) file for details.

This add-on uses the [hihp/wsdd](https://github.com/hihp/wsdd) Docker image.

The underlying [wsdd](https://github.com/christgau/wsdd) implementation is licensed under the MIT License.

[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg

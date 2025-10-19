# WS-Discovery Home Assistant Add-on

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## About

This add-on provides WS-Discovery (Web Services Dynamic Discovery) support for Home Assistant. It makes Linux/Samba servers visible in the Windows Network Browser, allowing Windows computers to discover your Home Assistant server and any Samba shares on your network.

This add-on uses [wsdd](https://github.com/christgau/wsdd), a Python implementation of a WS-Discovery server that implements the LLMNR and WS-Discovery protocols.

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
```

### Option: `workgroup`

The Windows workgroup name. Default is `WORKGROUP`.

### Option: `hostname`

The hostname to advertise. If left empty, the system hostname will be used.

## Support

Got questions?

You could open an issue on GitHub:

- [Open an issue](https://github.com/hotchkj/Home-Assistant-WSD/issues)

## License

MIT License - see [LICENSE](LICENSE) file for details.

This add-on uses [wsdd](https://github.com/christgau/wsdd) which is licensed under the MIT License.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

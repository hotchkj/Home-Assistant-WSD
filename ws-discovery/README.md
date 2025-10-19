# WS-Discovery Home Assistant Add-on

## About

This add-on provides WS-Discovery (Web Services Dynamic Discovery) support for Home Assistant. It makes your Home Assistant instance visible in the Windows Network Browser, allowing Windows computers to discover it on the local network.

This add-on directly runs the wsdd Python script by Steffen Christgau, providing full control over all configuration options.

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the "WS-Discovery" add-on
3. Configure the add-on (see Configuration section below)
4. Start the add-on
5. Check the logs to verify it's working correctly

## Configuration

Refer to the add-on configuration in the add-on UI. Key options include:

- workgroup (default WORKGROUP)
- hostname (override advertised hostname)
- domain (set Active Directory domain)
- interface (list of interface names or addresses to bind to)
- ipv4only / ipv6only
- hoplimit
- preserve_case
- discovery
- no_http
- verbose
- chroot / user
- uuid
- metadata_timeout
- source_port

## Firewall Requirements

Allow:
- UDP 3702 (multicast and unicast)
- TCP 5357 (incoming)
- Multicast addresses:
  - IPv4: 239.255.255.250
  - IPv6: ff02::c

## Support

Issues: https://github.com/hotchkj/Home-Assistant-WSD/issues

## License

MIT License

This add-on uses wsdd by Steffen Christgau (https://github.com/christgau/wsdd)

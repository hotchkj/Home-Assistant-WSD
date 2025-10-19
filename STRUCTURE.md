# Home Assistant Add-on Repository Structure

This repository has been transformed into a valid Home Assistant add-on repository following the standard structure.

## What Changed

1. **Add-on files moved to `ws-discovery/` directory**: All add-on-specific files are now in the `ws-discovery/` subdirectory, which is the standard structure for Home Assistant add-on repositories.

2. **Custom Dockerfile**: The add-on now builds its own Docker image instead of using the external `hihp/wsdd` image. The Dockerfile fetches `wsdd.py` from the upstream `christgau/wsdd` repository at commit `e9325b5ce312423f9b83f7175949694097a161b2` for deterministic builds.

3. **Repository configuration**: Added `repository.yaml` at the root for Home Assistant add-on repository metadata.

4. **Legacy files archived**: Original files from the previous implementation are preserved in the `archive/` directory for reference.

5. **Multi-architecture support**: The add-on now supports multiple architectures (amd64, aarch64, armhf, armv7, i386).

## Adding This Repository to Home Assistant

Users can add this repository to their Home Assistant instance by:
1. Going to Settings → Add-ons → Add-on Store
2. Clicking the three dots menu → Repositories
3. Adding: `https://github.com/hotchkj/Home-Assistant-WSD`

## Optional: Embedding wsdd.py

Currently, the Dockerfile fetches `wsdd.py` from the upstream repository during the build process. If you prefer a fully self-contained add-on that doesn't require fetching external files during build:

1. Download wsdd.py from the specified commit
2. Add it to the `ws-discovery/` directory
3. Update the Dockerfile to `COPY wsdd.py /usr/local/bin/` instead of using `wget`

This would make the build faster and remove the dependency on GitHub being accessible during the build.

## Directory Structure

```
.
├── ws-discovery/        # Home Assistant add-on
│   ├── Dockerfile      # Builds Docker image with wsdd.py
│   ├── build.yaml      # Multi-architecture build config
│   ├── config.json     # Add-on configuration and schema
│   ├── run.sh          # Add-on startup script
│   ├── README.md       # Add-on documentation
│   └── CHANGELOG.md    # Add-on version history
├── archive/            # Legacy files (preserved for reference)
│   ├── ARCHIVE.md      # Explanation of archived files
│   ├── addon.json      # Old metadata format
│   ├── config.json     # Old configuration
│   ├── README.md       # Old README
│   └── CHANGELOG.md    # Old changelog
├── repository.yaml     # Home Assistant repository config
├── README.md           # Repository documentation
├── CHANGELOG.md        # Repository version history
└── LICENSE             # MIT License
```

## Commit References

The problem statement mentioned these commit SHAs:
- `d0a647702a83...` - initial add
- `118ca5522871...` - archive

These commits may be in another branch or were part of the development process. The current implementation is complete and functional.

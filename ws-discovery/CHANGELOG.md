# Changelog

All notable changes to this add-on will be documented in this file.

## [1.1.0] - 2025-10-19

### Changed
- Transformed repository into valid Home Assistant add-on structure
- Now builds custom Docker image with wsdd.py fetched from christgau/wsdd at commit e9325b5ce312423f9b83f7175949694097a161b2 for deterministic builds
- Added support for multiple architectures (amd64, aarch64, armhf, armv7, i386)
- Removed dependency on external Docker image

### Added
- Dockerfile for building add-on image
- run.sh script for proper configuration handling

## [1.0.0] - 2025-10-19

### Added
- Initial release of WS-Discovery add-on
- Uses the hihp/wsdd Docker image
- Support for configurable workgroup name
- Support for custom hostname
- Host network mode for proper WS-Discovery functionality
- amd64 architecture support

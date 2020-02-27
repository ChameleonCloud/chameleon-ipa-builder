chameleon-ipa-hardware-manager
==============================

This element installs a boot service that will always try to install the latest version of the Chameleon IPA `hardware manager <https://github.com/ChameleonCloud/chameleon-ipa-hardware-manager>`_ via pip. The latest version is used so that the IPA code can be changed without requiring building and pushing a new ramdisk, though it adds some latency overhead.

**Note**: currently only systemd is supported. If needed, the approach could be adapted for other systems e.g., runit/sysv.

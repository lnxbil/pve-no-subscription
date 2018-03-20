# Proxmox VE No-Subscription Patch

This patch removes the 'No valid subscription' warning in Proxmox VE and should only be used
in test or demo environments. Please consider [buying a subscription](https://www.proxmox.com/en/proxmox-ve/pricing)
and supporting the development of Proxmox VE.


## Technical Implementation

The patch does automatically be invoked after a package update. It is built as
an APT hook that automagically applies the patch if necessary.

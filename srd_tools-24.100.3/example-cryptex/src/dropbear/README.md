# dropbear SSH

## Comment

dropbear will work fine with the quick changes in configure.ac. Will do a fixup at some point soon to fix the automated build pipeline. There are a few depreciated macros that cause Headers to not be included, thus the ssh login issue when building on arm64e. This configure.ac will resolve the issue, Edit your Makefile, copy it in at the right point, and automagically the build pipeline works, and no arm64e crashes for autoconf.

[Dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) is a tiny SSH server with few external dependencies.

We apply a simple diff to dropbear to make it cryptex aware:

- Update the `PATH` environment variable to include the current cryptex
- Read the `CRYPTEX_SHELL` environment variable to change the shell to one
  relative to the current cryptex.
- Add some logging to help debugging failures

# Troubleshooting

- Connect with: `ssh -vvv` and check for a banner.
- Open `Console.app` and search for "dropbear" or "cryptex"

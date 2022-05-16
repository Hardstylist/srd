# dropbear SSH

## Comment

It has been found that the configure.ac for dropbear contains depreciated macros that won't grab the right headers to allow for ssh login to the SRD. 

FIX: Use the example configure.ac provided in this Repo

```
diff src/dropbear/dropbear-src/configure.ac ~/iphone11/src/dropbear/dropbear-src/configure.ac
1a2
>  Modified by dhoyt for Apple Security Research Device
382c383
< AC_HEADER_TIME
---
> AC_HEADER_STDC
```

----

[Dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) is a tiny SSH server with few external dependencies.

We apply a simple diff to dropbear to make it cryptex aware:

- Update the `PATH` environment variable to include the current cryptex
- Read the `CRYPTEX_SHELL` environment variable to change the shell to one
  relative to the current cryptex.
- Add some logging to help debugging failures

# Troubleshooting

- Connect with: `ssh -vvv` and check for a banner.
- Open `Console.app` and search for "dropbear" or "cryptex"

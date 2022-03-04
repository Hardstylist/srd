# SRD Example Cryptex & DMG Source Build Repo for SRT 24.100.3
WED 23 FEB 2022 at 1515 US EST
---
This SRT 24.100.3 Example DMG Repo is __1 PR__ https://github.com/apple/security-research-device/pull/42 _ahead_ of https://github.com/apple/security-research-device/tree/main/example-cryptex and _includes_ PR https://github.com/apple/security-research-device/pull/48 and PR https://github.com/apple/security-research-device/pull/49. Debugging Tools like Frida and debugserver need the correct Entitlements from Apple to work as expected and provide provable data.

## SRD Example DMG, PR 42,48,49 Build & Installation Status
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.2.1 (21D62) X86_64      | PASS          | PASS          | PASS          | PASS          
| Build macOS 12.3 21E5227a T8101  | PASS          | FAIL          | FAIL          | FAIL 
| Install to iPhone 11 19E5241a    | PASS          | PASS          | PASS          | PASS
| Install to iPhone 12 19E5241a    | PASS          | PASS          | PASS          | PASS 

## Resources
- Source: https://github.com/apple/security-research-device/tree/main/example-cryptex
- PR42: https://github.com/apple/security-research-device/pull/42
- Universal DMG: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
- ASAN Beta DMG: https://xss.cx/srd/dmg/srd-asan-cryptex-beta.dmg
- UBSAN Beta DMG: https://xss.cx/srd/dmg/srd-ubsan-cryptex-beta.dmg
- XNU-8019.41.5 Universal DMG https://xss.cx/srd/dmg/srd-universal-cryptex.xnu-8019.41.5.dmg
- XNU-8019.41.5 Universal ASAN DMG https://xss.cx/srd/dmg/srd-universal-cryptex-asan.xnu-8019.41.5.dmg
- XNU-8019.41.5 Universal UBSAN DMG https://xss.cx/srd/dmg/srd-universal-cryptex-ubsan.xnu-8019.41.5.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
- Discussion: nvram settings disabling KTRR, CTRR and kASLR https://github.com/apple/security-research-device/discussions/2
- Build  Entitlements Issues for PR 42, 48, 49 https://github.com/xsscx/srd/blob/main/srd_tools-24.100.3/example-cryptex/srd-iphone11-iphone12-entitlements-testing-sample-example.md
## Prerequisites
- macOS 12.2.1 (21D62)
- Xcode Version 13.3 beta  
- Security Research Tools https://github.com/apple/security-research-device
- brew install gnu-sed automake
# SRD Source Build example-cryptex with toybox unstripped
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/build.sh" 
```
## Quick start

0. Install the prerequisites and select your Xcode with `xcode-select(1)`.
1. Plug in your Security Research Device
2. Run `cryptexctl device list`
3. Export the environment variable`CRYPTEXCTL_UDID` and set it to the UDID of your device
4. Run `make install`
5. Get the IP address of your device (Settings -> WiFi)
6. Run `nc ${IP} 7777`, if you see "Hello!" it's all working!
7. Now SSH in! `ssh root@${IP}`

## Follow along

Here is a suggested reading order.

0. This README
1. The [build_env.mk](build_env.mk) Makefile
2. The root [Makefile](Makefile)
3. [Hello researcher](src/hello)
4. [simple-server](src/simple-server)
5. [nvram](src/nvram)
6. [toybox](src/toybox)
7. [dropbear](src/dropbear)

## The build process

For simplicity this project mainly uses Make as a build
system as it is expected this will be more familiar to
most people.

The [build_env.mk](build_env.mk) Makefile is a template
that can be included into other Makefiles to set up cross
compilation for arm64e iOS targets. We essentially locate
the iOS SDK and add a `-isysroot` flag when we call the compiler
and linker.

You'll note that we also locate the macOS SDK, this is so
we can pull in specific headers that are present in the
macOS SDK but not in the iOS SDK. We graft them into
our include path, allowing us to compile some tools
that could otherwise only be compiled with an internal
or macOS SDK.

Once the appropriate `CFLAGS` and `LDFLAGS` are exported,
cross compilation is largely a matter of grafting required
headers into the include path and porting your software.

The [root Makefile](Makefile) includes this template
(as do the various projects under the [src/](src/)
directory).

The root Makefile is responsible for creating the cryptex,
distribution root and disk image, while `build_env.mk` is
responsible for cross compilation, and the various
`src/*/Makefile`s are responsible for building individual tools.

Anything in the [bin/](bin/) directory will be copied into
the distribution root's `/usr/bin/` directory for inclusion
into the cryptex. Binaries in this directory should be
at-least ad-hoc signed. This is an easy way to get prebuilt
binaries into your cryptex. Alternatively you could make
a project under [src/](src/) which downloads the binary
and installs it into the distribution root, similar to the
other projects in the src directory.

## Creating a cryptex

A cryptex starts life as a distribution root, essentially
a directory whose contents could be merged on top of the root
of a file system.

The distribution root can contain a number of familiar paths:

- `/Library/LaunchDaemons`
- `/usr/bin`
- `/usr/local/bin`

A disk image (dmg) is then created from this distribution root.
This makes it easy to share a set of tools with others and for
the cryptexctl(1) tool to ingest the distribution root. We refer
to this as the cryptex root dmg or just the dmg.

The dmg is then read by cryptexctl(1) and personalised for a specific
device. A directory containing the personalised content is then output,
this directory is a cryptex. This directory will typically have the
suffix `.cxbd`

It is important to note that while the distribution root and the cryptex
disk image may be shared with others, once the dmg is personalised and
turned into a cryptex, the cryptex may only be installed on the device
for which it has been personalised. That is to say, share the distribution
root or the dmg, others must create their own cryptexes.

## Cryptex Installation and usage

The cryptex may be installed onto a device by using the `cryptexctl install`
command. Once installed, any launch daemons will be started and any Mach-O
files within the cryptex will work on your device.

The cryptex will persist after a reboot, but will be uninstalled on an upgrade.

The cryptex is mounted to a random path, which can be found by running
`cryptexctl list`. This path can change between reboots.

Thankfully the cryptex subsystem can inject an environment variable
when launching a launchd plist that can be used by a binary to locate the
cryptex it is a part of.

A simple example of using this variable can be found in
[cryptex-run](srd/cryptex-run). A more comprehensive example can
be seen in the patches made to [dropbear](src/dropbear).

### Offline installation

The cryptex subsystem requires an internet connection to personalize a cryptex
for a device, it does not require the device to be present or internet connected
for installation of the cryptex.

This allows for workflows where the device is not connected to the host directly
such as when testing in a Faraday cage for radio research, or when the device is
on the other side of an airgap (such as for malware research).

The flow is largely similar to the normal flow except the user must specify
all the information required to perform the personalization to the cryptexctl
create subcommand.

The easiest way to do this is to run `cryptexctl identity` to retrieve the
personalization identifiers, then to create a plist with the identity information
within (see cryptexctl-create(1))

Please note, you will need to keep the cryptex nonce in sync. The nonce hash is specified
with the `--BNCH` flag on `cryptexctl create`, and can be retrieved from the device
with the `cryptexctl nonce` subcommand.

#@ Troubleshooting
##@ Log Collection
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
### Enable verbose logging with -v, -d and redirect from the system log to stderr with -ldt
```
cryptexctl -v9 -d9 -ldt install --print-info ./com.example.cryptex.cptx (20C80)
OR 
cryptexctl -v4 -d4  install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed (21C39)
```
### Collect logs from the device. The -E is so we capture the CRYPTEXCTL_UDID env var.
```
sudo -E cryptexctl log collect
```
### View the logs from the archive
```
cryptexctl log show -- --archive ./system_logs.logarchive
```

## Building

This Repo does the Build and Published DMG's containing Examples. Add a PR or Issue to Merge

## Example SRD DMG Install Audit Trail
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
```
--2022-01-17 14:12:26--  https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
Resolving xss.cx (xss.cx)... 50.62.160.45
Connecting to xss.cx (xss.cx)|50.62.160.45|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 27295841 (26M) [application/x-zip-compressed]
Saving to: ‘srd-universal-cryptex.dmg’

srd-universal-cryptex.dmg                                                                                100%[=================================================================================================================================================================================================================================================================================>]  26.03M  3.32MB/s    in 8.3s

2022-01-17 14:12:35 (3.12 MB/s) - ‘srd-universal-cryptex.dmg’ saved [27295841/27295841]

com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.yobZuo
  ```

When using a regexp to find Console Log Messages, these Files may be helpful:
- https://github.com/xsscx/srd/blob/main/code/xnu-os-cli-regexp-small-applesecurityresearchdevice-runtarget-001.txt
- https://github.com/xsscx/Commodity-Injection-Signatures/blob/master/meta/xnu-os-cli-regexp-small-applesecurityresearchdevice-runtarget-002.txt

If you experience a Crash when using cryptexctl or com.apple.cryptex*, these URL's may be helpful:
- https://srd.cx/possible-pointer-authentication-failure-data-abort/
- https://srd.cx/debugserver-installation-configuration/

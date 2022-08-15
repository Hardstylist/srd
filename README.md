# Welcome to Hoyt's SRD Repo
FRI 12 AUG 2022 at 0800 EDT

## SUMMARY
- This Repo is __ahead__ of the Apple Repo
- Built on 21F79 with X86_64 and arm64e
- The DMG's are all Built with XNU-8020.101.4 and options Targeting for iOS 16
- Frida, Toybox Unstripped, SSH, debugserver, other example Register Code
```
nm -a com.example.cryptex.dstroot/usr/bin/toybox  | wc -l
     934
```
## START HERE

Install the Pre-Built SRD DMG
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```

### SRD Example DMG, Build & Installation Status for iOS 14, 15 or 16 w/ + XNU-8020.101.4 
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.5 (21G72) X86_64       | PASS          | PASS          | PASS          | PASS          
| macOS 13 Beta T8101  | PASS          | PASS          | PASS          | PASS 
| X86_64 Install to iPhone 11 16.0_20A5349b    | PASS         | PASS         | PASS          | PASS
| T8101 Install to iPhone 12 16.0_20A5349b    | PASS          | PASS          | PASS          | PASS 
* X86_64 Install with CryptexManager
## Last Known Good Working Configuration(s)
- SIP Enabled
- macOS 12.4 (21F79) X86_64 or M1 T8101 macOS 12.4 (21F79)
- cryptexctl or CryptexManager
- Xcode Version 14.0 beta (14A5228q)

### Lastest IPSW Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone12,1_16.0_20A5328h_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_16.0_20A5328h_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
```

## Prerequisites
- Security Research Tools https://github.com/apple/security-research-device

### Resources
- Source: https://github.com/apple/security-research-device/tree/main/example-cryptex
- DMG: https://github.com/xsscx/srd/raw/main/dmg/srd-universal-cryptex.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
- Discussion: nvram settings disabling KTRR, CTRR and kASLR https://github.com/apple/security-research-device/discussions/2

- IPSW & Cryptex Installations 
    -  Build Info, Issue Tracker
    -  Summary & Workarounds 
    -  iPhone 11 & 12 SRD Models 
- Pre-built DMG's for the Apple Security Research Device 
    - toyboxunstripped
    - frida
    - debugserver
    - Sample PoC's from CVE's
        - Chain3
        - P0 PoC's
            - Stage 0,1,2
            - port_refs
        - ZecOps 
            - iOS 13 + 14 Voucher Leak 
- Sample Code
    - Example ASAN Makefile and Binary
    - Example UBSAN Makefile and Binary
    - Example Code Coverage Makefile and Binary
    - Example libarchive.a
    - Example aslr Binary
    - Example Binaries in /bin
# SRD DMG Testing
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 16 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 16
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21F79 and Cryptex Manager from X86_64 and M1 T8101 Platforms 

SRD Cryptex Log Collector
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/srd-cryptex-logcollector.sh)"
```

# Hosts
X86_64
---
```
sysctl -a | grep CPU
machdep.cpu.brand_string: Intel(R) Core(TM) i7-8700B CPU @ 3.20GHz
```

Run Targets
---
```
SRD's - iPhone 11 and iPhone 12
iPhone 12 Pro Max
iPad 12 Pro
X86_64 mini
M1 T8101
```
How-To Compile for iOS
-----
```
xcrun -sdk iphoneos clang -g -O2  -mios-version-min=14.3 -DDEBUG=0  -Wall -Wpedantic -Wno-gnu -Werror -Wunused-variable -o a.out code.s
```
* To ALL - Open a Discussion, PR or Issue with Suggestions, Comments, Bugs, Feedback, Tips etc..
* Collaborative Research
* All Code and Questions are Welcome 
* When you see Code Errors, Fails or LOL's.. Please Open an Issue... Thanks!

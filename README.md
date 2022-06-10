# Welcome to Hoyt's SRD Repo
FRI 10 JUN 2022 at 0800 EDT

## START HERE

Get the Working Cryptex for iOS 15
------
- wget https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex.zip
- unzip hoyt-working-example-cryptex.zip
- cd public-domain
- make install 
```
[public-domain] - Creating disk image com.example.cryptex.dmg from distribution root /Users/xss/validate/public-domain/com.example.cryptex.dstroot
....................................................................................................................................................................................................................................................................................
created: /Users/xss/validate/public-domain/com.example.cryptex.dmg
[public-domain] - Creating cryptex /Users/xss/validate/public-domain/com.example.cryptex.cxbd - 1.3.3.7 from the disk image com.example.cryptex.dmg
```
Confirmation
```
# uname -a
Darwin SRD0009 21.6.0 Darwin Kernel Version 21.6.0: Mon May  9 00:43:43 PDT 2022; root:xnu-8020.140.20.0.4~16/RELEASE_ARM64_T8030 iPhone12,1 Toybox
# date
Tue May 31 18:10:33 EDT 2022
```
- Open an Issue if you have _any_ questions! OR
- Reach out via DM on Twitter https://twitter.com/h02332
- arm64e ./example-cryptex/ grab it https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex-plus-compiled-binaries-arm64e.zip

## SRD DMG Install for iOS 15
M1 T8101
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
X86_64 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/cryptexmanager-install.sh)" 
```
    
SUMMARY
----
- This Repo is __ahead__ of the Apple Repo
- Built on 21F79 with X86_64 and arm64e
- The DMG's are all Built with XNU-8019.41.5 and options Targeting for iOS 15

### SRD Example DMG, Build & Installation Status for iOS 15 w/ + XNU-8019.41.5 
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.4 (21F79) X86_64       | PASS          | PASS          | PASS          | PASS          
| macOS 12.4 (21F79) T8101  | PASS          | PASS          | PASS          | PASS 
| X86_64 Install to iPhone 11 16.0_20A5283p    | PASS         | PASS         | PASS          | PASS
| T8101 Install to iPhone 12 16.0_20A5283p    | PASS          | PASS          | PASS          | PASS 


### SRD Example DMG, Build & Installation Status for iOS 16 w/ + XNU-8019.41.5 
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.4 (21F79) X86_64       | PASS          | FAIL          | FAIL          | FAIL          
| macOS 12.4 (21F79) T8101  | FAIL          | FAIL          | FAIL          | FAIL 
| X86_64 Install to iPhone 11 16.0_20A5283p    | FAIL         | FAIL         | FAIL          | FAIL
| T8101 Install to iPhone 12 16.0_20A5283p    | FAIL          | FAIL          | FAIL          | FAIL 
* X86_64 Install with CryptexManager
## Last Known Good Working Configuration(s)
- SIP Enabled
- macOS 12.4 (21F79) X86_64 or M1 T8101 macOS 12.4 (21F79)
- cryptexctl or CryptexManager on arm64e, CryptexManager on X86_64
- Xcode Version 14.0 beta (14A5228q)

### Lastest IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone121_16.0_20A5283p_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone132iPhone133_16.0_20A5283p_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
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
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.6 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.6
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
```
clang -v
Apple clang version 13.1.6 (clang-1316.0.21.2)
Target: x86_64-apple-darwin21.3.0
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
M1 Apple Silicon
---
```
sysctl -a | grep M1
machdep.cpu.brand_string: Apple M1
```
```
clang -v
Apple clang version 13.1.6 (clang-1316.0.21.2)
Target: arm64-apple-darwin21.4.0
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```  
 SDK Path: "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.5 (19F5070b) arm64e"
 SDK Roots: [ 0] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.3 (19D49) arm64e"
 SDK Roots: [ 1] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.5 (19F5070b) arm64e"
 SDK Roots: [ 2] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.3 (19D50) arm64e"
 SDK Roots: [ 3] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/14.7.1 (18G82) arm64e"
 SDK Roots: [ 4] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5209h) arm64e"
 SDK Roots: [ 5] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5241a) arm64e"
 SDK Roots: [ 6] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.5 (19F5047e) arm64e"
 SDK Roots: [ 7] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E241) arm64e"
 SDK Roots: [ 8] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.2.1 (19C63) arm64e"
 SDK Roots: [ 9] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5225g) arm64e"
 SDK Roots: [10] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.5 (19F5057e) arm64e"
 SDK Roots: [11] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5235a) arm64e"
 SDK Roots: [12] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4.1 (19E258) arm64e"
 SDK Roots: [13] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.5 (19F77) arm64e"
 SDK Roots: [14] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/14.8 (18H17) arm64e"
 SDK Roots: [15] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5219e) arm64e"
 SDK Roots: [16] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.3 (19D5026g) arm64e"
 SDK Roots: [17] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.2 (19C56) arm64e"
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

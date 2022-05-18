# Welcome to Hoyt's SRD Repo
TUE 17 MAY 2022 at 2100 EDT
-----
1. The recent Build Issues with ./example-cryptex/ for arm64e are now Resolved with the Release of macOS 12.4 (21F79)
2. The Notes below are for those who haven't yet upgraded to macOS 12.4 (21F79) on arm64e
3. IF you experience Build Problems with Dropbear on arm64e, when using macOS 12.3 or lesser versions, such a conftest Crashing, read below
4. Just use the example cryptex DMG :-]

THU 12 MAY 2022 at 0600 US EDT
---
1. Building the default Apple example-cryptex fails, on arm64e, because of dropbear build macros that won't grab headers to permit ssh login
    - conftest crashes in arm64e are due to obsolete macros for dropbear and configure.ac
    - https://raw.githubusercontent.com/xsscx/srd/main/crashes/conftest-2022-05-05-arm64e.ips
2. DIFF
```
diff src/dropbear/dropbear-src/configure.ac ~/iphone11/src/dropbear/dropbear-src/configure.ac
1a2
>  Modified by dhoyt for Apple Security Research Device
382c383
< AC_HEADER_TIME
---
> AC_HEADER_STDC
```

3. Posted a quick workaround for dropbear and its configure.ac
    - https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/src/dropbear/configure.ac
4. Use the pre-built DMG's using arm64e
    - https://github.com/xsscx/srd/tree/main/dmg
5. Cryptex personalizations from X86_64 result with a Crash when using cryptexctl, see Issues https://github.com/xsscx/srd/issues/26 & https://github.com/xsscx/srd/issues/25. Use arm64e for cryptex personalizations and installations to SRD
6. This Repo will become Code Only with basic readme.rtfm and all Write-ups, Comments moved to https://srd.cx to lower the Noise for Cloning. 
7. Changes ongoing thru 31 MAY 2022

X86_64 Bugs du Jour for cryptexctl
------------
- macOS 12.4 (21F79) X86_64 Note: cryptexctl == EXC_BAD_ACCESS (SIGSEGV)
    - [CryptexManager](https://github.com/pinauten/CryptexManager) on X86_64 has AMFI complaints and isn't reliable
- cryptexctl X86_64 Error: manifest constraint violated: BORD: 13
    - com.apple.cryptex ==  firmware execution failed: 13: Permission denied 
    - MobileStorageMounter Failed to install cryptex (<private>): 13 (Permission denied)
## SRD DMG Install
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
- This Repo is __ahead__ of the Apple Repo b
- Built on 21F79 with X86_64 and arm64e
- The DMG's are all Built with XNU-8019.41.5 and options Targeting for iOS 15
- This Repo aka PR42 https://github.com/apple/security-research-device/pull/42
- If you see unsuitable CT policy .. for this platform/device, rejecting signature
    - MUST personalize & install from arm64e platform only, X86_64 results with AMFI complaints

### SRD Example DMG, Build & Installation Status w/ XNU-8019.41.5 
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.4 (21F79) X86_64       | PASS          | PASS          | PASS          | PASS          
| macOS 12.4 (21F79) T8101  | PASS          | PASS          | PASS          | PASS 
| X86_64 Install to iPhone 11 19E258    | SIGSEGV         | SIGSEGV         | SIGSEGV          | SIGSEGV
| T8101 Install to iPhone 12 19E258    | PASS          | PASS          | PASS          | PASS 

## Last Known Good Working Configuration(s)
- SIP Enabled
- macOS 12.2.1 (21D62) X86_64 or M1 T8101 macOS 12.3 (21E230)
- Xcode Version 13.3 (13E113)

### Lastest IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone11,8,iPhone12,1_15.5_19F5070b_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_15.5_19F5070b_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
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
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.4 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.4
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21C39 and Cryptex Manager from X86_64 and M1 T8101 Platforms 

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
 SDK Path: "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5209h) arm64e"
 SDK Roots: [ 0] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.3 (19D49) arm64e"
 SDK Roots: [ 1] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.3 (19D50) arm64e"
 SDK Roots: [ 2] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/14.7.1 (18G82) arm64e"
 SDK Roots: [ 3] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5209h) arm64e"
 SDK Roots: [ 4] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.2.1 (19C63) arm64e"
 SDK Roots: [ 5] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5225g) arm64e"
 SDK Roots: [ 6] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5235a) arm64e"
 SDK Roots: [ 7] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/14.8 (18H17) arm64e"
 SDK Roots: [ 8] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5219e) arm64e"
 SDK Roots: [ 9] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.3 (19D5026g) arm64e"
 SDK Roots: [10] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.2 (19C56) arm64e"
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

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

Follow this Repo and read URL https://srd.cx/srd-cryptex-installation/


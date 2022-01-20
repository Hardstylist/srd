# Welcome to Hoyt's SRD Repo for the Apple Security Research Device

SUN 16 JAN 2022
----
- Source: https://github.com/xsscx/srd/tree/main/SecurityResearchTools_21C39/example-cryptex
- DMG: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
- Build: https://xss.cx/srd/21C39/example-cryptex.zip

## Prerequisites
- macOS Version 12.1 (21C52)
- Xcode Version 13.2.1 (13C100)
- Security Research Tools 21C39 (SRT 21C39)
- GNU sed
- automake

If you use brew:

```sh
brew install gnu-sed automake
```
SRD DMG Install
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
SRD DMG File
---
```
shasum srd-universal-cryptex.dmg
9f7f30af3beab25f404cc47a89818a306f1da1ad  srd-universal-cryptex.dmg
26M Jan 15 18:20 srd-universal-cryptex.dmg
```
SRD DMG Testing
-----
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.3 Beta 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.3 Beta
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21C39 and Cryptex Manager from X86_64 and M1 T8101 Platforms 

SRD Cryptex Log Collector
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
Do you have questions or need help? Reach out and open an Issue or Discussion. DM if that's easier. Include some of the Details from these Logs.

# Recent IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.3_19D49_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.3_19D49_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone11,8,iPhone12,1_15.3_19D5040e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_15.3_19D5040e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
```
The above means that from X86_64 and/or M1 ARM the SRD IPSW has been installed with cryptex personalization verified.

SRD DMG Contents 
-----
```
tree com.example.cryptex.dstroot
com.example.cryptex.dstroot
├── Library
│   └── LaunchDaemons
│       ├── debugserver.plist
│       ├── dropbear-research.plist
│       ├── hello.plist
│       ├── re.frida.policyd.plist
│       ├── re.frida.server.plist
│       ├── simple-server.plist
│       └── simple-shell.plist
└── usr
    ├── bin
    │   ├── [ -> toybox
    │   ├── a.out
    │   ├── ascii -> toybox
    │   ├── aslr
    │   ├── base64 -> toybox
    │   ├── basename -> toybox
    │   ├── bash -> toybox
    │   ├── binbag
    │   ├── c1.exr
    │   ├── c2.exr
    │   ├── cal -> toybox
    │   ├── cat -> toybox
    │   ├── catv -> toybox
    │   ├── chain3
    │   ├── chgrp -> toybox
    │   ├── chmod -> toybox
    │   ├── chown -> toybox
    │   ├── cksum -> toybox
    │   ├── clear -> toybox
    │   ├── cmp -> toybox
    │   ├── comm -> toybox
    │   ├── count -> toybox
    │   ├── cp -> toybox
    │   ├── cpio -> toybox
    │   ├── crash.pvr
    │   ├── crc32 -> toybox
    │   ├── cryptex-run
    │   ├── cut -> toybox
    │   ├── date -> toybox
    │   ├── debugserver
    │   ├── df -> toybox
    │   ├── dirname -> toybox
    │   ├── disarm
    │   ├── dos2unix -> toybox
    │   ├── dropbear
    │   ├── du -> toybox
    │   ├── echo -> toybox
    │   ├── egrep -> toybox
    │   ├── env -> toybox
    │   ├── envprint
    │   ├── expand -> toybox
    │   ├── factor -> toybox
    │   ├── fallocate -> toybox
    │   ├── false -> toybox
    │   ├── fgrep -> toybox
    │   ├── file -> toybox
    │   ├── find -> toybox
    │   ├── flock -> toybox
    │   ├── fmt -> toybox
    │   ├── frida-server
    │   ├── ftpget -> toybox
    │   ├── ftpput -> toybox
    │   ├── fuzzed.tif
    │   ├── getconf -> toybox
    │   ├── grep -> toybox
    │   ├── groups -> toybox
    │   ├── head -> toybox
    │   ├── hello
    │   ├── hello-code-cov
    │   ├── hello_world
    │   ├── hellosan
    │   ├── help -> toybox
    │   ├── hexedit -> toybox
    │   ├── hostname -> toybox
    │   ├── iconv -> toybox
    │   ├── id -> toybox
    │   ├── image.jpeg
    │   ├── ioclass
    │   ├── ioprint
    │   ├── ioreg
    │   ├── ios-13_voucher_leak
    │   ├── ios-14-voucher_leak
    │   ├── ios-command-line-tool
    │   ├── ioscan
    │   ├── jtool2
    │   ├── kill -> toybox
    │   ├── killall5 -> toybox
    │   ├── leak64
    │   ├── libarchive.a
    │   ├── libgmalloc.dylib
    │   ├── libmemctl_core.a
    │   ├── link -> toybox
    │   ├── lister
    │   ├── ln -> toybox
    │   ├── logger -> toybox
    │   ├── logname -> toybox
    │   ├── ls -> toybox
    │   ├── md5sum -> toybox
    │   ├── memctl
    │   ├── microcom -> toybox
    │   ├── mkdir -> toybox
    │   ├── mkfifo -> toybox
    │   ├── mktemp -> toybox
    │   ├── mv -> toybox
    │   ├── nc -> toybox
    │   ├── netcat -> toybox
    │   ├── nice -> toybox
    │   ├── nl -> toybox
    │   ├── nohup -> toybox
    │   ├── nvram
    │   ├── od -> toybox
    │   ├── optool
    │   ├── orig.tif
    │   ├── paste -> toybox
    │   ├── patch -> toybox
    │   ├── port_refs
    │   ├── prinfkernversion
    │   ├── printenv -> toybox
    │   ├── printf -> toybox
    │   ├── pwd -> toybox
    │   ├── pwdx -> toybox
    │   ├── readlink -> toybox
    │   ├── realpath -> toybox
    │   ├── renice -> toybox
    │   ├── rev -> toybox
    │   ├── rm -> toybox
    │   ├── rmdir -> toybox
    │   ├── sed -> toybox
    │   ├── seq -> toybox
    │   ├── setsid -> toybox
    │   ├── sh -> toybox
    │   ├── sha1sum -> toybox
    │   ├── simple-server
    │   ├── simple-shell
    │   ├── skywalktest
    │   ├── sleep -> toybox
    │   ├── sort -> toybox
    │   ├── split -> toybox
    │   ├── stage0
    │   ├── stage1
    │   ├── stage2
    │   ├── stat -> toybox
    │   ├── strings -> toybox
    │   ├── tac -> toybox
    │   ├── tail -> toybox
    │   ├── tar -> toybox
    │   ├── tee -> toybox
    │   ├── test -> toybox
    │   ├── test1
    │   ├── test2
    │   ├── test3
    │   ├── test4
    │   ├── test6
    │   ├── test7
    │   ├── test8
    │   ├── tester
    │   ├── time -> toybox
    │   ├── timeout -> toybox
    │   ├── touch -> toybox
    │   ├── toybox
    │   ├── toysh -> toybox
    │   ├── true -> toybox
    │   ├── truncate -> toybox
    │   ├── tty -> toybox
    │   ├── uname -> toybox
    │   ├── uniq -> toybox
    │   ├── unix2dos -> toybox
    │   ├── unlink -> toybox
    │   ├── usleep -> toybox
    │   ├── uudecode -> toybox
    │   ├── uuencode -> toybox
    │   ├── uuidgen -> toybox
    │   ├── vi -> toybox
    │   ├── vs_cli
    │   ├── w -> toybox
    │   ├── watch -> toybox
    │   ├── wc -> toybox
    │   ├── welcome
    │   ├── wget -> toybox
    │   ├── which -> toybox
    │   ├── who -> toybox
    │   ├── whoami -> toybox
    │   ├── xargs -> toybox
    │   ├── xxd -> toybox
    │   ├── yes -> toybox
    │   └── zprint
    └── lib
        └── frida
            └── frida-agent.dylib

6 directories, 184 files
```

Audit Trail
---
```
frida-ps -Uai
PID  Name                Identifier
---  ------------------  -------------------------------------
304   Safari          com.apple.mobilesafari
  -   App Store       com.apple.AppStore
  -   Books           com.apple.iBooks
  -   Calculator      com.apple.calculator
  -   Calendar        com.apple.mobilecal
  -   Camera          com.apple.camera
  -   Clock           com.apple.mobiletimer
  -   Compass         com.apple.compass
  -   Contacts        com.apple.MobileAddressBook
  -   FaceTime        com.apple.facetime
  -   Feedback        com.apple.appleseed.FeedbackAssistant
  -   Files           com.apple.DocumentsApp
  -   Find My         com.apple.findmy
  -   Health          com.apple.Health
  -   Home            com.apple.Home
  -   Magnifier       com.apple.Magnifier
  -   Mail            com.apple.mobilemail
  -   Maps            com.apple.Maps
  -   Measure         com.apple.measure
  -   Messages        com.apple.MobileSMS
  -   Music           com.apple.Music
  -   News            com.apple.news
  -   Notes           com.apple.mobilenotes
  -   Phone           com.apple.mobilephone
  -   Photos          com.apple.mobileslideshow
  -   Podcasts        com.apple.podcasts
  -   Reminders       com.apple.reminders
  -   Settings        com.apple.Preferences
  -   Shortcuts       com.apple.shortcuts
  -   Sidecar         com.apple.sidecar
  -   Stocks          com.apple.stocks
  -   TV              com.apple.tv
  -   Tips            com.apple.tips
  -   Translate       com.apple.Translate
  -   Voice Memos     com.apple.VoiceMemos
  -   Wallet          com.apple.Passbook
  -   Weather         com.apple.weather
  -   Web             com.apple.webapp
  -   Xcode Previews  com.apple.dt.XcodePreviews
  -   iTunes Store    com.apple.MobileStore
```

Makefile
-----
21C39 https://github.com/xsscx/srd/blob/main/SecurityResearchTools_21C39/example-cryptex/Makefile

XNU Export
---
```
export XNU_VERSION=xnu-7195.141.2
```
X86_64
---
```
sysctl -a | grep Intel
machdep.cpu.brand_string: Intel(R) Core(TM) i7-8700B CPU @ 3.20GHz
```
```
clang -v
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: x86_64-apple-darwin21.2.0
Thread model: posix
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
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```
iOS SDK 14.3 => 15.2
```
Run Targets
---
```
SRD's - iPhone 11 and iPhone 12
iPhone 12 Pro Max
iPad 12 Pro
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


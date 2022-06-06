#!/bin/sh
echo "SRD DMG Build for X86_64 using CryptexManager..."
make clean
make all
hdiutil attach com.example.cryptex.dmg
CryptexManager create -i com.example.cryptex -v 1.3.3.7  com.example.cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx
CryptexManager  install /tmp/cptx
CryptexManager list 
hdiutil detach /Volumes/com.example.cryptex.dstroot
rm -rf /tmp/cptx com.example.cryptex.cxbd
echo "All Done Here....."

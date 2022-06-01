#!/bin/sh
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Running make clean; make all.... then install with CryptexManger"
make clean
make all
hdiutil attach com.example.cryptex.dmg
echo "Installing a Cryptex with CryptexManager\n\n Using CryptexManager create -i com.example.cryptex -v 1.3.3.7  com.example.cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx\n\n"
CryptexManager create -i com.example.cryptex -v 1.3.3.7  com.example.cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx
CryptexManager install /tmp/cptx
CryptexManager list
hdiutil detach /Volumes/com.example.cryptex.dstroot
rm -rf /tmp/cptx com.example.cryptex.cxbd
echo "done..."

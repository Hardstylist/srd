#!/bin/sh
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Running make clean; make all.... then install with CryptexManger"
rm -rf srd-universal-cryptex.dmg
make clean
make all
echo "Changing to toybox unstripped"
chmod 775 src/toybox/toybox-src/generated/unstripped/toybox
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
codesign --force -s - --entitlements src/toybox/entitlements.plist com.example.cryptex.dstroot/usr/bin/toybox
echo "running.. hdiutil create srd-universal-cryptex.dmg"
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot srd-universal-cryptex.dmg
echo "running.. hdiutil attach srd-universal-cryptex.dmg"
hdiutil attach srd-universal-cryptex.dmg
echo "Installing a Cryptex with CryptexManager\n\n Using CryptexManager create -i com.example.cryptex -v 1.3.3.7  srd-universal-cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx\n\n"
CryptexManager create -i com.example.cryptex -v 1.3.3.7  srd-universal-cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx
CryptexManager install /tmp/cptx
CryptexManager list
hdiutil detach /Volumes/com.example.cryptex.dstroot
rm -rf /tmp/cptx com.example.cryptex.cxbd
echo "done..."

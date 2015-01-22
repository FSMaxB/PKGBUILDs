#!/bin/sh
rm -v Terasology.zip
echo updpkgsums
updpkgsums
chmod -v 644 PKGBUILD
echo mkaurball -f
mkaurball -f

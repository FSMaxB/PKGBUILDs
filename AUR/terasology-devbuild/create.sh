#!/bin/sh

if [[ ! $# -eq "1" ]]; then
	echo "Usage:"
	echo "$0 version"
	exit 1
fi

rm -v Terasology.zip
rm -rv src/
echo "Setting version to $1"
sed -i "s/pkgver=.*/pkgver=$1/g" PKGBUILD
echo updpkgsums
updpkgsums
chmod -v 644 PKGBUILD
echo mkaurball -f
mkaurball -f
makepkg

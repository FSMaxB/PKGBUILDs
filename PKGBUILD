pkgname=terasology
_version=1.4.0
_version_postfix=alpha7
pkgver=${_version}${_version_postfix}
pkgrel=3
epoch=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64' 'i686')
license=('Apache')
url="http://terasology.org"
options=('!strip')
depends=('java-environment-openjdk=8' 'openal' 'libxcursor' 'libxxf86vm' 'libxrandr')
makedepends=('unzip')
source=(
    "$pkgname"
    "${pkgname}.desktop"
    "https://github.com/MovingBlocks/Terasology/releases/download/v${_version}/TerasologyOmega.zip"
)
sha512sums=('f94c1ac3d85e4fb91cc47056eeec3648d02be9090252401acb740af8c0580623c7ee57470d9e7317d6b577d613e317b5c16ec014f232ec68bc755e0eba7a975e'
            '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
            '85b8115d5b5613e7bcc293d02031c6218750671fa7f42f3a2b58964ddb06040a02b1cf8addc7dd7e0d0ab7f9443a90b776a68051052508ab6dbf49c1a771b6b4')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega.zip"

    #extract and install icons
    unzip -u libs/engine-${_version}.jar "org/terasology/icons/*"
    pushd org/terasology/icons
    for icon in *
    do
        size=${icon##*_}        #gooey_sweet_XX.png -> XX.png
        size=${size/.png/}      #XX.png -> XX
        install -Dm 644 "$icon" "${pkgdir}/usr/share/icons/${size}x${size}/apps/${pkgname}.png"
    done
    install -Dm 644 "${pkgdir}/usr/share/icons/64x64/apps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    popd
    rm -r org

    #remove files/dirs for other operating systems
    rm run_macosx.command Terasology.{x86,x64}.exe
    rm -r natives/{macosx,windows}
    rm natives/linux/libopenal*
    if [[ "$CARCH" == 'x86_64' ]]; then
        rm natives/linux/lib{jinput-linux,lwjgl}.so
    elif [[ "$CARCH" == 'i686' ]]; then
        rm natives/linux/lib{jinput-linux,lwjgl}64.so
    fi

    cp -ra "$srcdir" "${pkgdir}/usr/share/${pkgname}"
}

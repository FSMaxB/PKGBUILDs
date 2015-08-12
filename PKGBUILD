# Maintainer: Max Bruckner (FSMaxB)
pkgname=mecab
pkgver=0.996
pkgrel=4
pkgdesc="Yet another part-of-speech and morphological analyzer."
arch=('i686' 'x86_64')
url="https://taku910.github.io/mecab"
license=('GPL2')
install=mecab.install
source=("$pkgname-$pkgver.tar.gz::https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE")
sha512sums=('aca6d16f411b9ba9b6687242246aeb28ede6d6c6a9122d4a32da9d8e76e79b5f4af2c8e3b13ad9462b34e9d2994cbd9bbbedebac45609684db9b703da999577f')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

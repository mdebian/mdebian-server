#! /bin/sh

# Remove previous packages
rm -fv mdebian-*.deb

# Loop through the different packages
for PKG in mdebian-*; do
	# Build the package
	fakeroot dpkg-deb --build ${PKG}
	# Get the version number of the package
	VERSION=$(cat ${PKG}/DEBIAN/control | grep Version | awk '{print $2}')
	# Rename the package to include the version number
	mv -fv ${PKG}.deb ${PKG}_${VERSION}.deb
done

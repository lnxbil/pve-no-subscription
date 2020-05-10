PACKAGE=pve-no-subscription

all:
	@echo "nothing to compile"

install:
	@mkdir -p $(DESTDIR)/etc/apt/apt.conf.d
	@mkdir -p $(DESTDIR)/etc/apt/sources.list.d
	@mkdir -p $(DESTDIR)/etc/apt/trusted.gpg.d
	@mkdir -p $(DESTDIR)/usr/share/pve-no-subscription
	@install -m 644 apt-hook $(DESTDIR)/etc/apt/apt.conf.d/99-pve-no-subscription
	@install -m 755 no-subscription-warning.sh $(DESTDIR)/usr/share/pve-no-subscription
	@install -m 644 no-subscription-warning-*.patch $(DESTDIR)/usr/share/pve-no-subscription
	@install -m 644 pve-no-subscription.list $(DESTDIR)/etc/apt/sources.list.d

package-clean:
	@rm -f ../$(PACKAGE)_* debian/files debian/$(PACKAGE).substvars debian/$(PACKAGE).debhelper.log
	@rm -rf debian/$(PACKAGE)

clean: package-clean

# suggested way described in
# https://wiki.debian.org/buildd
package: package-clean
	@echo "-------------------------------[ dpkg-buildpackage ] -------------------------"
	@env -i PATH=/usr/bin:/bin SHELL=/bin/sh dpkg-buildpackage -I.git -i'\.git/' < /dev/null
	@echo "-----------------------------------[ lintian ] -------------------------------"
	@lintian || true
	@echo "-----------------------------------[ package ] -------------------------------"
	@mv ../$(PACKAGE)*deb .
	@ls -1 $(PACKAGE)*deb

docker-package:
	@docker build -t pve-no-subscription .
	@docker run -t --rm --user $(shell id -u) --volume $(PWD):/tmp/workdir --workdir /tmp/workdir pve-no-subscription make package


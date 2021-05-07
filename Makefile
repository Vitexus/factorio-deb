version=1.1.32
#https://www.factorio.com/get-download/1.1.32/demo/linux64
archive="factorio_demo_x64_$(version).tar.xz"
repoversion=$(shell LANG=C aptitude show factorio-demo | grep Version: | awk '{print $$2}')
nextversion=$(shell echo $(repoversion) | perl -ne 'chomp; print join(".", splice(@{[split/\./,$$_]}, 0, -1), map {++$$_} pop @{[split/\./,$$_]}), "\n";'

download:
	wget -c https://factorio.com/get-download/$(version)/demo/linux64 -O $(archive)

deb:
	debuild -us -uc

release:
	echo Release v$(nextversion)
	dch -v $(nextversion) `git log -1 --pretty=%B | head -n 1`
	debuild -i -us -uc -b
	git commit -a -m "Release v$(nextversion)"
	git tag -a $(nextversion) -m "version $(nextversion)"



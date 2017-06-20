package=boost
package_version=1_64_0
package_out_dir=$${INSTALLROOT}
package_download_url="https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.bz2"
package_build_dir=/tmp/$(package)_$(package_version)
package_tarball=/tmp/$(package)_$(package_version).tar.bz2

all: $(package_tarball)
	tar xvjpf $(package_tarball) -C /tmp && \
	cd $(package_build_dir) && \
	sh ./bootstrap.sh && \
	./b2 --prefix=$(package_out_dir) \
        --without-python \
        --without-mpi  \
        --without-graph_parallel  \
        --without-graph \
        --buildid=gcc52-mt-s \
        variant=release link=static runtime-link=static threading=multi \
        install

$(package_tarball):
	curl -k $(package_download_url) -o $(package_tarball)

.PHONY: all

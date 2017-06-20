package=boost
package_version=1_64_0
package_out_dir=$${INSTALLROOT}
package_download_url="https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.bz2"
package_build_dir=/tmp/$(package)_$(package_version)
package_tarball=/tmp/$(package)_$(package_version).tar.bz2

#ref: http://www.boost.org/build/doc/html/bbv2/overview/invocation.html
all: $(package_tarball)
	tar xvjpf $(package_tarball) -C /tmp && \
	cd $(package_build_dir) && \
	sh ./bootstrap.sh && \
	./b2 --prefix=$(package_out_dir) \
        --without-python \
        --without-mpi  \
        --without-graph_parallel  \
        --without-graph \
        --buildid=gcc52-mt \
        variant=release link=shared runtime-link=shared threading=multi \
        install

$(package_tarball):
	curl -k $(package_download_url) -o $(package_tarball)

.PHONY: all

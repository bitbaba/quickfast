package=boost
package_version=1_64_0
package_out_dir=$${INSTALLROOT}
#package_download_url="https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.bz2"
package_download_url="https://akamai.bintray.com/7b/7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332?__gda__=exp=1504082600~hmac=40ec655bd425d537f547be6393c5eb175f6439a066b23d6e7cc293dc51909a2d&response-content-disposition=attachment%3Bfilename%3D%22boost_1_64_0.tar.bz2%22&response-content-type=application%2Fx-bzip2&requestInfo=U2FsdGVkX1_wsOjHO9WpWW2NOBoPDT9A0BzgOK8hi_LTw81y8OnszBBmu4SCUtDYvnNNGXL-Qj44Xv6K-Z7LPL9wD3U9wByRUVvGamLBLoFtlwupEii2Lrr_UNxjpdXSh4L73bpYKn8KT4jJL9Zvmw"
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

package=boost
package_version=1_38_0
package_out_dir=$${INSTALLROOT}
package_download_url="http://downloads.sourceforge.net/project/boost/boost/1.38.0/boost_1_38_0.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.38.0%2F&ts=1479875934&use_mirror=kent:"
package_build_dir=/tmp/$(package)_$(package_version)
package_tarball=/tmp/$(package)_$(package_version).tar.gz

all: $(package_tarball)
	tar zxvf $(package_tarball) -C /tmp && \
	cd $(package_build_dir) && \
	./configure --prefix=$(package_out_dir) \
        --without-libraries=python \
        --without-libraries=mpi  \
        --without-libraries=graph CXXFLAGS="-w" && \
	make && \
        make install && \
        make clean

$(package_tarball):
	curl -k $(package_download_url) -o $(package_tarball)

.PHONY: all

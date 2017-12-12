package=xerces-c
$(package)_version=3.1.4
$(package)_out_dir=$${abs_repo_root}/build
$(package)_download_url="http://archive.apache.org/dist/xerces/c/3/sources/$(package)-$($(package)_version).tar.bz2"
$(package)_file=$${abs_repo_root}/depends/sources/$(package)-$($(package)_version).tar.bz2
$(package)_sha256hash=
$(package)_temp_build_dir=/tmp/$(package)-$($(package)_version)

all: $($(package)_file)
	tar xvjpf $($(package)_file) -C /tmp > /dev/null && \
    cd $($(package)_temp_build_dir) && \
    ./configure --prefix=$($(package)_out_dir) \
    --enable-shared=no \
    --with-pic \
    --without-icu \
    --without-curl \
    --enable-static=yes \
    CFLAGS='-fPIC' CXXFLAGS='-fPIC' && \
    make && \
    make install && \
    make clean

$($(package)_file):
	if [ -f $($(package)_file) ] ; then echo cached; else curl -k -L $($(package)_download_url) -o $($(package)_file); fi

.PHONY: all 

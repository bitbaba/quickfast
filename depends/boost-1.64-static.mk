#!/bin/bash
package=boost
$(package)_version=1_64_0
$(package)_out_dir=$${abs_repo_root}/build
$(package)_download_url="https://dl.bintray.com/boostorg/release/1.64.0/source/$(package)_$($(package)_version).tar.bz2"
$(package)_file=$${abs_repo_root}/depends/sources/$(package)_$($(package)_version).tar.bz2
$(package)_sha256hash=7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332
$(package)_temp_build_dir=/tmp/$(package)_$($(package)_version)

#ref: http://www.boost.org/build/doc/html/bbv2/overview/invocation.html
all: $($(package)_file)
	tar xvjpf $($(package)_file) -C /tmp > /dev/null && \
	cd $($(package)_temp_build_dir) && \
	/bin/bash ./bootstrap.sh && \
	./b2 --prefix=$($(package)_out_dir) \
        --without-python \
        --without-mpi  \
        --without-graph_parallel  \
        --without-graph \
        --buildid=gccunk-mt \
        variant=release link=static runtime-link=shared threading=multi \
        install > /dev/null 

$($(package)_file):
	if [ -f $($(package)_file) ] ; then echo cached; else curl -k -L $($(package)_download_url) -o $($(package)_file); fi

.PHONY: all

# =============================================================================
# Copyright (c) 2009-2014, Broadcom Corporation
# All rights reserved.
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# =============================================================================

.PHONY: libvcos

LIBVCOS = ../$(RTOS)/libvcos.a

VPATH += ../$(RTOS)
COMPILER ?= cl

include common.mk

SRC_ROOT ?= ../../..

IPATH=-I$(SRC_ROOT) -I$(SRC_ROOT)/interface/vcos/$(RTOS)


all: vcos_test$(EXESFX)

include ../$(RTOS)/rules.mk

OBJECTS=$(SOURCES:.c=.$(OBJEXT)) $(CPP_SOURCES:.cpp=.$(OBJEXT))

vcos_test$(EXESFX): $(OBJECTS) $(LIBVCOS)
	echo $(OBJECTS) 
	${link_cmd}


$(LIBVCOS): libvcos
	$(MAKE) -C ../$(RTOS) CFLAGS="$(CFLAGS)" COMPILER=$(COMPILER)


clean:
	$(clean_cmd)

-include *.d


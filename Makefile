EXE := gpiod
OBJS := gpiod.o
INSTALL_DIR ?= ./.install
SCRIPT := esme-led.sh

CFLAGS += $(shell pkg-config --cflags libgpiod)
LDLIBS += $(shell pkg-config --libs libgpiod)

all: $(EXE)

$(EXE): $(OBJS)

install: $(EXE)
	install -d $(INSTALL_DIR)/usr/bin
	install -d $(INSTALL_DIR)/etc/init.d
	install -m 755 $(SCRIPT) $(INSTALL_DIR)/etc/init.d
	install -m 755 $(EXE) $(INSTALL_DIR)/usr/bin/$(EXE)

clean:
	-$(RM) $(OBJS) $(EXE)

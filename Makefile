EXE := gpiod
OBJS := gpiod.o
INSTALL_DIR ?= ./.install
SCRIPT := esme-led.sh

CFLAGS += $(shell pkg-config --cflags libgpiod)
LDLIBS += $(shell pkg-config --libs libgpiod)

all: $(EXE)

$(EXE): $(OBJS)

install: $(EXE)
	install -D $(INSTALL_DIR)/usr/bin
	install $(SCRIPT) $(INSTALL_DIR)/etc/init.d
	install $(EXE) $(INSTALL_DIR)/usr/bin

clean:
	-$(RM) $(OBJS) $(EXE)

LDC=/home/kubo39/dev/espressif/build-ldc/bin/ldc2

.PHONY: all
all: build

.PHONY: build
build:
	$(LDC) \
		--mtriple=xtensa-esp32s3-elf \
		--betterC \
		--gcc=xtensa-esp32s3-elf-gcc \
		-Xcc=-nostartfiles \
		-L-T./xtensa.x \
		-of=app.bin \
		main.d

.PHONY: clean
clean:
	-rm *.bin *.o

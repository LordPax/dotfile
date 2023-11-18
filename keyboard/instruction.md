# Instruction pour flasher le firmware

## Microcontroller

* stm32f303

```bash
dfu-util -a 0 -D <file> -s 0x08000000
```

* atmega32u4

```bash
dfu-programmer atmega32u4 erase
dfu-programmer atmega32u4 flash <file>
dfu-programmer atmega32u4 reset
```

or my personal script

```bash
flash -m atmega32u4 -f <file>
```

* atmega32a

```bash
bootloaderHID -r <file>
```

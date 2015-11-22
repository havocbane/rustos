section .multiboot_header
header_start:
        dd 0xE85250D6                ; magic number (multiboot 2)
        dd 0                         ; architechture 0 (protected mode i386)
        dd header_end - header_start ; header length
        ; checksum: -(magic_number + architechture + header_length)
	; Note: subtracting from 2^32 results in a carry in MSB past 32-bits,
	; which leaves 0 in the checksum.
        dd 0x100000000 - (0xE85250D6 + 0 + (header_end - header_start))

        ; insert optional multiboot tags here

        ; required end tag
        dw 0                    ; type
        dw 0                    ; flags
        dd 8                    ; size
header_end:

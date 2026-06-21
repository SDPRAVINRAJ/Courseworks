TITLE Lab 3 Part 2C
; Author: PRAVINRAJ A/L SIVABATHI and DHESHIEGHAN A/L SARAVANA MOORTHY
; Date: 28 June 2024

INCLUDE Irvine32.inc

.data
welcomeMsg BYTE "Welcome to Simple Math Activities: ", 0
mainMenu BYTE "Main Menu ", 0
option1 BYTE "1. To calculate Perimeter Hexagon (Loop and ADD instructions) ", 0
option2 BYTE "2. To calculate SUM (unsign int) index (Odd or Even) in an Array Hello[6] ", 0
inputMsg BYTE "Select Your Input ", 0

perimeterTitle BYTE "Calculate Perimeter 2-Hexagon (LOOP and ADD instructions) ", 0
perimeterPrompt1 BYTE "Input Hexagon 1 (side length) ", 0
perimeterPrompt2 BYTE "Input Hexagon 2 (side length) ", 0
perimeterResult BYTE "Result of Perimeter Hexagon 1: ", 0
perimeterResult2 BYTE "Result of Perimeter Hexagon 2: ", 0
perimeterTotal BYTE "Total Perimeter Hexagon 1 and 2: ", 0
continueMsg BYTE "Press 'y' to Main Menu or 'n' to Exit the benchmark ", 0
sideHex1 DWORD ?
sideHex2 DWORD ?
Perimeter_hexagon1 DWORD ?
Perimeter_hexagon2 DWORD ?
TotalPerimeter DWORD ?
ans BYTE ?

sumTitle BYTE "Calculate SUM (unsign INT) index (Odd or Even) in array Hello[6] ", 0
sumPrompt BYTE "Integer Input ", 0
sumResult BYTE "Result Sum Hello[index]: ", 0
sumTotalEvenMsg BYTE "Sum Hello[even] index location: ", 0
sumTotalOddMsg BYTE "Sum Hello[odd] index location: ", 0
hello DWORD 6 DUP(?)
TotalEVEN DWORD ?
TotalODD DWORD ?

exitMsg BYTE "Thank you ... BYE!! ", 0

.code
main proc
Main_Menu:
    ; Display main menu
    ; Display title
    mov edx, OFFSET welcomeMsg
    call WriteString
    call CrLf

    ; Display options
    mov edx, OFFSET option1
    call WriteString
    call CrLf
    mov edx, OFFSET option2
    call WriteString
    call CrLf
    mov edx, OFFSET inputMsg
    call WriteString
    call ReadInt
    call CrLf

    cmp eax, 1
    je perHex_loopAdd
    cmp eax, 2
    je calSum_oddeven
    jmp Main_Menu

perHex_loopAdd:
    ; Display title
    mov edx, OFFSET perimeterTitle
    call WriteString
    call CrLf

    ; Display prompts
    mov edx, OFFSET perimeterPrompt1
    call WriteString
    call ReadDec
    mov sideHex1, eax
    call CrLf

    mov edx, OFFSET perimeterPrompt2
    call WriteString
    call ReadDec
    mov sideHex2, eax
    call CrLf

    ; Calculate perimeter of hexagon 1
    mov ecx, 6           ; Loop 6 times for 6 sides
    mov eax, 0           ; Initialize perimeter accumulator
    mov ebx, sideHex1    ; Load side length of hexagon 1

calcPerimeter1:
    add eax, ebx         ; Add side length to perimeter
    loop calcPerimeter1

    mov Perimeter_hexagon1, eax

    ; Calculate perimeter of hexagon 2
    mov ecx, 6           ; Loop 6 times for 6 sides
    mov eax, 0           ; Initialize perimeter accumulator
    mov ebx, sideHex2    ; Load side length of hexagon 2

calcPerimeter2:
    add eax, ebx         ; Add side length to perimeter
    loop calcPerimeter2

    mov Perimeter_hexagon2, eax

    ; Calculate total perimeter
    mov eax, Perimeter_hexagon1
    add eax, Perimeter_hexagon2
    mov TotalPerimeter, eax

    ; Display results
    mov edx, OFFSET perimeterResult
    call WriteString
    mov eax, Perimeter_hexagon1
    call WriteDec
    call CrLf

    mov edx, OFFSET perimeterResult2
    call WriteString
    mov eax, Perimeter_hexagon2
    call WriteDec
    call CrLf

    mov edx, OFFSET perimeterTotal
    call WriteString
    mov eax, TotalPerimeter
    call WriteDec
    call CrLf

    ; Prompt to continue
    mov edx, OFFSET continueMsg
    call WriteString
    call ReadChar
    mov ans, al
    cmp ans, 'y'
    je Main_Menu
    jmp endProgram

calSum_oddeven:
    ; Display title
    mov edx, OFFSET sumTitle
    call WriteString
    call CrLf

    ; Initialize TotalEVEN and TotalODD to 0
    mov TotalEVEN, 0
    mov TotalODD, 0

    ; Loop to read 6 integers from user and store in hello array
    mov ecx, 6              ; Loop counter
    mov esi, OFFSET hello   ; Array index

input_loop:
    mov edx, OFFSET sumPrompt
    call WriteString
    call ReadInt
    mov [esi], eax          ; Store input in hello array
    add esi, 4              ; Move to next array element
    loop input_loop
    call CrLf

    ; Calculate TotalEVEN (values at even indices: HELLO[0], HELLO[2], HELLO[4])
    mov ecx, 3              ; Loop counter
    mov esi, OFFSET hello   ; Array index
    mov edi, 0              ; Element index for even positions

countEVEN:
    mov eax, [esi + edi]
    add TotalEVEN, eax
    add edi, 8              ; Move to next even position
    loop countEVEN

    ; Calculate TotalODD (values at odd indices: HELLO[1], HELLO[3], HELLO[5])
    mov ecx, 3              ; Loop counter
    mov esi, OFFSET hello   ; Array index
    mov edi, 4              ; Element index for odd positions

countODD:
    mov eax, [esi + edi]
    add TotalODD, eax
    add edi, 8              ; Move to next odd position
    loop countODD

    ; Display results
    mov edx, OFFSET sumResult
    call WriteString
    call CrLf

    ; Display TotalEVEN
    mov edx, OFFSET sumTotalEvenMsg
    call WriteString
    mov eax, TotalEVEN
    call WriteDec
    call CrLf

    ; Display TotalODD
    mov edx, OFFSET sumTotalOddMsg
    call WriteString
    mov eax, TotalODD
    call WriteDec
    call CrLf

    ; Prompt to continue
    mov edx, OFFSET continueMsg
    call WriteString
    call ReadChar
    mov ans, al
    cmp ans, 'y'
    je Main_Menu
    jmp endProgram

endProgram:
    ; Display exit message
    mov edx, OFFSET exitMsg
    call WriteString
    call CrLf
    ret

main endp
end main

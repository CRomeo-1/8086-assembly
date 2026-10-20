# 8086 Assembly Programs

Programs I wrote in 8086 assembly for my microprocessors course. They run on **emu8086** (or MASM + DOSBox).

## Programs

### bubble_sort.asm
Sorts an array of 10 numbers using bubble sort and prints it before and after.
```
Before: 9 4 7 1 8 2 6 3 5 0
After:  0 1 2 3 4 5 6 7 8 9
```
Uses: nested loops with `LOOP` and `CX`, `XCHG` to swap, procedures with `CALL`/`RET`, DOS interrupts for output.

### palindrome.asm
Reads a word from the keyboard and checks if it reads the same backwards.
```
Enter a word: racecar
Palindrome
```
Uses: DOS buffered input (`INT 21h / AH=0Ah`), two pointers (`SI` from the start, `DI` from the end), `SHR` to divide the length by 2.

## DOS interrupts used
| AH | Function |
|---|---|
| 02h | print one character (DL) |
| 09h | print string ending with `$` (DS:DX) |
| 0Ah | read a line from the keyboard into a buffer |
| 4Ch | exit program |

## How to run
1. Open the `.asm` file in emu8086
2. Click **Emulate** then **Run**

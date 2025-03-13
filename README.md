# Computer Architecture

Codes for the course. <br>
Not required by the instructor, so this is purely for practice.

## Set Up

### Windows (GUI)

- Download and install PCSPIM from <a href="https://sourceforge.net/projects/spimsimulator/files/latest/download">here</a>
- Use `File -> Load File` or `File -> Reinitialize and Load File` to open MIPS code
- Run the code from here: <br> ![click green arrow to run code](readme_img/run_code.png)

### Linux / WSL (CLI)

- Install spim: `sudo apt install spim`
- To run, either use `spim -f <path to file>`
- Or you can:
  - Type `spim` for interactive shell
  - Use `load "<path to file>"` (in double quotes)
  - Type `run`
  - Use `print` to inspect register values
    - e.g. `print $s0`
  - And `exit` to quit

## Basic Structure

```mips
.data
example: .word 1,2,3,4

.text
main:
  # <your code>

  li $v0, 10
  syscall
```

### `.data`

Define your variables here. <br>
The code above defines an array of words (4-byte or 32-bits) named `example`, initialized with the first 4 natural numbers.

### `.text`

Your code goes here. <br>
`li` and `syscall` are used to call `exit` to prevent any crashes from executing any code after that.

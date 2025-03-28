#include <stdio.h>
#include <string.h>

int alu_control(int aluOp, int funct)
{
    int aluOpBit1 = aluOp & 1, aluOpBit2 = (aluOp & 2) >> 1;
    // printf("ALUOp0=%d\n", aluOpBit1);
    // printf("ALUOp1=%d\n", aluOpBit2);
    printf("ALUOp: %d%d\n", aluOpBit2, aluOpBit1);

    int f[4] = {0};
    if (aluOpBit2 == 1)
    {
        printf("F[5-0]: ");
        for (int i = 3; i >= 0; i--)
        {
            f[i] = (funct & (1 << i)) >> i;
            // printf("F%d=%d\n", i, f[i]);
            printf("%d", f[i]);
        }
        printf("\n");
    }

    int f3_or_f0 = f[3] | f[0];
    int op1_and_f1 = aluOpBit2 & f[1];
    int op1_and_f3_or_f0 = aluOpBit2 & f3_or_f0;
    int not_op1_or_not_f2 = (~aluOpBit2 | ~f[2]) & 1;
    int op0_or_op1_and_f1 = aluOpBit1 | op1_and_f1;

    return op1_and_f3_or_f0 |
           (not_op1_or_not_f2 << 1) | (op0_or_op1_and_f1 << 2);
}

int main(int argc, char **argv)
{
    // take funct from command line
    // int parsedArg = 0;
    // int len = argv[1][0] - '0';
    // for (int i = 0; i < len; i++)
    // {
    //     parsedArg = 10 * parsedArg + (argv[2][i] - '0');
    // }

    char *ALU_MAPPINGS[] = {"AND", "OR", "ADD", "", "", "NOR", "SUB", "SLT"};

    int numOps = 12;
    char *labels[12] = {"BEQ", "BNE", "LW", "SW", "ADD", "SUB", "SLL", "SRL", "SLT", "AND", "OR", "NOR"};
    int funct[12] = {-1, -1, -1, -1, 32, 34, 0, 2, 42, 36, 37, 39};
    int aluOp[12] = {0b01, 0b01, 0b00, 0b00, 0b10, 0b10, 0b10, 0b10, 0b10, 0b10, 0b10, 0b10};

    for (int i = 0; i < numOps; i++)
    {
        printf("Instruction: %s\n", labels[i]);
        if ((aluOp[i] & 2) != 0)
        {
            printf("Funct: %d\n", funct[i]);
        }
        else
        {
            printf("Funct not used\n");
        }

        int control = alu_control(aluOp[i], funct[i]);
        printf("ALU Control: ");
        for (int i = 0; i < 3; i++)
        {
            int cur = control & (1 << (2 - i));
            cur >>= (2 - i);
            printf("%d", cur);
        }
        printf(" (%s)\n\n", ALU_MAPPINGS[control]);
    }
}

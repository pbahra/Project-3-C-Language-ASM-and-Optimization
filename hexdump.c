/*
 * hexdump.c - Produces a formatted hex dump of a binary file.
 * Build which generates assembly with -S:
 *   gcc -O0 -S -o hexdumpO0.s hexdump.c && gcc -O0 -o hexdumpO0 hexdump.c
 *   gcc -O1 -S -o hexdumpO1.s hexdump.c && gcc -O1 -o hexdumpO1 hexdump.c
 *   gcc -O3 -S -o hexdumpO3.s hexdump.c && gcc -O3 -o hexdumpO3 hexdump.c
 *
 * Author : Pavan Bahra
 * Date   : 5/11/26
 * Class  : CMSC 313
 * Email  : pbahra1@umbc.edu
 */

#include <stdio.h>
#include <stdlib.h>     
#include <ctype.h>     
#include <assert.h>     

#define BYTES_PER_LINE  (16)

/* 
 * Function prototypes
 * Declared before main() so the compiler can type-check every call site.
 * 
 */
static void         print_hex_line(long offset,
                                   const unsigned char *buf,
                                   int count);
static inline int   safe_isprint(unsigned char c);
static int          hexdump(const char *filename);

/* 
 * safe_isprint()
 *
 * isprint() takes int but is only defined for values representable as
 * unsigned char or EOF. Casting here prevents undefined behaviour on
 * platforms where char is signed.
 * 
 */
static inline int safe_isprint(unsigned char c)
{
    return isprint((int)c);
}

/* 
 * print_hex_line()
 *
 * Prints one formatted line of the hex dump.
 *
 * Parameters:
 *   offset - byte offset of buf[0] within the file
 *   buf    - const pointer: we only read the bytes, never write them.
 *   count  - number of valid bytes in buf (1 .. BYTES_PER_LINE)
 * 
 */
static void print_hex_line(long offset, const unsigned char *buf, int count)
{
    int i;

    assert(buf   != NULL);
    assert(count >= 1 && count <= BYTES_PER_LINE);

    printf("%08lx ", offset);

    for (i = 0; i < BYTES_PER_LINE; i++) {
        if (i < count) {
            printf("%02x ", (unsigned int)buf[i]);
        } else {
            printf("   ");  /* pad so ASCII column stays aligned */
        }
    }

    printf("|");
    for (i = 0; i < count; i++) {
        putchar(safe_isprint(buf[i]) ? (int)buf[i] : '.');
    }
    printf("|\n");
}

/* 
 * hexdump()
 *
 * Memory note: buf is a stack rray that is allocated on entry, freed on
 * return. No malloc needed because size is fixed at compile time.
 * For variable-size buffers we would use malloc() and always check the
 * return value for NULL before use 
 */
static int hexdump(const char *filename)
{
    FILE          *fp;
    unsigned char  buf[BYTES_PER_LINE]; /* auto (stack) storage             */
    size_t         count;               /* size_t matches fread return type  */
    long           offset = 0L;

    assert(filename != NULL);

    fp = fopen(filename, "rb");
    if (fp == NULL) {
        fprintf(stderr, "hexdump: cannot open '%s'\n", filename);
        return 1;
    }

    while ((count = fread(buf, 1u, (size_t)BYTES_PER_LINE, fp)) > 0u) {
        print_hex_line(offset, buf, (int)count);
        offset += (long)count;
    }

    if (ferror(fp)) {
        fprintf(stderr, "hexdump: read error on '%s'\n", filename);
        fclose(fp);
        return 1;
    }

    fclose(fp);
    return 0;
}

/* 
 * main()
 * Entry point. Expects exactly one argument: the file to dump.
 */
int main(int argc, char *argv[])
{
    assert(argc >= 1);  /* impossible to violate in a correct C runtime */

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    return (hexdump(argv[1]) == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}

/* First antminer program with a printf function
 *
 * Tom Trebisky  1-9-2021 6-19-2024
 */

#include "protos.h"

#define MS_300  50000000;

/* A reasonable delay for blinking an LED.
 * This began as a wild guess, but
 * in fact yields a 300ms delay
 * as calibrated below.
 */
static void
delay_x ( void )
{
        volatile int count = MS_300;

        while ( count-- )
            ;
}

void
main ( void )
{
	int n;
	unsigned int val = 0xdeadbeef;

	uart_init();

	n = 1;
	for ( ;; ) {
	    // uart_puts ( "alligator " );
	    printf ( "alligator %d %08x\n", n, val );
	    delay_x ();
	    n++;
	}

	/* NOTREACHED */
}

/* THE END */

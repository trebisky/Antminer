/* mio_blink for the Antminer S9
 *
 * The S9 has a pair of LED (red and green)
 * These are driven by MIO pins
 * (unlike the Ebaz where those LED are driven
 *   by the PL fabric).
 *
 * The game here is to initialize those MIO pins
 * and then use the GPIO co control the LED
 *
 * Tom Trebisky  6-17-2024
 */

void main ( void );

#define MIO_RED		37
#define MIO_GREEN	38

static void
mio_setup ( void )
{
	mio_init ();
	mio_gpio ( MIO_RED );
	mio_gpio ( MIO_GREEN );
}

#define MS_300  50000000;

/* A reasonable delay for blinking an LED.
 * This began as a wild guess, but
 * in fact yields a 300ms delay
 * as calibrated below.
 */
void
delay_x ( void )
{
        volatile int count = MS_300;

        while ( count-- )
            ;
}

void
main ( void )
{
	mio_setup ();

	gpio_init ();
	gpio_config_output ( MIO_RED );
	gpio_config_output ( MIO_GREEN );

	for ( ;; ) {
	    gpio_write ( MIO_RED, 0 );
	    gpio_write ( MIO_GREEN, 0 );
	    delay_x ();
	    gpio_write ( MIO_RED, 1 );
	    gpio_write ( MIO_GREEN, 1 );
	    delay_x ();
	}
}

/* THE END */

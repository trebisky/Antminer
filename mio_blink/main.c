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

void
init_mio ( void )
{
}

void
main ( void )
{
	init_mio ();
}

/* THE END */

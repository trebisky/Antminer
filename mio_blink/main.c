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
void slcr_unlock ( void );

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

/* Half the above */
#define MS_150  25000000;

void
delay_y ( void )
{
        volatile int count = MS_150;

        while ( count-- )
            ;
}

void
main ( void )
{

	uart_init ();

	// apparently this is not needed
	// slcr_unlock ();

	mio_setup ();

	gpio_init ();
	gpio_config_output ( MIO_RED );
	gpio_config_output ( MIO_GREEN );

	for ( ;; ) {
	    // printf ( "Blink off\n" );
	    gpio_write ( MIO_RED, 0 );
	    gpio_write ( MIO_GREEN, 1 );
	    delay_y ();
	    // printf ( "Blink on\n" );
	    gpio_write ( MIO_RED, 1 );
	    gpio_write ( MIO_GREEN, 0 );
	    delay_y ();
	}
}

#ifdef notdef
typedef volatile unsigned int vu32;
typedef unsigned int u32;

/* Unlock the slcr registers
 *  (this includes the MIO pin registers.
 * See TRM pages 1576-1578
 *
 * Note that the TRM says that only the lower 16 bits of
 * these registers do anything, but I mimic code I have seen
 * written by Xilinx that sets both top and bottom the same.
 */
// #define SlcrUnlock()    Xil_Out32(XPS_SYS_CTRL_BASEADDR + 0x08, 0xDF0DDF0D)
// #define SlcrLock()      Xil_Out32(XPS_SYS_CTRL_BASEADDR + 0x04, 0x767B767B)

struct slcr_regs {
	vu32	ctrl;
	vu32	lock;
	vu32	unlock;
};

#define SLCR_BASE	(struct slcr_regs *) 0xf8000000

void
slcr_unlock ( void )
{
	struct slcr_regs *sp = SLCR_BASE;

	sp->unlock = 0xDF0DDF0D;
}

void
slcr_lock ( void )
{
	struct slcr_regs *sp = SLCR_BASE;

	sp->lock = 0x76787678;
}
#endif

/* THE END */

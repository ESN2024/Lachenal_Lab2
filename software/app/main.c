#include <stdio.h>
#include "system.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>
#include "sys/alt_sys_init.h"
#include "altera_avalon_pio_regs.h" 
#include "unistd.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"


volatile __uint16_t compteur;
volatile __uint16_t u3;
volatile __uint16_t u2;
volatile __uint16_t u1;

static void simple_irq(void* context, alt_u32 id)
{   
	if ( compteur < 999) 
        	{
				compteur += 1;
				
				u3 = compteur / 100;
				u2 = compteur % 100 / 10;
				u1 = compteur % 10;
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,u1);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE,u2);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_2_BASE,u3);
			}
			else
			{
				compteur = 0;
			}

	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);

}


int main(){
	
	compteur = 0;
	 
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_START_MSK | ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);
	alt_irq_register(TIMER_0_IRQ,NULL,simple_irq);
	
	return 0;
}

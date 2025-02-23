#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "rdtsc_rand.h"  // Include the header from the repo

MODULE = Random::RDTSC PACKAGE = Random::RDTSC

PROTOTYPES: DISABLE

SV *hwrng()
    CODE:
		SV *ret = newSV(0); // undef

		// If we have HWRNG and the value is good
		if (has_hwrng()) {
			UV value = 0;
			I8 ok    = get_hw_rand64(&value);

			if (ok) {
				ret = newSVuv((UV)value);
			}
		}

		RETVAL = ret;
    OUTPUT:
        RETVAL

UV
get_rdtsc()
    CODE:
        RETVAL = get_rdtsc();
    OUTPUT:
        RETVAL

UV
rdtsc_rand64()
    CODE:
        RETVAL = rdtsc_rand64();
    OUTPUT:
        RETVAL

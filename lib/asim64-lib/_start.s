
	.section .text.startup
	.align	2
	.global _start
_start:
        /* mov     r0,#208   *//* 0xd0 */
        /* msr     CPSR_c,r0 */
        ldr     x2, .L1010
        ldr     x2, [x2]
	mov	sp, x2
	/*bl      initialise_monitor_handles*/
        /*bl      atexit*/
	bl      __libc_init_array
        ldr     x2, .L1018
        ldr     x0, [x2]
        ldr     x1, .L1020
        bl      main

	.global exit
exit:
	.global _exit
_exit:
	.global _kill
_kill:
	.global	_halt
	/* fflush(stdout)                    */
	/* adrp    x0, impure_data           */
	/* add     x0, x0, :lo12:impure_data */
        /* ldr     x0, [x0, #16]             */
        /* bl      fflush                    */
	/* fflush(stderr)                    */
        /* adrp    x0, impure_data           */
	/* add     x0, x0, :lo12:impure_data */
        /* ldr     x0, [x0, #24]             */
        /* bl      fflush                    */
_halt:
        svc     0x11

	.align	3
.L1010:	.quad	0x0000000000001010
.L1018:	.quad	0x0000000000001018
.L1020:	.quad	0x0000000000001020

        .global _init
_init:  
	ret

        .global _getpid
_getpid:
        svc	0x001000 /* no cache_sync */
	ret

        .global _gettid
_gettid:
        svc     0x001001 /* no cache_sync */
	ret

        .global _barrier
_barrier:
        svc     0x001002 /* barrier0 write b[pid]=%o0 and wait for all=%o0 */
        bne     _barrier
	ret

        .global pthread_create
pthread_create:
        svc     0x001003 /* no cache_sync */
	ret

        .global pthread_join
pthread_join:
        svc     0x001004 /* no cache_sync */
	ret

        .global tcureg_valid
tcureg_valid:
        svc     0x001010 /* no cache_sync */
	ret

        .global tcureg_ready
tcureg_ready:
        svc     0x001011 /* no cache_sync */
	ret

        .global tcureg_last
tcureg_last:
        svc     0x001012 /* no cache_sync */
	ret

        .global tcureg_term
tcureg_term:
        svc     0x001013 /* no cache_sync */
	ret

        .global tcureg
tcureg:
        svc     0x001014 /* no cache_sync */
	ret

        .global _getclk
_getclk:
        svc     0x0010fe
	ret

        .global _getpa
_getpa:
        svc     0x0010ff
	ret

/* for EMAX5 */
	.global emax_start_with_keep_cache
emax_start_with_keep_cache:	
        svc     0x0000f0
	ret
	
/* for EMAX5 */
	.global emax_start_with_drain_cache
emax_start_with_drain_cache:	
        svc     0x0000f1
	ret
	
/* for EMAX5 */
        .global emax_drain_dirty_lmm
emax_drain_dirty_lmm:
        svc     0x0000f2
        ret
	
/* for EMAX6 */
	.global emax_pre_with_keep_cache
emax_pre_with_keep_cache:	
        svc     0x0000f0
	ret
	
/* for EMAX6 */
	.global emax_pre_with_drain_cache
emax_pre_with_drain_cache:	
        svc     0x0000f1
	ret
	
        .global _copyX
_copyX:
        svc     0x0000fd
	ret
	
        .global _updateX
_updateX:
        svc     0x0000fe
	ret

        .global _read
_read:
        svc     0x6a
	ret

        .global _write
_write:
        svc     0x69
	ret

        .global _open
_open:
        svc     0x66
	ret

        .global _lseek
_lseek:
        svc     0x6b
	ret

        .global _close
_close:
        svc     0x68
	ret

        .global _isatty
_isatty:
        svc     0x6e
	ret

        .global _sbrk
_sbrk:
        svc     0x20
	ret

        .global _fstat
_fstat:
        svc     0x21
	ret

        .global _times
_times:
        svc     0x22
	ret

/**/

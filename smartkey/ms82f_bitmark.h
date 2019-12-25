#ifndef	_ms82fxx02_bitmark_H_
#define	_ms82fxx02_bitmark_H_

#define LF32K 0
#define LF256K 0x80

#if TSEL == 2
	#define INT16M 7
	#define INT8M 6
	#define INT4M 5
	#define INT2M 4
#elif TSEL == 4
	#define INT8M 7
	#define INT4M 6
	#define INT2M 5
	#define INT1M 4
#endif

#endif
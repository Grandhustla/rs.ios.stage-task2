#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 reverserdResult = 0;
    for (int i = 0; i < 8; i++, n >>= 1) {
        reverserdResult |= (n & 1) << (7 - i);
    }
    return reverserdResult;
}

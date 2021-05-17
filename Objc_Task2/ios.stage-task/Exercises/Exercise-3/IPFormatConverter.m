#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (!numbersArray || !numbersArray.count) { return @""; }
    
    NSString *over255 = @"The numbers in the input array can be in the range from 0 to 255.";
    NSString *less0   = @"Negative numbers are not valid for input.";
    
    NSArray<NSNumber *> *numArray = [NSArray arrayWithArray:numbersArray];
    NSMutableString *addressIP = [NSMutableString new];
    
    for (int i = 0; i < 4; i++) {
        
        if (i < numArray.count) {
            if (numArray[i].intValue > 255) { return over255; }
            if (numArray[i].intValue < 0) { return less0; }
            [addressIP appendString:numArray[i].stringValue];
        } else { [addressIP appendString: @"0"]; }
        i != 3 ? [addressIP appendString: @"."] : nil;
    }
    return addressIP;
}
@end

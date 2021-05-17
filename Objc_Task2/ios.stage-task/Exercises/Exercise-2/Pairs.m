#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    int count = 0;
    NSArray<NSNumber *> *rArr = [NSArray new];
    rArr = array.reverseObjectEnumerator.allObjects;
    
    for (NSNumber *num in rArr) {
        for (int i = 0; i < rArr.count; i++) {
            if (num.intValue - rArr[i].intValue
                == number.intValue) {
                count++;
            }
        }
    }
    return count;
}

@end

#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray new];
    NSMutableArray<NSString *> *strings = [NSMutableArray new];
    
    BOOL aNil = array == nil;
    BOOL aCountZero = array.count == 0;
    BOOL aNonClassArray = [array[0] isKindOfClass: NSArray.class];
    
    if (aNil || aCountZero || !aNonClassArray) {
        return @[];
    }
    
    for (NSArray *arrayItems in array) {
        for (id elInArr in arrayItems) {
            if ([elInArr isKindOfClass: NSNumber.class]) {
                [numbers addObject: elInArr];
            } else {
                [strings addObject: elInArr];
            }
        }
    }
    
    SEL insensitive = @selector(localizedCaseInsensitiveCompare:);
    NSSortDescriptor *sortNumbersInArray = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
    NSSortDescriptor *sortStringsInArray = [NSSortDescriptor sortDescriptorWithKey: @"self"
                                                                         ascending: NO
                                                                          selector: insensitive];
    if (strings.count == 0) {
            [numbers sortUsingDescriptors:
             [NSArray arrayWithObject: sortNumbersInArray]];
            return numbers;

        } else if (numbers.count == 0) {
            [strings sortUsingSelector: insensitive];
            return strings;
        }

        [numbers sortUsingDescriptors: [NSArray arrayWithObject: sortNumbersInArray]];
        [strings sortUsingDescriptors: [NSArray arrayWithObject: sortStringsInArray]];

        return [NSArray arrayWithObjects: numbers, strings, nil];
}

@end

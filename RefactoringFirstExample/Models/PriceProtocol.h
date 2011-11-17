//
//  Created by turner on 11/17/11.
//
// To change the template use AppCode | Preferences | File Templates.
//

enum {
    NoPriceCode         = 0,
    ChildrensPriceCode  = 1 << 0,
    RegularPriceCode    = 1 << 1,
    NewReleasePriceCode = 1 << 2,
};

typedef NSUInteger PriceCode;

@protocol PriceProtocol
- (PriceCode)getPriceCode;
- (CGFloat)getCharge:(NSUInteger)daysRented;
- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented;
@end
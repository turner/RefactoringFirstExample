//
//  Movie.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    NoPriceCode         = 0,
    ChildrensPriceCode  = 1 << 0,
    RegularPriceCode    = 1 << 1,
    NewReleasePriceCode = 1 << 2,
};

typedef NSUInteger PriceCode;

@class Price;

@interface Movie : NSObject

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) Price *price;

-(id)initWithTitle:(NSString *)aTitle priceCode:(PriceCode)aPriceCode;
-(id)initWithMovieDictionary:(NSDictionary *)movieDictionary;

- (PriceCode)getPriceCode;
- (CGFloat)getCharge:(NSUInteger)daysRented;

- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented;


@end

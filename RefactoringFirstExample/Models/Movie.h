//
//  Movie.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriceProtocol.h"

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

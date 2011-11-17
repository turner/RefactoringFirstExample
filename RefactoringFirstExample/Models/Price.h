//
//  Price.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/17/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
#import "PriceProtocol.h"

@interface Price : NSObject <PriceProtocol>
@end

@interface ChildrensPrice : Price

//- (PriceCode) getPriceCode;
//- (CGFloat)getCharge:(NSUInteger)daysRented;

@end

@interface NewReleasePrice : Price

//- (PriceCode) getPriceCode;
//- (CGFloat)getCharge:(NSUInteger)daysRented;
//- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented;

@end

@interface RegularPrice : Price

//- (PriceCode) getPriceCode;
//- (CGFloat)getCharge:(NSUInteger)daysRented;

@end

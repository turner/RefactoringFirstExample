//
//  Price.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/17/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Price.h"
#import "Logging.h"

@implementation Price

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;

}

- (PriceCode) getPriceCode {

    return (PriceCode)NoPriceCode;
}

- (CGFloat)getCharge:(NSUInteger)daysRented {

    return -11.11;
}

- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented {

    return 1;
}

@end

@implementation ChildrensPrice

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
    
}

- (PriceCode) getPriceCode {
    
    return (PriceCode)ChildrensPriceCode;
}

- (CGFloat)getCharge:(NSUInteger)daysRented {

    CGFloat result = 0.0;
    
    result += 1.5;
    if (daysRented > 3) result += (daysRented - 3) * 1.5;
    
    return result;
}

@end

@implementation NewReleasePrice

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
    
}

- (PriceCode) getPriceCode {
    
    return (PriceCode)NewReleasePriceCode;
}

- (CGFloat)getCharge:(NSUInteger)daysRented {
    
    return daysRented * 3;
}

- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented {

    return (daysRented > 1) ? 2 : 1;
}

@end

@implementation RegularPrice

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];

    if (self) {

    }
    
    return self;
    
}

- (PriceCode) getPriceCode {
    
    return (PriceCode)RegularPriceCode;
}

- (CGFloat)getCharge:(NSUInteger)daysRented {
    
    CGFloat result = 0.0;
    
    result += 2.0;
    if (daysRented > 2) result += (daysRented - 2) * 1.5;
    
    return result;
}

@end


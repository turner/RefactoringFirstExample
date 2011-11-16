//
//  Rental.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Rental.h"
#import "Movie.h"
#import "Logging.h"

@interface Rental ()

@end

@implementation Rental

@synthesize movie;
@synthesize daysRented;


- (void)dealloc {
    
    self.movie = nil;

    [super dealloc];
}

-(id)initWithMovie:(Movie *)aMovie daysRented:(NSUInteger)aDaysRented {
    
    self = [super init];
    
    if (self) {

        self.movie = aMovie;
        self.daysRented = aDaysRented;
    }
    
    return self;
    
    
}

- (CGFloat)getCharge {

    CGFloat thisAmount = 0.0;

    switch (self.movie.priceCode) {

            case RegularPriceCode:
            {
                thisAmount += 2.0;
                if (self.daysRented > 2) thisAmount += (self.daysRented - 2) * 1.5;
            }
                break;

            case NewReleasePriceCode:
            {
                thisAmount += self.daysRented * 3;
            }
                break;

            case ChildrensPriceCode:
            {
                thisAmount += 1.5;
                if (self.daysRented > 3) thisAmount += (self.daysRented - 3) * 1.5;
            }
                break;

        } // switch ()

    return thisAmount;
}


- (NSUInteger)getFrequentRenterPoints {

    if (self.movie.priceCode == NewReleasePriceCode && self.daysRented > 1) return 2;

    return 1;
}

@end

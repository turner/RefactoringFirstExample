//
//  Movie.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Movie.h"
#import "Price.h"

@interface Movie ()

- (void)setPriceCode:(PriceCode)aPriceCode;

@end

@implementation Movie

@synthesize title;
@synthesize price;

- (void)dealloc {

    self.title = nil;
    self.price = nil;

    [super dealloc];
}

- (void)setPriceCode:(PriceCode)aPriceCode {

    switch (aPriceCode) {

        case RegularPriceCode:
        {
            self.price = [[[RegularPrice alloc] init] autorelease];
        }
            break;

        case NewReleasePriceCode:
        {
            self.price = [[[NewReleasePrice alloc] init] autorelease];
        }
            break;

        case ChildrensPriceCode:
        {
            self.price = [[[ChildrensPrice alloc] init] autorelease];
        }
            break;

        default:
        {
            self.price = [[[Price alloc] init] autorelease];
        }


    } // switch ()

}

- (PriceCode)getPriceCode {

    return [self.price getPriceCode];

}

- (id)init {
    self = [super init];
    if (self) {

        self.title = @"Untitled";

        [self setPriceCode:NoPriceCode];
//        self.priceCode = NoPriceCode;
    }

    return self;
//To change the template use AppCode | Preferences | File Templates.
}

-(id)initWithTitle:(NSString *)aTitle priceCode:(PriceCode)aPriceCode {

    self = [super init];

    if (self) {

        self.title = aTitle;
        [self setPriceCode:aPriceCode];
//        self.priceCode = aPriceCode;
    }

    return self;

}

-(id)initWithMovieDictionary:(NSDictionary *)movieDictionary {

    self = [super init];

    if (self) {

        self.title = [movieDictionary objectForKey:@"title"];
       [self setPriceCode:[[movieDictionary objectForKey:@"priceCode"] unsignedIntegerValue]];
//        self.priceCode = [[movieDictionary objectForKey:@"priceCode"] unsignedIntegerValue];
    }

    return self;

}

- (CGFloat)getCharge:(NSUInteger)daysRented {

    
    CGFloat thisAmount = 0.0;
    
    switch ([self getPriceCode]) {

        case RegularPriceCode:
        {
            thisAmount += 2.0;
            if (daysRented > 2) thisAmount += (daysRented - 2) * 1.5;
        }
            break;

        case NewReleasePriceCode:
        {
            thisAmount += daysRented * 3;
        }
            break;

        case ChildrensPriceCode:
        {
            thisAmount += 1.5;
            if (daysRented > 3) thisAmount += (daysRented - 3) * 1.5;
        }
            break;

    } // switch ()

    return thisAmount;
}

- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented {

    if (NewReleasePriceCode == [self getPriceCode] && daysRented > 1) return 2;

    return 1;
}

@end

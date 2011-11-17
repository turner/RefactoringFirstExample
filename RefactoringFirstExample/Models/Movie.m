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

- (id)init {

    self = [super init];

    if (self) {

        self.title = @"Untitled";

        [self setPriceCode:NoPriceCode];

    }

    return self;

}

-(id)initWithTitle:(NSString *)aTitle priceCode:(PriceCode)aPriceCode {

    self = [super init];

    if (self) {

        self.title = aTitle;
        [self setPriceCode:aPriceCode];
    }

    return self;

}

-(id)initWithMovieDictionary:(NSDictionary *)movieDictionary {

    self = [super init];

    if (self) {

        self.title = [movieDictionary objectForKey:@"title"];
       [self setPriceCode:[[movieDictionary objectForKey:@"priceCode"] unsignedIntegerValue]];
    }

    return self;

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

- (CGFloat)getCharge:(NSUInteger)daysRented {

    return [self.price getCharge:daysRented];
}

- (NSUInteger)getFrequentRenterPoints:(NSUInteger)daysRented {

    return [self.price getFrequentRenterPoints:daysRented];

}

@end

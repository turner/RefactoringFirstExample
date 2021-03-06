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

    return [self.movie getCharge:self.daysRented];

}


- (NSUInteger)getFrequentRenterPoints {

    return [self.movie getFrequentRenterPoints:self.daysRented];

}

@end

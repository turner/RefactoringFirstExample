//
//  Customer.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Customer.h"
#import "Rental.h"
#import "Movie.h"

@interface Customer ()

@end

@implementation Customer

@synthesize name;
@synthesize rentals;

- (void)dealloc {
    
    self.name = nil;
    self.rentals = nil;

    [super dealloc];
}

-(id)initWithName:(NSString *)aName {

    self = [super init];
    
    if (self) {

        self.name = aName;
        self.rentals = [NSMutableArray array];

    }
    
    return self;
    
    
}

-(void)addRental:(Rental *)aRental {

    [self.rentals addObject:aRental];

}

-(NSString *)statement {

    float totalAmountOwed = 0.0;

    NSUInteger frequentRenterPoints = 0;

    NSMutableString *result = [NSMutableString stringWithFormat:@"\nRental Record for %@", self.name];
    
    for (Rental *rental in self.rentals) {

        frequentRenterPoints += [rental getFrequentRenterPoints];

        [result appendFormat:@"\t%@\t%.2f\n", rental.movie.title, [rental getCharge]];

        totalAmountOwed += [rental getCharge];
        
    } // for (self.rentals) 


    //add footer lines
    [result appendFormat:@"\nAmount owed is %.2f", totalAmountOwed];
    [result appendFormat:@"\nYou earned %d frequent renter points", frequentRenterPoints];

    return result;
}

@end

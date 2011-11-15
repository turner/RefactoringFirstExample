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

@implementation Customer

@synthesize name;
@synthesize rentals;
@synthesize totalAmountOwed;
@synthesize frequentRenterPoints;

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

//    CGFloat totalAmount = 0;

    self.totalAmountOwed = 0.0;

    self.frequentRenterPoints = 0;

    NSMutableString *result = [NSMutableString stringWithFormat:@"\nRental Record for %@", self.name];
    
    for (Rental *rental in self.rentals) {
        
        CGFloat thisAmount = 0.0;

        switch (rental.movie.priceCode) {
            
            case RegularPriceCode:
            {
                thisAmount += 2.0;
                if (rental.daysRented > 2) thisAmount += (rental.daysRented - 2) * 1.5;
            }
                break;

            case NewReleasePriceCode:
            {
                thisAmount += rental.daysRented * 3;   
            }
                break;

            case ChildrensPriceCode:
            {
                thisAmount += 1.5;
                if (rental.daysRented > 3) thisAmount += (rental.daysRented - 3) * 1.5;
            }
                break;
            
        } // switch ()
        
        ++self.frequentRenterPoints;
        
        if (rental.movie.priceCode == NewReleasePriceCode && rental.daysRented > 1) ++self.frequentRenterPoints;


        [result appendFormat:@"\t%@\t%.2f\n", rental.movie.title, thisAmount];

        self.totalAmountOwed += thisAmount;
        
    } // for (self.rentals) 


    //add footer lines
    [result appendFormat:@"\nAmount owed is %.2f", self.totalAmountOwed];
    [result appendFormat:@"\nYou earned %d frequent renter points", self.frequentRenterPoints];

    return result;
}

@end

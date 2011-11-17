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

- (CGFloat)getTotalAmountOwed;
- (NSUInteger)getFrequentRenterPoints;

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

    NSMutableString *result = [NSMutableString stringWithFormat:@"\nRental Record for %@", self.name];
    
    for (Rental *rental in self.rentals) {

        [result appendFormat:@"\t%@\t%.2f\n", rental.movie.title, [rental getCharge]];

    } // for (self.rentals)

    //add footer lines
    [result appendFormat:@"\nAmount owed is %.2f", [self getTotalAmountOwed]];
    [result appendFormat:@"\nYou earned %d frequent renter points", [self getFrequentRenterPoints]];

    return result;
}


-(NSString *)htmlStatement {

    NSMutableString *result = [NSMutableString stringWithFormat:@"<H1>Rentals for <EM>%@</EM></H1><P>\n", self.name];

    for (Rental *rental in self.rentals) {

        [result appendFormat:@"%@: $%.02f<BR>\n", rental.movie.title, [rental getCharge]];

    } // for (self.rentals)

    // footer
    [result appendFormat:@"<P>You owe <EM>$%.2f</EM></P>\n", [self getTotalAmountOwed]];
    [result appendFormat:@"On this rental you earned <EM>%d</EM> frequent renter points</P>", [self getFrequentRenterPoints]];

    return result;

}

- (CGFloat)getTotalAmountOwed {

    CGFloat totalAmountOwed = 0.0;

    for (Rental *rental in self.rentals) {


        totalAmountOwed += [rental getCharge];

    } // for (self.rentals)

    return totalAmountOwed;
}

- (NSUInteger)getFrequentRenterPoints {

    NSUInteger frequentRenterPoints = 0;

    for (Rental *rental in self.rentals) {

        frequentRenterPoints += [rental getFrequentRenterPoints];

    } // for (self.rentals)

    return frequentRenterPoints;

}

@end

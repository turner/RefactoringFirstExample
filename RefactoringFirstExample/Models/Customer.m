//
//  Customer.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Customer.h"
#import "Rental.h"

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

@end

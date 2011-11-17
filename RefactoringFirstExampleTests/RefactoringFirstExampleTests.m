//
//  RefactoringFirstExampleTests.m
//  RefactoringFirstExampleTests
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RefactoringFirstExampleTests.h"
#import "Movie.h"
#import "Rental.h"
#import "Logging.h"
#import "Customer.h"
#import "Price.h"

@implementation RefactoringFirstExampleTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testChildrensPriceGetCharge {

    ChildrensPrice *price = [[[ChildrensPrice alloc] init] autorelease];

    CGFloat charge = [price getCharge:5];

    STAssertTrue(charge > 1.0, nil);

}

- (void) testCustomerHTMPLStatementMethod {

    NSUInteger _daysRented;

    Customer *customer = [[[Customer alloc] initWithName:@"Doug"] autorelease];

    Movie *movie =
    [[[Movie alloc] initWithMovieDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                             @"Dirty Dozen", @"title",
                                             [NSNumber numberWithUnsignedInteger:RegularPriceCode], @"priceCode",
                                             nil]
      ] autorelease];


    // Less then or equal to 2 day rental
    _daysRented = 2;
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease]];

    DLog(@"%@", [customer htmlStatement]);

    STAssertEquals(1, 1, @"whah ?");

}


- (void) testCustomerStatementMethod {
    
    NSUInteger _daysRented;
    
    Customer *customer = [[[Customer alloc] initWithName:@"Doug"] autorelease];
    
    Movie *movie =
    [[[Movie alloc] initWithMovieDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                             @"Dirty Dozen", @"title",
                                             [NSNumber numberWithUnsignedInteger:RegularPriceCode], @"priceCode",
                                             nil]
      ] autorelease];
    
    
    // Less then or equal to 2 day rental
    _daysRented = 2;
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease]];

    DLog(@"%@", [customer statement]);

    STAssertEquals(1, 1, @"whah ?");

}

- (void) testCreateCustomer {

    Movie *movie = nil;

    NSArray *movies =
     [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:@"Mary Poppins", @"title", [NSNumber numberWithUnsignedInteger: ChildrensPriceCode], @"priceCode", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"Dirty Dozen", @"title", [NSNumber numberWithUnsignedInteger:   RegularPriceCode], @"priceCode", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"Inception", @"title", [NSNumber numberWithUnsignedInteger:NewReleasePriceCode], @"priceCode", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"The Wizard of OZ", @"title", [NSNumber numberWithUnsignedInteger: ChildrensPriceCode], @"priceCode", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"Blowup", @"title", [NSNumber numberWithUnsignedInteger:   RegularPriceCode], @"priceCode", nil],
                         nil];


    NSUInteger _daysRented;

    Customer *customer = [[[Customer alloc] initWithName:@"Doug"] autorelease];

    movie = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:0]] autorelease];
    _daysRented = 3;
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease]];

    STAssertTrue(_daysRented ==[(Rental *)[customer.rentals objectAtIndex:(customer.rentals.count - 1)] daysRented], @"rental %d should be of length %d", 0, _daysRented);

    movie = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:4]] autorelease];
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:2] autorelease]];

    movie = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:1]] autorelease];
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:4] autorelease]];

    movie = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:3]] autorelease];
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:1] autorelease]];

    movie = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:2]] autorelease];
    _daysRented = 6;
    [customer addRental:[[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease]];

    STAssertTrue(_daysRented ==[(Rental *)[customer.rentals objectAtIndex:(customer.rentals.count - 1)] daysRented], @"rental %d should be of length %d", 0, _daysRented);


}

- (void) testCreateMovieFromDictionary {

    NSArray *movies =
            [NSArray arrayWithObjects:
                    [NSDictionary dictionaryWithObjectsAndKeys:@"Mary Poppins", @"title", [NSNumber numberWithUnsignedInteger: ChildrensPriceCode], @"priceCode", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"Dirty Dozen", @"title", [NSNumber numberWithUnsignedInteger:   RegularPriceCode], @"priceCode", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"Inception", @"title", [NSNumber numberWithUnsignedInteger:NewReleasePriceCode], @"priceCode", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"The Wizard of OZ", @"title", [NSNumber numberWithUnsignedInteger: ChildrensPriceCode], @"priceCode", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"Blowup", @"title", [NSNumber numberWithUnsignedInteger:   RegularPriceCode], @"priceCode", nil],
                     nil];


    // movie dictionary assertions
//    STAssertNotNil([[movies objectAtIndex:0] objectForKey:@"priceCode"], nil);
//    STAssertTrue(ChildrensPriceCode == [[[movies objectAtIndex:0] objectForKey:@"priceCode"] unsignedIntegerValue], @"incorrect price code");

    Movie *maryPoppins = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:0]] autorelease];

    STAssertTrue(ChildrensPriceCode == [maryPoppins getPriceCode], @"incorrect price code");
    STAssertTrue([maryPoppins.title isEqualToString:@"Mary Poppins"], @"incorrect title");

}

- (void) testCreateRental {

    Movie *movie =  [[[Movie alloc] initWithTitle:@"The Dirty Dozen" priceCode:RegularPriceCode] autorelease];

    Rental *rental = [[[Rental alloc] initWithMovie:movie daysRented:3] autorelease];
    STAssertNotNil(rental, @"rental should not be nil");

}

- (void) testCreateMovieFromParams {

    Movie *movie = [[[Movie alloc] initWithTitle:@"The Shining" priceCode:NewReleasePriceCode] autorelease];
    STAssertNotNil(movie, @"movie should not be nil");

}

- (void)testMovieExists {

    Movie *movie = [[[Movie alloc] init] autorelease];
    STAssertNotNil(movie, @"movie should not be nil");
}

@end

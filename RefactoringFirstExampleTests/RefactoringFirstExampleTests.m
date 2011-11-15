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

- (void) testCustomerAmountOwedChildrensMovieLessThenThreeDays {

    NSUInteger _daysRented;

    Customer *customer = [[[Customer alloc] initWithName:@"Doug"] autorelease];

    Movie *movie =
    [[[Movie alloc] initWithMovieDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                             @"Mary Poppins", @"title",
                                             [NSNumber numberWithUnsignedInteger:ChildrensPriceCode], @"priceCode",
                                             nil]
      ] autorelease];



    // Less then 3 day rental
    _daysRented = 1;
    Rental *rental = [[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease];

    [customer addRental:rental];

    // To set the ivars for this test.
    (void)[customer statement];

    CGFloat _totalAmountOwed_ = 1.5;
    DLog(@"_totalAmountOwed_ %.02f", _totalAmountOwed_);
    STAssertEqualsWithAccuracy(_totalAmountOwed_, customer.totalAmountOwed, .01, nil);



}

- (void) testCustomerAmountOwedChildrensMovieGreaterThenThreeDays {

    NSUInteger _daysRented;

    Customer *customer = [[[Customer alloc] initWithName:@"Doug"] autorelease];

    Movie *movie =
    [[[Movie alloc] initWithMovieDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                             @"Mary Poppins", @"title",
                                             [NSNumber numberWithUnsignedInteger:ChildrensPriceCode], @"priceCode",
                                             nil]
      ] autorelease];



    // Greater then 3 day rental
    _daysRented = 5;
    Rental *rental = [[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease];

    [customer addRental:rental];

    // To set the ivars for this test.
    (void)[customer statement];

    CGFloat _totalAmountOwed_ = 1.5 + (rental.daysRented - 3) * 1.5;
    DLog(@"_totalAmountOwed_ %.02f", _totalAmountOwed_);
    STAssertEqualsWithAccuracy(_totalAmountOwed_, customer.totalAmountOwed, .01, nil);


}

- (void) testCustomerAmountOwedRegularMovieGreaterThenTwoDays {
    
    NSUInteger _daysRented;
    
    Customer *customer = [[[Customer alloc] initWithName:@"Doug"] autorelease];
    
    Movie *movie =
    [[[Movie alloc] initWithMovieDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                             @"Dirty Dozen", @"title",
                                             [NSNumber numberWithUnsignedInteger:RegularPriceCode], @"priceCode",
                                             nil]
      ] autorelease];
    
    
    
    // Greater then 2 day rental
    _daysRented = 4;
    Rental *rental = [[[Rental alloc] initWithMovie:movie daysRented:_daysRented] autorelease];
    
    [customer addRental:rental];
    
    // To set the ivars for this test.
    (void)[customer statement];
    
    CGFloat _totalAmountOwed_ = 2.0 + (rental.daysRented - 2) * 1.5;
    DLog(@"_totalAmountOwed_ %.02f", _totalAmountOwed_);
    STAssertEqualsWithAccuracy(_totalAmountOwed_, customer.totalAmountOwed, .01, nil);
    
}

- (void) testCustomerAmountOwedRegularMovieTwoDaysOrLess {
    
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
    
    // To set the ivars for this test.
    (void)[customer statement];
    
    CGFloat _totalAmountOwed_ = 2.0;
    STAssertEqualsWithAccuracy(_totalAmountOwed_, customer.totalAmountOwed, .01, nil);
    
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


//    STAssertNotNil([[movies objectAtIndex:0] objectForKey:@"priceCode"], nil);

//    STAssertTrue(ChildrensPriceCode == [[[movies objectAtIndex:0] objectForKey:@"priceCode"] unsignedIntegerValue], @"incorrect price code");

    Movie *maryPoppins = [[[Movie alloc] initWithMovieDictionary:[movies objectAtIndex:0]] autorelease];

    STAssertTrue(ChildrensPriceCode == maryPoppins.priceCode, @"incorrect price code");
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

- (void)testExample
{
//    STFail(@"Unit tests are not implemented yet in RefactoringFirstExampleTests");
    STAssertEquals(1, 1, @"1 should equal 1");
}

@end

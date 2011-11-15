//
//  Customer.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Rental;

@interface Customer : NSObject {

    CGFloat totalAmountOwed;
    NSUInteger  frequentRenterPoints;

}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSMutableArray *rentals;

@property (nonatomic, assign) CGFloat totalAmountOwed;
@property (nonatomic, assign) NSUInteger frequentRenterPoints;

-(id)initWithName:(NSString *)aName;
-(void)addRental:(Rental *)aRental;
-(NSString *)statement;

@end

//
//  Customer.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Rental;

@interface Customer : NSObject

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSMutableArray *rentals;

-(id)initWithName:(NSString *)aName;
-(void)addRental:(Rental *)aRental;

@end

//
//  Rental.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movie;

@interface Rental : NSObject

@property(nonatomic, retain) Movie *movie;
@property(nonatomic) NSUInteger daysRented;

-(id)initWithMovie:(Movie *)aMovie daysRented:(NSUInteger)aDaysRented;

@end

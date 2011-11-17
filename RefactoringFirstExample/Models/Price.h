//
//  Price.h
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/17/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface Price : NSObject

- (PriceCode) getPriceCode;

@end

@interface ChildrensPrice : Price

- (PriceCode) getPriceCode;

@end

@interface NewReleasePrice : Price

- (PriceCode) getPriceCode;

@end

@interface RegularPrice : Price

- (PriceCode) getPriceCode;

@end

//
//  Price.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/17/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Price.h"
#import "Logging.h"

@implementation Price

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
        DLog(@"");
        
    }
    
    return self;

}

- (PriceCode) getPriceCode {

    DLog(@"");
    
    return (PriceCode)NoPriceCode;
}

@end

@implementation ChildrensPrice

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
        DLog(@"");
        
    }
    
    return self;
    
}

- (PriceCode) getPriceCode {
    
    DLog(@"");
    
    return (PriceCode)ChildrensPriceCode;
}

@end

@implementation NewReleasePrice

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
        DLog(@"");
        
    }
    
    return self;
    
}

- (PriceCode) getPriceCode {
    
    DLog(@"");
    
    return (PriceCode)NewReleasePriceCode;
}

@end

@implementation RegularPrice

- (void)dealloc {
    
    [super dealloc];
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
        DLog(@"");
        
    }
    
    return self;
    
}

- (PriceCode) getPriceCode {
    
    DLog(@"");
    
    return (PriceCode)RegularPriceCode;
}

@end


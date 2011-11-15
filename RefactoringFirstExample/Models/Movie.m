//
//  Movie.m
//  RefactoringFirstExample
//
//  Created by Douglass Turner on 11/14/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "Movie.h"
#import "Logging.h"

@implementation Movie

@synthesize title;
@synthesize priceCode;

- (void)dealloc {

    self.title = nil;

    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {

        self.title = @"Untitled";
        self.priceCode = NoPriceCode;
    }

    return self;
//To change the template use AppCode | Preferences | File Templates.
}

-(id)initWithTitle:(NSString *)aTitle priceCode:(PriceCode)aPriceCode {

    self = [super init];

    if (self) {

        self.title = aTitle;
        self.priceCode = aPriceCode;
    }

    return self;

}

-(id)initWithMovieDictionary:(NSDictionary *)movieDictionary {

    self = [super init];

    if (self) {

        self.title = [movieDictionary objectForKey:@"title"];
        self.priceCode = [[movieDictionary objectForKey:@"priceCode"] unsignedIntegerValue];
    }

    return self;

}


@end

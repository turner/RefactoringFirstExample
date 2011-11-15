//
//  Observer.m
//  BeautifulPanoramas
//
//  Created by turner on 4/30/10.
//  Copyright 2010 Douglass Turner Consulting. All rights reserved.
//
#import "Observer.h"

@implementation Observer

@synthesize targetObject = m_targetObject;
@synthesize targetAction = m_targetAction;

- (void)dealloc {
	
	[m_targetObject release], m_targetObject = nil;
	
	[super dealloc];
}

-(id) initWithTarget:(id)object action: (SEL)action {
    
    self = [super init];
	
    if (nil != self) {
		
        self.targetObject = object;
        self.targetAction = action;
		
    } // if (nil != self)
	
    return self;
}     

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	
    [self.targetObject performSelector:self.targetAction withObject:[object valueForKeyPath:keyPath]];
	
}

@end

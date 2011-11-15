//
//  Observer.h
//  BeautifulPanoramas
//
//  Created by turner on 4/30/10.
//  Copyright 2010 Douglass Turner Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Observer : NSObject {
    id	m_targetObject;
    SEL	m_targetAction;
}

@property(nonatomic,retain)id targetObject;
@property(nonatomic,assign)SEL targetAction;

-(id) initWithTarget:(id)object action: (SEL)action;



@end

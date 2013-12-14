//
//  MultilevelMenu.h
//  MultilevelMenu
//
//  Created by Jussi on 14/12/2013.
//  Copyright (c) 2013 Code & Pop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNPMultilevelMenuItemFactory.h"

@interface CNPMultilevelMenu : NSObject
{
    NSURL *resourceFileURL;
    CNPMultilevelMenuItemFactory *menuItemFactory;
    xmlDocPtr document;
}

- (id)init:(NSURL *)setResourceFileURL menuItemFactory:(CNPMultilevelMenuItemFactory *)setMenuItemFactory;
- (xmlNodePtr)getMenuRootElement;
- (NSMutableArray *)parse:(xmlNodePtr)node;
- (void)dealloc;

@end

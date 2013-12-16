//
//  MultilevelMenu.h
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import "CNPMultilevelMenuItemFactory.h"

@interface CNPMultilevelMenu : NSObject

- (id)init:(NSURL *)setResourceFileURL menuItemFactory:(id<CNPMultilevelMenuItemFactory>)setMenuItemFactory;
- (xmlNodePtr)getMenuRootElement;
- (NSMutableArray *)parse:(xmlNodePtr)node;

@end

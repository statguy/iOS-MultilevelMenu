//
//  CNPMultilevelMenuItemFactory.h
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import "CNPMultilevelMenuItem.h"

@protocol CNPMultilevelMenuItemFactory

- (id<CNPMultilevelMenuItem>)newMenuItem;

@end

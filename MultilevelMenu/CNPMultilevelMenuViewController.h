//
//  CNPMultilevelMenuViewController.h
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNPMultilevelMenu.h"
#import "CNPMultilevelMenuItemFactory.h"

@interface CNPMultilevelMenuViewController : UITableViewController

@property (nonatomic, strong) CNPMultilevelMenu *menu;
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic) xmlNodePtr tappedMenuNode;

@end

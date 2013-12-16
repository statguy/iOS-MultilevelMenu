//
//  CNPMultilevelMenuViewController.m
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import "CNPMultilevelMenuViewController.h"

@implementation CNPMultilevelMenuViewController

- (NSURL *)getMenuConfigurationURL {
    @throw [NSException exceptionWithName:nil reason:@"Implement this abstract method in the subclass." userInfo:nil];
}

- (id<CNPMultilevelMenuItemFactory>)getMenuItemFactory {
    @throw [NSException exceptionWithName:nil reason:@"Implement this abstract method in the subclass." userInfo:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.menu == nil) {
        self.menu = [[CNPMultilevelMenu alloc] init:[self getMenuConfigurationURL] menuItemFactory:[self getMenuItemFactory]];
        self.tappedMenuNode = [self.menu getMenuRootElement];
    }
    
    self.menuItems = [self.menu parse:self.tappedMenuNode];
    
    // Remove empty cells from table view
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menuItems count];
}

@end

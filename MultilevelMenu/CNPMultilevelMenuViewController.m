//
//  CNPMultilevelMenuViewController.m
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import "CNPMultilevelMenuViewController.h"

@implementation CNPMultilevelMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.tappedMenuNode == nil) self.tappedMenuNode = [self.menu getMenuRootElement];
    self.menuItems = [self.menu parse:self.tappedMenuNode];
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

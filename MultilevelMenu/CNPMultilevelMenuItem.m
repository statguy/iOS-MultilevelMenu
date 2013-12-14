 //
//  CNPMultilevelMenuItem.m
//  MultilevelMenu
//
//  Created by Jussi on 14/12/2013.
//  Copyright (c) 2013 Code & Pop. All rights reserved.
//

#import "CNPMultilevelMenuItem.h"

@implementation CNPMultilevelMenuItem

- (void)parse:(xmlNodePtr)setNode {
    @throw [NSException exceptionWithName:nil reason:@"This is an abstract class method to be implemented in an inherited class." userInfo:nil];
}

- (void)onSelected {
    @throw [NSException exceptionWithName:nil reason:@"This is an abstract class method to be implemented in an inherited class." userInfo:nil];
}

@end

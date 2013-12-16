//
//  CNPMultilevelMenuItem.h
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import <libxml/tree.h>

@protocol CNPMultilevelMenuItem

@property (nonatomic, readonly) xmlNodePtr node;

- (void)parse:(xmlNodePtr)setNode;

@end

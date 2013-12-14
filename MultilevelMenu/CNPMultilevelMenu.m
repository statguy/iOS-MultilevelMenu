//
//  MultilevelMenu.m
//  MultilevelMenu
//
//  Created by Jussi on 14/12/2013.
//  Copyright (c) 2013 Code & Pop. All rights reserved.
//

#import "CNPMultilevelMenu.h"

@implementation CNPMultilevelMenu

- (id)init:(NSURL *)setResourceFileURL menuItemFactory:(CNPMultilevelMenuItemFactory *)setMenuItemFactory {
    self = [super init];
    if (self) {
        resourceFileURL = setResourceFileURL;
        menuItemFactory = setMenuItemFactory;
    }
    return self;
}

- (xmlNodePtr)getMenuRootElement {
    const char *resourceFilePath = [resourceFileURL fileSystemRepresentation];
    document = xmlReadFile(resourceFilePath, NULL, 0);
    if (document == NULL) {
        [NSException raise:nil format:@"Failed to parse XML at %@.", resourceFileURL];
        return nil;
    }
    else {
        xmlNodePtr root = xmlDocGetRootElement(document);
        return root;
    }
}

- (NSMutableArray *)parse:(xmlNodePtr)node {
    if (xmlStrEqual(node->name, (const xmlChar *)"menu")) {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (xmlNodePtr subnode = node->xmlChildrenNode; subnode; subnode = subnode->next) {
            if (subnode->type == XML_ELEMENT_NODE) {
                if (!xmlStrEqual(subnode->name, (const xmlChar *)"item")) {
                    [NSException raise:nil format:@"Not an item node under menu."];
                    return nil;
                }
                CNPMultilevelMenuItem *menuItem = [menuItemFactory newMenuItem];
                [menuItem parse:subnode];
                [items addObject:menuItem];
            }
        }
        
        if ([items count] == 0) {
            [NSException raise:nil format:@"No items under menu."];
            return nil;
        }
        
        return items;
    }
    else {
        [NSException raise:nil format:@"Not a menu node."];
        return nil;
    }
}

- (void)dealloc {
    //[super dealloc];
    
    if (document != NULL) {
        xmlFreeDoc(document);
        xmlCleanupParser();
    }
}

@end

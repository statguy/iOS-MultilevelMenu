//
//  MultilevelMenu.m
//  MultilevelMenu
//
//  Created by Jussi Jousimo on 14/12/2013.
//  Copyright (c) 2013 Code & Pop tmi. All rights reserved.
//

#import "CNPMultilevelMenu.h"

@implementation CNPMultilevelMenu {
    NSURL *resourceFileURL;
    id<CNPMultilevelMenuItemFactory> menuItemFactory;
    xmlDocPtr document;
}
    
- (id)init:(NSURL *)setResourceFileURL menuItemFactory:(id<CNPMultilevelMenuItemFactory>)setMenuItemFactory {
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
                if (!xmlStrEqual(subnode->name, (const xmlChar *)"item"))
                    @throw [NSException exceptionWithName:nil reason:@"Item node not under menu." userInfo:nil];
                id<CNPMultilevelMenuItem> menuItem = [menuItemFactory newMenuItem];
                [menuItem parse:subnode];
                [items addObject:menuItem];
            }
        }
        
        if ([items count] == 0)
            @throw [NSException exceptionWithName:nil reason:@"No items under menu." userInfo:nil];
        
        return items;
    }
    else
        @throw [NSException exceptionWithName:nil reason:@"Not a menu node." userInfo:nil];
}

- (void)dealloc {
    if (document != NULL) {
        xmlFreeDoc(document);
        xmlCleanupParser();
    }
}

@end

//
//  SSTrieNode.h
//  Dictionary
//
//  Created by Sairam Sankaran on 4/6/14.
//  Copyright (c) 2014 Sairam Sankaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSTrieNode : NSObject

- (void) addWord:(NSString *) word;
- (SSTrieNode *) getNodeFromCharacter:(unichar) character;
- (NSMutableArray *) getWords;

@end

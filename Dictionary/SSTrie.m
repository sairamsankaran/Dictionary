//
//  SSTrie.m
//  Dictionary
//
//  Created by Sairam Sankaran on 4/6/14.
//  Copyright (c) 2014 Sairam Sankaran. All rights reserved.
//

#import "SSTrie.h"
#import "SSTrieNode.h"

@interface SSTrie ()

@property (nonatomic, strong) SSTrieNode *root;

@end

@implementation SSTrie

- (id) init {
    self = [super init];
    if (self) {
        _root = [[SSTrieNode alloc] init];
    }
    return self;
}

- (void) addWord:(NSString *) word {
    [_root addWord:word];
}

- (NSMutableArray *) getWordsWithPrefix:(NSString *) prefix {
    SSTrieNode *lastNode = _root;
    for (int index = 0; index < [prefix length]; index++) {
        lastNode = [lastNode getNodeFromCharacter:[prefix characterAtIndex:index]];
        if (lastNode == nil) {
            return [[NSMutableArray alloc] init];
        }
    }
    return [lastNode getWords];
}
@end

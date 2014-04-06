//
//  SSTrieNode.m
//  Dictionary
//
//  Created by Sairam Sankaran on 4/6/14.
//  Copyright (c) 2014 Sairam Sankaran. All rights reserved.
//

#import "SSTrieNode.h"

#define kEnglishLanguageAlphabetCount 26

@interface SSTrieNode () {
    unichar _character; // underscore prefixed to differentiate instance variable
    BOOL _isLeaf;
    BOOL _isWord; // marks end of a word
}
@property (nonatomic, strong) SSTrieNode *parent;
@property (nonatomic, strong) NSMutableArray *children; // array of SSTrieNode
    
@end


@implementation SSTrieNode

// root constructor
- (id) init {
    self = [super init];
    if (self) {
        [self constructorSetup];
    }
    return self;
}

// child constructor
- (id) initWithCharacter:(unichar) character {
    self = [super init];
    if (self) {
        [self constructorSetup];
        _character = character;
    }
    return self;
}

- (void) constructorSetup {
    self.children = [[NSMutableArray alloc] initWithCapacity:kEnglishLanguageAlphabetCount];
    _isLeaf = YES; // all nodes are created as leaves by default
    _isWord = NO;
}

// add a word to "this" node
- (void) addWord:(NSString *) word {
    _isLeaf = NO; // no more a leaf, as a child array is being added
    
    // English language assumed here
    NSUInteger characterPosition = [word characterAtIndex:0] - [@"a" characterAtIndex:0]; // position in children array
    
    if ([_children objectAtIndex:characterPosition] == nil) { // if character not already in trie at this level
        SSTrieNode *child = [[SSTrieNode alloc] initWithCharacter:[word characterAtIndex:0]];
        [_children insertObject:child atIndex:characterPosition];
        [[_children objectAtIndex:characterPosition] setParent:self];
    }
    
    if ([word length] > 1) {
        // recursively build trie
        [[_children objectAtIndex:characterPosition] addWord:[word substringFromIndex:1]];
    } else {
        // end of word
        SSTrieNode *child = [_children objectAtIndex:characterPosition];
        child->_isWord = YES;
    }
}

// get the child node for the given alphabet
- (SSTrieNode *) getNodeFromCharacter:(unichar) character {
    NSUInteger characterPosition = character - [@"a" characterAtIndex:0]; // position in children array
    SSTrieNode *child = [_children objectAtIndex:characterPosition];
    return child;
}

// get array of possible words from "this" node's children
- (NSMutableArray *) getWords {
    NSMutableArray *words = [[NSMutableArray alloc] init];
    if (_isWord) {
        [words addObject:[self getWord]];
    }
    if (!_isLeaf) {
        for (int child = 0; child < [_children count]; child++) { // for all alphabets at this node
            if ([_children objectAtIndex:child]) { // if any alphabet has children, get their words
                [words addObjectsFromArray:[[_children objectAtIndex:child] getWords]];
            }
        }
    }
    return words;
}

// get the word that "this" node ends in, by traversing through its ancestors
- (NSString *) getWord {
    if (_parent == nil) { // if root
        return @"";
    } else {
        NSString *word = [NSString stringWithFormat:@"%@%C", [_parent getWord], _character];
        return word;
    }
}

@end

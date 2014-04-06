//
//  SSResultsTableViewController.m
//  Dictionary
//
//  Created by Sairam Sankaran on 4/5/14.
//  Copyright (c) 2014 Sairam Sankaran. All rights reserved.
//

#import "SSResultsTableViewController.h"
#import "SSResultTableViewCell.h"

@interface SSResultsTableViewController ()

@property (nonatomic, strong) NSArray *dictionary;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation SSResultsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Dictionary";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"];
    NSCharacterSet *newLineCharacterSet = [NSCharacterSet newlineCharacterSet];
    self.dictionary = [[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByCharactersInSet:newLineCharacterSet];
    self.searchResults = [[NSMutableArray alloc] initWithObjects:@"Sairam", @"Sankaran", nil];
    
    [self setTableViewProperties];
    [self registerCells];
    [self addSearchBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"ResultCell";
    SSResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.resultLabel.text = [self.searchResults objectAtIndex:[indexPath row]];
    
    return cell;
}

# pragma mark - Search bar delegate methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Search text: %@", searchText);
}

# pragma mark - Class methods

- (void) setTableViewProperties {
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
}

- (void) registerCells {
    UINib *resultCell = [UINib nibWithNibName:@"SSResultTableViewCell" bundle:nil];
    [self.tableView registerNib:resultCell forCellReuseIdentifier:@"ResultCell"];
}

- (void) addSearchBar {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    searchBar.showsCancelButton = NO;
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
    
}

@end

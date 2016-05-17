//
//  ViewController.m
//  TableView01
//
//  Created by NishiokaKohei on 2016/05/17.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - UITableViewDataSource


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *_identifier =@"cell";
    UITableViewCell *_cell = [tableView dequeueReusableCellWithIdentifier: _identifier];
    
    if (!_cell) {
        _cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: _identifier];
    }
    
    
    
    _cell.textLabel.text = [NSString stringWithFormat:@"Section#%02d Row#%02d", (int)indexPath.section, (int)indexPath.row];
    
    return _cell;
}





@end

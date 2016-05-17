//
//  ViewController.m
//  TableView01
//
//  Created by NishiokaKohei on 2016/05/17.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *lists;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _lists = [[NSMutableArray alloc] initWithCapacity:0];
    
    Model *model1 = [[Model alloc] init];

    {   // その1
        model1.food = @"Sushi";
        model1.foodImage = @"Sushi.jpg";
        model1.country = @"Japaa";
        [_lists addObject:model1];
    }

    NSLog(@"%@", _lists);
    
    Model *model2 = [[Model alloc] init];
    
    {   // その2
        model2.food = @"Udon";
        model2.foodImage = @"Udon.jpg";
        model2.country = @"Japaa";
        [_lists addObject:model2];
    }
    
    NSLog(@"%@", _lists);

    Model *model3 = [[Model alloc] init];
    
    {   // その3
        model3.food = @"Pizza";
        model3.foodImage = @"Pizza.jpg";
        model3.country = @"Italy";
        [_lists addObject:model3];
    }
    
    NSLog(@"%@", _lists);
    
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
    return _lists.count;
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *_identifier =@"cell";
    UITableViewCell *_cell = [tableView dequeueReusableCellWithIdentifier: _identifier];
    
    if (!_cell) {
        _cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: _identifier];
    }
    
    
    
 //   _cell.textLabel.text = [NSString stringWithFormat:@"Section#%02d Row#%02d", (int)indexPath.section, (int)indexPath.row];
    
    
    Model *_model = [[Model alloc] init];
    
    _model = [_lists objectAtIndex:indexPath.row];
    
    _cell.accessoryType = UITableViewCellStyleValue2;

    _cell.textLabel.text = _model.food;
    _cell.detailTextLabel.text = _model.country;
    
    return _cell;
}





@end

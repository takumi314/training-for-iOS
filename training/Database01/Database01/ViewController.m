//
//  ViewController.m
//  Database01
//
//  Created by NishiokaKohei on 2016/05/14.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "ViewController.h"
#import "ModelViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textTitle;
@property (weak, nonatomic) IBOutlet UITextField *textContents;
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPickerLabel;
@property (weak,nonatomic) NSString *limitToDo;

- (IBAction)titleField:(id)sender;
- (IBAction)contentsField:(id)sender;
- (IBAction)datePicker:(id)sender;
- (IBAction)newTableBtn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //_inputData = @{ , };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction method

- (IBAction)titleField:(id)sender {
    [_textTitle setText:sender];
}

- (IBAction)contentsField:(id)sender {
    [_textContents setText:sender];
}

- (IBAction)datePicker:(id)sender {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd";
    _limitToDo = [df stringFromDate: _dataPickerLabel.date];
    
    return ;

}


- (IBAction)newTableBtn:(id)sender {
    ModelViewController *todo = [[ModelViewController alloc] init];

    return [todo createTable: _textTitle.text :_textContents.text: _limitToDo];
    
}



@end

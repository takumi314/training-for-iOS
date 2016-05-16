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

@property (weak, nonatomic) IBOutlet UITextField *titleFiledView;
@property (weak, nonatomic) IBOutlet UITextField *contentsFieldView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;
//@property (weak, nonatomic) NSString *limitDate;

- (IBAction)titleFiledAction:(id)sender;
- (IBAction)contentsFieldAction:(id)sender;
- (IBAction)dataPicker:(id)sender;
- (IBAction)doneButton:(id)sender;


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



#pragma mark - IBAction method



- (IBAction)titleFiledAction:(id)sender {
    _titleFiledView.text = sender;
}

- (IBAction)contentsFieldAction:(id)sender {
    _contentsFieldView.text = sender;
}

- (IBAction)dataPicker:(id)sender {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    [df stringFromDate: _datePickerView.date];
    return;
}

- (IBAction)doneButton:(id)sender {
    
    ModelViewController *_model = [[ModelViewController alloc] init];
    
    [_model createTable];
    
    //NSLog(@"%@, %@", _titleFiledView.text, _contentsFieldView.text );
    
    [_model insertTable:_titleFiledView.text num2:_contentsFieldView.text num3: _datePickerView.date ];
    
}


@end

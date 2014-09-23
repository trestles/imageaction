//
//  DrawingViewController.m
//  imageaction
//
//  Created by jonathan twaddell on 9/22/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "DrawingViewController.h"
#import "CircleView.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  CircleView  *myCircleView=[[CircleView alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 200.0f, 200.0f)];

  [self.view addSubview:myCircleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismiss:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

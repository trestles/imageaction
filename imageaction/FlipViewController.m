//
//  FlipViewController.m
//  imageaction
//
//  Created by jonathan twaddell on 9/18/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "FlipViewController.h"
#import "MapView.h"
#import "BeachView.h"

@interface FlipViewController (){
  BeachView *_bv;
  MapView *_mv;
}

@end

@implementation FlipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  _bv=[[BeachView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
  _mv=[[MapView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];

  [self.mainView addSubview:_bv];
}
- (IBAction)dismiss:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)flip:(id)sender {
  
  [UIView transitionWithView:self.mainView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    [self.mainView addSubview:_mv];
  } completion:nil
  ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

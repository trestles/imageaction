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
  BOOL _showBeachView;
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
  _showBeachView=YES;

  [self.mainView addSubview:_bv];
}
- (IBAction)dismiss:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)flip:(id)sender {
  
  
  [UIView transitionWithView:self.mainView duration:0.40 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    if(_showBeachView){
      [self.mainView addSubview:_mv];
    }else{
      [self.mainView addSubview:_bv];
    }
    _showBeachView=!_showBeachView;
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

//
//  ViewController.m
//  imageaction
//
//  Created by jonathan twaddell on 9/17/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#define ARC4RANDOM_MAX      0x100000000
#define ADURATION .07

#import "ViewController.h"
#import "OverlayView.h"
#import "Utility.h"

@interface ViewController (){
  NSMutableArray *_viewArrays;
  NSMutableArray *_colorsArray;
  int _numberOfPresses;
  UIColor *_currentColor;
  int _boxesPerSide;
}

@end

@implementation ViewController{
  UIImageView *purple;
  UIImageView *maroon;
  BOOL fromPurple;
  BOOL _showSnail;
}

- (void)viewDidLoad
{
  
  
    [super viewDidLoad];
  
  _showSnail=YES;
  /*
  maroon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"maroon.png"]];
  purple = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"purple.png"]];
  */
  
  //[self.view ]
  
  _numberOfPresses=0;
  _colorsArray=[[NSMutableArray alloc] init];
  
  [_colorsArray addObject:[UIColor blueColor]];
  [_colorsArray addObject:[UIColor greenColor]];
  [_colorsArray addObject:[UIColor yellowColor]];
  
  _viewArrays=[[NSMutableArray alloc] init];
    // lets create like
  CGFloat width=300.0f;
  //CGFloat boxSize=30.0f;
  CGFloat boxSize=30.0f;

  _boxesPerSide=width / boxSize;
  NSLog(@"here is _boxesPerSide %i",_boxesPerSide);
  
  for(int j=0; j<_boxesPerSide; j++){
    NSMutableArray *tmpArray=[[NSMutableArray alloc] init];
    [_viewArrays addObject:tmpArray];
    for(int i=0; i<_boxesPerSide; i++){
      NSLog(@"here is %i", i);
      OverlayView *tmpView=[[OverlayView alloc] initWithFrame:CGRectMake(i*boxSize, j*boxSize, boxSize, boxSize)];
      double val=((double)arc4random() / ARC4RANDOM_MAX);
      tmpView.backgroundColor=[[UIColor orangeColor] colorWithAlphaComponent:val];
      tmpView.layer.borderColor=[UIColor blackColor].CGColor;
      tmpView.layer.borderWidth=1.0f;
      
      [self.view addSubview:tmpView];
      [tmpArray addObject:tmpView];
    }
  }
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeColors:(id)sender {
  _currentColor=_colorsArray[arc4random_uniform(3)];

  if(_numberOfPresses%2){
    //NSLog(@"about to change colors");
    [self animateFromTop];
  }else{
    NSLog(@"next time :)");
    [self animateFromLeft];
  }
  
  _numberOfPresses++;
  NSLog(@"here is number of presses: %i", _numberOfPresses);
}

-(void)animateFromTop
{
  
  int j=0;
  for(NSMutableArray *tmpHoldingArray in _viewArrays){
    for(OverlayView *ov in tmpHoldingArray){
      [UIView animateWithDuration:0.25
                            delay:(j*ADURATION)
                          options:UIViewAnimationOptionCurveEaseInOut
                       animations:^{
                         double val=((double)arc4random() / ARC4RANDOM_MAX);
                         ov.backgroundColor=[_currentColor colorWithAlphaComponent:val];
                         
                       }
                       completion:^(BOOL finished) {
                         
                       }];
      
      if(ov.svFactor < .5){
        [UIView animateWithDuration:0.52 animations:^{
          ov.smallView.backgroundColor=_currentColor;
        }];
      }else{
        NSLog(@"about to call transform");
        [UIView animateWithDuration:0.50 animations:^{
          ov.microView.transform = CGAffineTransformRotate(ov.microView.transform, 90 * M_PI / 360);
        }];
      }
      
      
    }
    j++;
  }
}


-(void)animateFromLeft
{
  for(int k=0; k<_boxesPerSide; k++){
    for(int m=0; m<_boxesPerSide; m++){
      NSLog(@"here is value: %i %i", k, m);
      OverlayView *ov=_viewArrays[m][k];
      [UIView animateWithDuration:0.25
                            delay:(k*ADURATION)
                          options:UIViewAnimationOptionCurveEaseInOut
                       animations:^{
                         double val=((double)arc4random() / ARC4RANDOM_MAX);
                         //ov.backgroundColor=[[UIColor orangeColor] colorWithAlphaComponent:val];
                         ov.backgroundColor=[_currentColor colorWithAlphaComponent:val];
                         
                       }
                       completion:^(BOOL finished) {
                         
                       }
       ];
      
      
       [UIView animateWithDuration:0.12 animations:^{
         ov.smallView.backgroundColor=[UIColor whiteColor];
         [ov animateSmallView];
       }];
      
      
      //m++;
    }
    //k++;
  }
}

- (IBAction)flip:(id)sender {
  NSLog(@"about to flip");
  //self.navigationItem.rightBarButtonItem.enabled = NO;
  /*
  UIView * toView = fromPurple ? maroon : purple;
  UIView * fromView = fromPurple ? purple : maroon;
  */
  [UIView transitionWithView:self.iv duration:0.25f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    if(_showSnail){
      self.iv.image=[UIImage imageNamed:@"maroon.png"];
      _showSnail=!_showSnail;
    }else{
      self.iv.image=[UIImage imageNamed:@"purple.png"];
      _showSnail=!_showSnail;
    }

  } completion:^(BOOL finished) {
    nil;
  }];
  /*
  [UIView transitionWithView: self.iv
                    duration: 1.0f
                     options: UIViewAnimationOptionTransitionFlipFromLeft
                  animations:^{
                    //self.navigationItem.rightBarButtonItem.enabled = YES;
                    fromPurple = !fromPurple;
                    self.iv.image=[UIImage imageNamed:@"purple.png"];
                    //CENTER_VIEW(self.view, toView);
                  }];
*/
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

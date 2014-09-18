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

@interface ViewController (){
  NSMutableArray *_viewArrays;
  NSMutableArray *_colorsArray;
  int _numberOfPresses;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
  
  
    [super viewDidLoad];
  _numberOfPresses=0;
  _colorsArray=[[NSMutableArray alloc] init];
  
  [_colorsArray addObject:[UIColor blueColor]];
  [_colorsArray addObject:[UIColor greenColor]];
  [_colorsArray addObject:[UIColor yellowColor]];
  
  _viewArrays=[[NSMutableArray alloc] init];
    // lets create like
  CGFloat boxSize=30.0f;
  
  for(int j=0; j<10; j++){
    NSMutableArray *tmpArray=[[NSMutableArray alloc] init];
    [_viewArrays addObject:tmpArray];
    for(int i=0; i<10; i++){
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
  UIColor *tmpColor=_colorsArray[arc4random_uniform(3)];

  if(_numberOfPresses%2){
    //NSLog(@"about to change colors");
    int j=0;
    for(NSMutableArray *tmpHoldingArray in _viewArrays){
      for(OverlayView *ov in tmpHoldingArray){
        [UIView animateWithDuration:0.25
                            delay:(j*ADURATION)
                           options:UIViewAnimationOptionCurveEaseInOut
                       animations:^{
             double val=((double)arc4random() / ARC4RANDOM_MAX);
            ov.backgroundColor=[tmpColor colorWithAlphaComponent:val];

        }
         completion:^(BOOL finished) {
         
        }];
      
      [UIView animateWithDuration:0.52 animations:^{
        ov.smallView.backgroundColor=tmpColor;
      }];
      
      
       }
    j++;
    }
  }else{
    NSLog(@"next time :)");
    for(int k=0; k<10; k++){
      for(int m=0; m<10; m++){
        NSLog(@"here is value: %i %i", k, m);
        OverlayView *ov=_viewArrays[m][k];
        [UIView animateWithDuration:0.25
                              delay:(k*ADURATION)
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                           double val=((double)arc4random() / ARC4RANDOM_MAX);
                           //ov.backgroundColor=[[UIColor orangeColor] colorWithAlphaComponent:val];
                           ov.backgroundColor=[tmpColor colorWithAlphaComponent:val];
                           
                         }
                         completion:^(BOOL finished) {
                           
                         }
         ];
        /*
        [UIView animateWithDuration:0.12 animations:^{
          ov.smallView.backgroundColor=tmpColor;
        }];
        */
        
        //m++;
      }
      //k++;
    }
  }
  
  _numberOfPresses++;
  NSLog(@"here is number of presses: %i", _numberOfPresses);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

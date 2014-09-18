//
//  OverlayView.m
//  imageaction
//
//  Created by jonathan twaddell on 9/17/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
  NSLog(@"here is our width: %f", self.frame.size.width);
  CGFloat viewWidth=self.frame.size.width;
  CGFloat smallWidth=viewWidth/3;
  self.smallView=[[UIView alloc] initWithFrame:CGRectMake(smallWidth, smallWidth, smallWidth, smallWidth)];
  
  [self.smallView setBackgroundColor:[UIColor clearColor]];
  self.smallView.layer.borderWidth=0.5f;
  self.smallView.layer.borderColor=[UIColor blackColor].CGColor;
  
  
  [self addSubview:self.smallView];
  
  
    return self;
}

-(void)animateSmallView
{
  NSLog(@"about to animate the small view %f %f", self.smallView.frame.size.width, self.smallView.frame.size.height);
  CGFloat animVal=3.0f;
  [UIView animateWithDuration:1.0
                   animations:^{
                     
                     self.smallView.frame=CGRectMake(self.smallView.frame.origin.x-animVal,
                                                     self.smallView.frame.origin.y-animVal, self.smallView.frame.size.width + (2*animVal),
                                                     self.smallView.frame.size.height + (2*animVal));
                   }];
  
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end

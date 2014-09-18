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
  
  self.smallView=[[UIView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 10.0f, 10.0f)];
  
  [self.smallView setBackgroundColor:[UIColor clearColor]];
  self.smallView.layer.borderWidth=0.5f;
  self.smallView.layer.borderColor=[UIColor blackColor].CGColor;
  
  
  [self addSubview:self.smallView];
  
  
    return self;
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

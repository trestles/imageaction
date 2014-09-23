//
//  CircleView.m
//  imageaction
//
//  Created by jonathan twaddell on 9/23/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

-(instancetype)initWithFrame:(CGRect)frame
{
  self=[super initWithFrame:frame];
  if(self){
    self.backgroundColor=[UIColor clearColor];
  }
  return self;
}


- (void)drawRect:(CGRect)rect {
  // Drawing code
  //self.backgroundColor=[UIColor redColor];
  CGRect bounds=self.bounds;
  CGPoint center;
  center.x = bounds.origin.x + bounds.size.width / 2;
  center.y = bounds.origin.y + bounds.size.height / 2;
  
  
  //NSLog(@"here is center: %@", center);
  float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
  //(MIN(bounds.size.width, bounds.size.height) / 2.0);
  
  
  UIBezierPath *path = [[UIBezierPath alloc] init];
  
  for(float currentRadius=maxRadius; currentRadius>0;currentRadius-=20){
    [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    
    [path addArcWithCenter:center
                    radius:currentRadius
                startAngle:0.0
                  endAngle:M_PI*2.0
                 clockwise:YES];
    
  }
  
  path.lineWidth=10.0;
  [[UIColor lightGrayColor] setStroke];
  [path stroke];
  
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRectOld:(CGRect)rect {
    // Drawing code
  //self.backgroundColor=[UIColor redColor];
  CGRect bounds=self.bounds;
  CGPoint center;
  center.x = bounds.origin.x + bounds.size.width / 2;
  center.y = bounds.origin.y + bounds.size.height / 2;
  
  
  //NSLog(@"here is center: %@", center);
  float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
  
  
  UIBezierPath *path = [[UIBezierPath alloc] init];
  [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
  path.lineWidth=10.0;
  [[UIColor lightGrayColor] setStroke];
  [path stroke];
  
}


@end

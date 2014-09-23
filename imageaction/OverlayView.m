//
//  OverlayView.m
//  imageaction
//
//  Created by jonathan twaddell on 9/17/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "OverlayView.h"
#import "Utility.h"

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
  
  
  CGFloat smallerWidth=viewWidth/4;
  self.microView=[[UIView alloc] initWithFrame:CGRectMake(smallerWidth, smallerWidth, smallerWidth, smallerWidth)];
  [self.microView setBackgroundColor:[UIColor clearColor]];
  self.microView.layer.borderWidth=0.5f;
  self.microView.layer.borderColor=[UIColor blackColor].CGColor;
  [self addSubview:self.microView];
  self.microView.hidden=YES;
  
  /*
  CAShapeLayer *shapeView = [[CAShapeLayer alloc] init];
  //And set its path:
  
  [shapeView setPath:[self createPath].CGPath];
  //Finally add it:
  
  [[self.view layer] addSublayer:shapeView];
*/
  
  
    return self;
}

-(void)animateSmallView
{
  CGFloat animVal=3.0f;
  self.svFactor=self.smallView.frame.size.width / self.frame.size.width;
  NSLog(@"factor %f about to animate the small view %f %f", self.svFactor, self.smallView.frame.size.width, self.smallView.frame.size.height);
  if(self.svFactor < .5){
  [UIView animateWithDuration:1.0
                   animations:^{
                     
                     self.smallView.frame=CGRectMake(self.smallView.frame.origin.x-animVal,
                                                     self.smallView.frame.origin.y-animVal, self.smallView.frame.size.width + (2*animVal),
                                                     self.smallView.frame.size.height + (2*animVal));
                   }];
  }else{
    self.microView.hidden=NO;
  }
  
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  // Create an oval shape to draw.
  UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:
                         CGRectMake(40, 40, 10, 10)];
  
  // Set the render colors.
  [[UIColor blackColor] setStroke];
  [[UIColor clearColor] setFill];
  
  CGContextRef aRef = UIGraphicsGetCurrentContext();
  
  // If you have content to draw after the shape,
  // save the current state before changing the transform.
  //CGContextSaveGState(aRef);
  
  // Adjust the view's origin temporarily. The oval is
  // now drawn relative to the new origin point.
  CGContextTranslateCTM(aRef, 50, 50);
  
  // Adjust the drawing options as needed.
  aPath.lineWidth = 1;
  
  // Fill the path before stroking it so that the fill
  // color does not obscure the stroked line.
  [aPath fill];
  [aPath stroke];
  
  // Drawing code
  /*
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(3,
                                                                            3)
                                                         radius:15
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(135)
                                                      clockwise:YES];
  
  UIGraphicsBeginImageContext(CGSizeMake(275, 300));
  
  //this gets the graphic context
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  //you can stroke and/or fill
  CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
  CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
  [aPath fill];
  [aPath stroke];
  
  //now get the image from the context
  UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
  
  UIGraphicsEndImageContext();
  */
  

    
  

}
@end

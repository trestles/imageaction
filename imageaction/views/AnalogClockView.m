//
//  AnalogClockView.m
//  imageaction
//
//  Created by jonathan twaddell on 9/23/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "AnalogClockView.h"

@interface AnalogClockView()
{
  
}

@property (nonatomic, weak)
IBOutlet UIView *pendulum;
@property (nonatomic, weak) IBOutlet UIView *minutesHand;
@property (nonatomic, weak) IBOutlet UIView *secondsHand;
@property (nonatomic, weak) IBOutlet UIView *hoursHand;


@end

@implementation AnalogClockView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)moveHand:(UIView *)hand toAngle:(CGFloat)angle
{
  NSLog(@"what do you want");
  [[hand layer] setAnchorPoint:CGPointMake(0.4f, 0.75f)];
  [[hand layer] setPosition:CGPointMake(165.0f, 155.0f)];
  [UIView animateWithDuration:0.5 animations:^{
    CGAffineTransform matrix = CGAffineTransformMakeRotation(angle * M_PI / 180);
    [[hand layer] setAffineTransform:matrix];
  }];
}

-(void)moveHandstoLocalTime
{
  NSLog(@"here i am");
  NSInteger comp=(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
  NSDateComponents *components=[[NSCalendar currentCalendar] components:comp fromDate:[NSDate date]];
  
  [self moveHand: self.hoursHand toAngle:([components hour] % 12) * 360.0f / 12.0f];
  [self moveHand: self.minutesHand toAngle:[components minute] * 360.0f / 12.0f];
  
  
  //[self moveHand: self.hoursHand ]; //]toAngle:([components hour] % 12) * 360.0f / 12.0f];
  


}

-(void)didMoveToWindow
{
//  [NSTimer scheduledTimerWithTimeInterval:1.0 invocation:<#(NSInvocation *)#> repeats:YES];
  [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(moveHandstoLocalTime) userInfo:nil repeats:YES];
}


@end

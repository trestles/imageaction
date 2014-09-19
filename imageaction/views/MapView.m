//
//  MapView.m
//  imageaction
//
//  Created by jonathan twaddell on 9/18/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    self.backgroundColor=[UIColor orangeColor];
    UILabel *bgLabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 160.0f, 30.0f)];
    bgLabel.text=@"change background";
  bgLabel.userInteractionEnabled=YES;
  //make them touchable
  UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeBackground)];
  //letterTapRecognizer.numberOfTapsRequired = 1;
  [bgLabel addGestureRecognizer:letterTapRecognizer];
  
    [self addSubview:bgLabel];
    return self;
}

-(void)changeBackground
{
  NSArray *colors=@[[UIColor blueColor], [UIColor grayColor], [UIColor greenColor]];

  //[self setBackgroundColor:[UIColor blueColor]];
  NSUInteger v=arc4random_uniform([colors count]);
  [self setBackgroundColor:colors[v]];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
  UILabel *myLabel=[[UILabel alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 100.0f, 30.0f)];
  myLabel.text=@"here is some text";
  [self addSubview:myLabel];

}


@end

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
  [self setBackgroundColor:[UIColor blueColor]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

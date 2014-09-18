//
//  OverlayView.h
//  imageaction
//
//  Created by jonathan twaddell on 9/17/14.
//  Copyright (c) 2014 Embers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverlayView : UIView

@property (nonatomic, strong) UIView *smallView;
@property (nonatomic, assign) CGFloat svFactor;

-(void)animateSmallView;

@end

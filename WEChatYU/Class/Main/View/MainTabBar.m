//
//  MainTabBar.m
//  WEChatYU
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MainTabBar.h"
#import "PlusViewController.h"
@interface MainTabBar ()
@property (nonatomic,strong) UIButton* plusButton;
@end

@implementation MainTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateHighlighted];
        [plusButton sizeToFit];
        [plusButton addTarget:self action:@selector(plusButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusButton];
        self.plusButton = plusButton;
    }
    return self;
}

- (void)plusButtonClick
{
    PlusViewController *chatVc = [[PlusViewController alloc] init];
    [self.window.rootViewController presentViewController:chatVc animated:YES completion:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    self.plusButton.center = CGPointMake(width * 0.5, height * 0.5);
    self.plusButton.y = -20;
    
    int index = 0;
    
    CGFloat tabBarButtonW = width / 5;
    CGFloat tabBarButtonH = height;
    CGFloat tabBarButtonY = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        if (![NSStringFromClass(tabBarButton.class) isEqualToString:@"UITabBarButton"]) continue;
        
        
        CGFloat tabBarButtonX = index * tabBarButtonW;
        if (index >= 2) {
            tabBarButtonX += tabBarButtonW;
        }
        
        
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarButtonH);
        
        index++;
    }
    
    [self bringSubviewToFront:self.plusButton];
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) { // 当前界面 tabBar显示
        
        CGPoint newPoint = [self convertPoint:point toView:self.plusButton];
        
        if ( [self.plusButton pointInside:newPoint withEvent:event]) { // 点 属于按钮范围
            return self.plusButton;
            
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}
@end
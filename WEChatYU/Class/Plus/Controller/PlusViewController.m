//
//  PlusViewController.m
//  WEChatYU
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PlusViewController.h"
#import "PlusButton.h"
@interface PlusViewController ()
@property (nonatomic,strong) UIImageView *backGroundImageView;
@end

@implementation PlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = NO;
    [self setupBackgroupImageView];
    //延时 一下0.8 秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setupButtons];
    });
}
- (void)setupBackgroupImageView
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shareBottomBackground"]];
    imageV.frame = self.view.bounds;
    self.backGroundImageView = imageV;
    [self.view addSubview:self.backGroundImageView];
}
- (void)setupButtons{
    NSArray *images = @[@"aio_voiceChange_effect_3", @"aio_voiceChange_effect_1", @"aio_voiceChange_effect_2", @"aio_voiceChange_effect_4", @"aio_voiceChange_effect_5", @"aio_voiceChange_effect_0"];
    NSArray *titles = @[@"文字",@"照片/视频",@"头条文章",@"签到",@"音乐",@"红包"];
    
    NSUInteger count = images.count;
    int maxLineCount = 3;
    NSUInteger rowsCount = (count + maxLineCount - 1) / maxLineCount;//最大行数
    
    CGFloat buttonW = self.view.width / maxLineCount;
    CGFloat buttonH = buttonW * 0.85;
    CGFloat buttonStartY = (self.view.height - rowsCount * buttonH) * 0.5;
    for (int i = 0; i < count; i++) {
        
        PlusButton *button = [PlusButton buttonWithType:UIButtonTypeCustom];
        
        button.width = -1;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        CGFloat buttonX = (i % maxLineCount) * buttonW;
        CGFloat buttonY = buttonStartY + (i / maxLineCount) * buttonH;
        /**
         弹簧动画效果
         duration:执行时间
         delay:延迟时间
         damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
         springVelocity:弹性复位的速度
         options:动画设置，例如自动恢复、匀速运动等
         completion:动画完成回调方法
         */
        [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            
        } completion:^(BOOL finished) {
            self.view.userInteractionEnabled = YES;
        }];
    }
}
#pragma mark - 点击
- (void)buttonClick:(PlusButton *)button
{
    LCLog(@"尚未开发");
}
//点击空白返回

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}
@end

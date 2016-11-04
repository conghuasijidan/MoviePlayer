//
//  YKMPMoviewController.m
//  MoviePlayer
//
//  Created by 叶文凯 on 16/11/3.
//  Copyright © 2016年 葱花思鸡蛋. All rights reserved.
//

#import "YKMPMoviewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface YKMPMoviewController ()

@property(nonatomic,strong)MPMoviePlayerController * player;

@end

@implementation YKMPMoviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
// iOS 9.0 后也被弃用
- (IBAction)palyMovieAction:(id)sender {
    // 加载网络资源
    NSString *urlString = [@"http://baobab.wdjcdn.com/14676170652191(23).mp4" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    
    //创建控制器
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    CGRect frame = CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height * 0.5);
    player.view.frame = frame;
    //设置播放器的控制面板风格
//    player.controlStyle = MPMovieControlStyleFullscreen;
    // 缩放模式
    player.scalingMode = MPMovieScalingModeAspectFill;
    
    [self.view addSubview:player.view];
    // 必须强引用不然会自然释放，无法播放文件
     self.player = player;
    // 提前加载资源
    [player prepareToPlay];
}

- (IBAction)horizontalScreenAction:(id)sender {
    
    //在动画中改变视图的位置
    [UIView animateWithDuration:0.3 animations:^{
        //旋转
        self.player.view.transform = CGAffineTransformRotate(self.player.view.transform, M_PI_2);
        //全屏
        self.player.view.frame = [UIScreen mainScreen].bounds;
    }];
    
}

@end

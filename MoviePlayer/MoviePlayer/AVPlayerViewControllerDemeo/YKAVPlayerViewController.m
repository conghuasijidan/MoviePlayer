//
//  YKAVPlayerViewController.m
//  MoviePlayer
//
//  Created by 叶文凯 on 16/11/4.
//  Copyright © 2016年 葱花思鸡蛋. All rights reserved.
//

#import "YKAVPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface YKAVPlayerViewController ()
@property(nonatomic,strong)AVPlayerViewController * playerVC;

@end

@implementation YKAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)playMovieAction:(id)sender {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"minion_01.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
    
    self.playerVC = [[AVPlayerViewController alloc] init];
    self.playerVC.player = player;
    // 设置缩放模式
    self.playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
    // 是否显示媒体播放组件
    self.playerVC.showsPlaybackControls = YES;
    //界面实现时开始播放
    [self.playerVC.player play];
    //播放方式有两种，任选其中一种即可
    //第一种方式：可以选择在本控制器里播放
//    self.playerVC.view.frame = CGRectMake(0, 150, self.view.frame.size.width, 300);
//    [self addChildViewController:self.playerVC];
//    [self.view addSubview:self.playerVC.view];
    
    // 第二种方式：可以弹出一个控制器进行播放
    [self presentViewController:self.playerVC animated:YES completion:nil];
}

@end

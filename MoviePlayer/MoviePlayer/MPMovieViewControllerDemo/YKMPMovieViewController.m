//
//  YKMPMovieViewController.m
//  MoviePlayer
//
//  Created by 叶文凯 on 16/11/3.
//  Copyright © 2016年 葱花思鸡蛋. All rights reserved.
//

#import "YKMPMovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface YKMPMovieViewController ()
@property(nonatomic,strong)MPMoviePlayerViewController * player;

@end

@implementation YKMPMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"播放器";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //清空界面
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.player = nil;
}
//注意： 此方法iOS9.0 已经弃用 在Xcode8 及以上会在底部一直打输出，查阅大量资料无法去除,不建议使用
- (IBAction)playMovieAction:(id)sender
{
    //设置资源文件路径 //可以播放网络资源，
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"minion_01.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    // 添加播放器
    MPMoviePlayerViewController *VC = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self.navigationController presentViewController:VC animated:YES completion:nil];
    //添加全局属性
    self.player = VC;
    //添加通知监听播放器的动作
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidChangeAction) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidFinishAction) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

#pragma mark - 监听通知方法
//播放器状态改变事件会监听播放器所有的状态变化
- (void)movieDidChangeAction
{
    NSLog(@"播放器事件改变");
    
    switch (self.player.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:
            NSLog(@"正在播放");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停播放");
            break;
        case MPMoviePlaybackStateStopped:
            NSLog(@"停止播放");
            break;
        case MPMoviePlaybackStateInterrupted:
            NSLog(@"播放中断");
            break;
        case MPMoviePlaybackStateSeekingForward:
            NSLog(@"向前");
            break;
        case MPMoviePlaybackStateSeekingBackward:
            NSLog(@"向后");
            break;
        default:
            break;
    }
    
    
}
- (void)movieDidFinishAction
{
    NSLog(@"视频播放完毕");
}
//移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
}


@end

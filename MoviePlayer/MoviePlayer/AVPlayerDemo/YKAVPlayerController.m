//
//  YKAVPlayerController.m
//  MoviePlayer
//
//  Created by 叶文凯 on 16/11/4.
//  Copyright © 2016年 葱花思鸡蛋. All rights reserved.
//

#import "YKAVPlayerController.h"
#import <AVFoundation/AVFoundation.h>
@interface YKAVPlayerController ()
@property(nonatomic,strong)AVPlayer * player;
@property(nonatomic,strong)AVPlayerLayer * layer;

@end

@implementation YKAVPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)pauseAction:(id)sender {
    [_player pause];
}

- (IBAction)playMovieAction:(id)sender {
    
    [self.player play];
}
- (IBAction)endAction:(id)sender {
    //注意此时self.player 一定要释放，不然再次播放无法开启
    self.player = nil;
    [self.layer removeFromSuperlayer];
    //注意释放内存
    self.layer = nil;
}
//懒加载
- (AVPlayer *)player
{
    if (_player == nil) {
        // 加载网络资源
        //    NSString *urlString = @"http://baobab.wdjcdn.com/14676170652191(23).mp4";
        //    NSURL *url = [NSURL URLWithString:urlString];
        //设置资源文件路径 //可以播放网络资源，
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"minion_01.mp4" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        
        AVAsset *asset = [AVAsset assetWithURL:url];
        
        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
        _player = [[AVPlayer alloc] initWithPlayerItem:item];
        //注意点：此方法不能使用构造方法，不然不会显示，只会有声音
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        [self.view.layer addSublayer:playerLayer];
        
        playerLayer.frame = [UIScreen mainScreen].bounds;
        self.layer = playerLayer;
    }
    
    return _player;
}
@end

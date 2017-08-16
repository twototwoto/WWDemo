//
//  WWEpubKit.m
//  WWDemo
//
//  Created by Live on 2017/8/15.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//


// MARK: - Internal constants for devices
#define isIPad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
#define isIPhone = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;

//MARK: - Internal constants
#define kApplicationDocumentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define kCurrentFontFamily = @"com.wwReader.kCurrentFontFamily"
#define kCurrentFontSize = @"com.wwReader.kCurrentFontSize"
#define kCurrentAudioRate = @"com.wwReader.kCurrentAudioRate"
#define kCurrentMediaOverlayStyle = @"com.wwReader.kCurrentMediaOverlayStyle"
#define kCurrentScrollDirection = @"com.wwReader.kCurrentScrollDirection"
#define kNightMode = @"com.wwReader.kNightMode"
#define kCurrentMenu = @"com.wwReader.kCurrentMenu";
#define kHighlightRange = 30
#define kBookId = @""
#define kCurrentTOCMenu = @"com.wwReader.kCurrentTOCMenu"
#define kReuseIdentifier = @"com.wwReader.Cell.ReuseIdentifier"




typedef NS_ENUM(NSUInteger, MediaOverlayStyle) {
    MediaOverlayStyle_Default,
    MediaOverlayStyle_Underline,
    MediaOverlayStyle_TextColor
#warning - 这部分参考内容做了init操作
    
};





#import "WWEpubKit.h"







@implementation WWEpubKit

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置UI
- (void)setupUI{
    
}





























@end

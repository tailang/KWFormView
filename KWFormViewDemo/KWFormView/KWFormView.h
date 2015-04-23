//
//  KWFormView.h
//  KWFormViewDemo
//
//  Created by kevin on 15/3/17.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KWFormView;

typedef NS_ENUM(NSInteger, KWFormViewMode)
{
    KWFormViewModeDefault,
    KWFormViewModeLeft,
    KWFormViewModeRight,
    KWFormViewModeMiddle,
};

@protocol KWFormViewDataSource <NSObject>
- (NSInteger)numberOfRowsInFormView:(KWFormView *)formView;
- (NSInteger)formViewColumnsInRow:(KWFormView *)formView;
- (CGFloat)formView:(KWFormView *)formView widthForColumn:(NSInteger)column;
- (NSString *)formView:(KWFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row;
@optional
- (CGFloat)formView:(KWFormView *)formView heightForRow:(NSInteger)row;
- (UIColor *)formView:(KWFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row;
- (UIColor *)formView:(KWFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row;
- (UIColor *)formViewBorderColor:(KWFormView *)formView;
- (UIView *)formViewViewForFooter:(KWFormView *)formView;
- (UIFont *)formViewFontOfContent:(KWFormView *)formView;
- (BOOL)formView:(KWFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row;
@end

@protocol KWFormViewDelegate <NSObject>
@optional
- (void)formView:(KWFormView *)formView didSelectColumn:(NSInteger)column inRow:(NSInteger)row;
@end

@interface KWFormView : UIView
@property (nonatomic, weak) id<KWFormViewDataSource> dataSource;
@property (nonatomic, weak) id<KWFormViewDelegate> delegate;
@property (nonatomic, assign) BOOL thickBorder;
@property (nonatomic, assign ,readonly) KWFormViewMode mode;
- (void)setMode:(KWFormViewMode)mode withMargin:(CGFloat)margin;
- (UIButton *)itemAtColumn:(NSInteger)column inRow:(NSInteger)row;
@end

@interface UIImage (KWFormView)
- (BOOL)hasAlpha;
- (UIImage *)imageWithAlpha;
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;
+ (UIImage *)imageFromColor:(UIColor *)color;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
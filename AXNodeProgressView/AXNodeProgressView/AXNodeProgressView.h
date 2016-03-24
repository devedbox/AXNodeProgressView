//
//  AXNodeProgressView.h
//  AXNodeProgressView
//
//  Created by ai on 16/3/24.
//  Copyright © 2016年 devedbox. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE @interface AXNodeProgressView : UIView
/// Count of node. Defaults is 4.
@property(assign, nonatomic) IBInspectable NSInteger countOfNode;
/// Process of node prpgress view. Can not higher than count of node.
@property(assign, nonatomic) IBInspectable NSInteger progress;
/// Size of node. Defaults is 13.
@property(assign, nonatomic) IBInspectable CGFloat sizeOfNode;
/// Default normal tint color.
@property(strong, nonatomic, nonnull) IBInspectable UIColor *normalColor;
/// Default selection tint color.
@property(strong, nonatomic, nonnull) IBInspectable UIColor *selectionColor;
/// Default progress selection color.
@property(strong, nonatomic, nullable) IBInspectable UIColor *progressColor;
/// Line width. Defaults is 2.0.
@property(assign, nonatomic) IBInspectable CGFloat lineWidth;
/// Content insets. Defaults is (0, 2, 0, 2).
@property(assign, nonatomic) IBInspectable UIEdgeInsets contentInsets;
/// Shows progress color. Defaults is NO.
@property(assign, nonatomic) IBInspectable BOOL showsProgressColor;

- (void)setNormalColor:(UIColor * _Nonnull)normalColor UI_APPEARANCE_SELECTOR;
- (void)setSelectionColor:(UIColor * _Nonnull)selectionColor UI_APPEARANCE_SELECTOR;
- (void)setProgressColor:(UIColor * _Nullable)progressColor UI_APPEARANCE_SELECTOR;
- (void)setLineWidth:(CGFloat)lineWidth UI_APPEARANCE_SELECTOR;
- (void)setContentInsets:(UIEdgeInsets)contentInsets UI_APPEARANCE_SELECTOR;
@end
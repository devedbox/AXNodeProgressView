//
//  AXNodeProgressView.m
//  AXNodeProgressView
//
//  Created by ai on 16/3/24.
//  Copyright © 2016年 devedbox. All rights reserved.
//

#import "AXNodeProgressView.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation AXNodeProgressView
#pragma mark - Life cycle
- (instancetype)init {
    if (self = [super init]) {
        [self initializer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializer];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initializer];
}

- (void)initializer {
    if (_countOfNode == 0) {
        _countOfNode = 4;
    }
    if (_sizeOfNode == 0) {
        _sizeOfNode = 13;
    }
    if (_lineWidth == 0) {
        _lineWidth = 2.0;
    }
    if (_normalColor == nil) {
        _normalColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.00];
    }
    if (_selectionColor == nil) {
        _selectionColor = [UIColor colorWithRed:0.102 green:0.776 blue:0.263 alpha:1.00];
    }
    if (_progressColor == nil) {
        _progressColor = [UIColor colorWithRed:1.000 green:0.220 blue:0.220 alpha:1.00];
    }
    if (UIEdgeInsetsEqualToEdgeInsets(_contentInsets, UIEdgeInsetsZero)) {
        _contentInsets = UIEdgeInsetsMake(0, 2, 0, 2);
    }
    if (_showsProgressColor == NO) {
        _showsProgressColor = NO;
    }
}

#pragma mark - Override
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    // Get line length.
    CGFloat lineLength = (CGRectGetWidth(self.frame)-_contentInsets.left-_contentInsets.right-_sizeOfNode*_countOfNode)/(_countOfNode-1);
    // Get context.
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    
    CGContextSetLineWidth(context, _lineWidth);
    if (_progress == 1 && _progressColor&&_showsProgressColor) {
        CGContextSetStrokeColorWithColor(context, _progressColor.CGColor);
    } else {
        CGContextSetStrokeColorWithColor(context, _selectionColor.CGColor);
    }
    CGContextSetFillColorWithColor(context, _normalColor.CGColor);
    
    CGPoint point = CGPointMake(_sizeOfNode/2, CGRectGetHeight(self.frame)/2+_contentInsets.top);
    
    CGContextAddArc(context, point.x+_contentInsets.left, point.y, _sizeOfNode/2-_lineWidth/2, 0, 2*M_PI, 0); //添加一个圆
    CGContextClosePath(context);
    if (_progress >= 1) {
        CGContextStrokePath(context);
    } else {
        CGContextFillPath(context);
    }
    
    for (NSInteger i = 0; i < _countOfNode-1; i++) {
        CGContextMoveToPoint(context, _sizeOfNode*(i+1)+lineLength*i+_contentInsets.left, point.y);
        CGContextAddLineToPoint(context, _sizeOfNode*(i+1)+lineLength*(i+1)+_contentInsets.left, point.y);
        if (_progress > 1+i) {
            CGContextSetStrokeColorWithColor(context, _selectionColor.CGColor);
        } else {
            CGContextSetStrokeColorWithColor(context, _normalColor.CGColor);
        }
        CGContextStrokePath(context);
        if (_progress-2 == i && _progressColor&&_showsProgressColor) {
            CGContextSetStrokeColorWithColor(context, _progressColor.CGColor);
        } else {
            CGContextSetStrokeColorWithColor(context, _selectionColor.CGColor);
        }
        CGContextSetFillColorWithColor(context, _normalColor.CGColor);
        if (_progress > 1+i) {
            CGContextAddArc(context, _sizeOfNode*(i+1.5)+lineLength*(i+1)+_contentInsets.left, point.y, _sizeOfNode/2-_lineWidth/2, 0, 2*M_PI, 0);
            CGContextClosePath(context);
            CGContextStrokePath(context);
        } else {
            CGContextAddArc(context, _sizeOfNode*(i+1.5)+lineLength*(i+1)+_contentInsets.left, point.y, _sizeOfNode/2, 0, 2*M_PI, 0);
            CGContextClosePath(context);
            CGContextFillPath(context);
        }
    }
}

#pragma mark - Setters
- (void)setCountOfNode:(NSInteger)countOfNode {
    _countOfNode = countOfNode;
    [self setNeedsDisplay];
}

- (void)setProgress:(NSInteger)progress {
    _progress = MIN(progress, _countOfNode);
    [self setNeedsDisplay];
}

- (void)setSizeOfNode:(CGFloat)sizeOfNode {
    _sizeOfNode = sizeOfNode;
    [self setNeedsDisplay];
}

- (void)setSelectionColor:(UIColor *)selectionColor {
    _selectionColor = selectionColor;
    [self setNeedsDisplay];
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    _contentInsets = contentInsets;
    [self setNeedsDisplay];
}

- (void)setShowsProgressColor:(BOOL)showsProgressColor {
    _showsProgressColor = showsProgressColor;
    [self setNeedsDisplay];
}
@end
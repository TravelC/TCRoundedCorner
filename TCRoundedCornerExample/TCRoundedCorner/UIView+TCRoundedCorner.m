//
//  UIView+TCRoundedCorner.m
//  TCRoundedCornerExample
//
//  Created by Travel Chu on 15/12/21.
//  Copyright © 2015年 TravelChu. All rights reserved.
//

#import "UIView+TCRoundedCorner.h"
#import <objc/runtime.h>

static NSString *const kTCBorderLayerKey = @"kTCBorderLayerKey";
static NSString *const kTCCornerTypeKey = @"kTCCornerTypeKey";
static NSString *const kTCRadiusKey = @"kTCRadiusKey";
static NSString *const kTCObserverCountKey = @"kTCObserverCountKey";

@interface UIView ()
@property (nonatomic, strong) CAShapeLayer *tcBorderLayer;
@property (nonatomic, strong) NSNumber *tcCornerType;
@property (nonatomic, strong) NSNumber *tcRadius;
@property (nonatomic, strong) NSNumber *tcObserverCount;
@end

@implementation UIView (TCRoundedCorner)

- (void)dealloc {
    if (self.tcObserverCount && self.tcObserverCount.integerValue > 0) {
        [self removeObserver:self forKeyPath:@"frame"];
        self.tcObserverCount = @(self.tcObserverCount.integerValue-1);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"frame"]) {
        [self roundedCorner:[self.tcCornerType integerValue] radius:[self.tcRadius floatValue] borderColor:[UIColor colorWithCGColor:self.tcBorderLayer.strokeColor] borderWidth:self.tcBorderLayer.lineWidth];
    }
}

- (void)setTcBorderLayer:(CAShapeLayer *)tcBorderLayer {
    objc_setAssociatedObject(self, &kTCBorderLayerKey, tcBorderLayer, OBJC_ASSOCIATION_RETAIN);
}

- (CAShapeLayer *)tcBorderLayer {
    return objc_getAssociatedObject(self, &kTCBorderLayerKey);
}

- (void)setTcObserverCount:(NSNumber *)tcObserverCount {
    objc_setAssociatedObject(self, &kTCObserverCountKey, tcObserverCount, OBJC_ASSOCIATION_RETAIN);
}

- (CAShapeLayer *)tcObserverCount {
    return objc_getAssociatedObject(self, &kTCObserverCountKey);
}

- (void)setTcCornerType:(NSNumber *)tcCornerType {
    objc_setAssociatedObject(self, &kTCCornerTypeKey, tcCornerType, OBJC_ASSOCIATION_RETAIN);
}

- (CAShapeLayer *)tcCornerType {
    return objc_getAssociatedObject(self, &kTCCornerTypeKey);
}

- (void)setTcRadius:(NSNumber *)tcRadius {
    objc_setAssociatedObject(self, &kTCRadiusKey, tcRadius, OBJC_ASSOCIATION_RETAIN);
}

- (CAShapeLayer *)tcRadius {
    return objc_getAssociatedObject(self, &kTCRadiusKey);
}

- (CAShapeLayer *)shapeLayerWithCornerType:(TCRoundedCornerType)cornerType radius:(CGFloat)radius {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (self.tcObserverCount) {
            self.tcObserverCount = @(self.tcObserverCount.integerValue+1);
        } else {
            self.tcObserverCount = @(1);
        }
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    });
    self.tcCornerType = @(cornerType);
    self.tcRadius = @(radius);

    CAShapeLayer *cornerLayer = [CAShapeLayer layer];

    CGRect bounds = self.bounds;
    CGSize cornerRadii = CGSizeMake(radius, radius);
    UIBezierPath *bPath;
    switch (cornerType) {
        case TCRoundedCornerTypeTopLeft:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerTopLeft
                                                cornerRadii:cornerRadii];
        }
            break;

        case TCRoundedCornerTypeTopRight:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerTopRight
                                                cornerRadii:cornerRadii];
        }
            break;
        case TCRoundedCornerTypeTop:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                cornerRadii:cornerRadii];
        }
            break;
        case TCRoundedCornerTypeBottomLeft:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerBottomLeft
                                                cornerRadii:cornerRadii];
        }
            break;
        case TCRoundedCornerTypeBottomRight:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerBottomRight
                                                cornerRadii:cornerRadii];
        }
            break;
        case TCRoundedCornerTypeBottom:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                cornerRadii:cornerRadii];
        }
            break;
        case TCRoundedCornerTypeLeft:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                                cornerRadii:cornerRadii];
        }
            break;
        case TCRoundedCornerTypeRight:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                cornerRadii:cornerRadii];
        }
            break;
        default:
        {
            bPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                          byRoundingCorners:UIRectCornerAllCorners
                                                cornerRadii:cornerRadii];
        }
            break;
    }
    cornerLayer.frame = bounds;
    cornerLayer.path = bPath.CGPath;
    return cornerLayer;
}

- (void)roundedCorner:(TCRoundedCornerType)cornerType radius:(CGFloat)radius {
    CAShapeLayer *maskLayer = [self shapeLayerWithCornerType:cornerType radius:radius];
    self.layer.mask = maskLayer;
}

- (void)roundedCorner:(TCRoundedCornerType)cornerType
               radius:(CGFloat)radius
          borderColor:(UIColor *)borderColor
          borderWidth:(CGFloat)borderWidth {
    [self roundedCorner:cornerType radius:radius];
    if (self.tcBorderLayer) {
        [self.tcBorderLayer removeFromSuperlayer];
        self.tcBorderLayer = nil;
    }
    self.tcBorderLayer = [self shapeLayerWithCornerType:cornerType radius:radius];
    self.tcBorderLayer.lineWidth = borderWidth;
    self.tcBorderLayer.strokeColor = borderColor.CGColor;
    self.tcBorderLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.tcBorderLayer];
}

- (void)addBorderWithColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)removeBorder {
    if (self.tcBorderLayer) {
        [self.tcBorderLayer removeFromSuperlayer];
    }
    if (self.layer.borderWidth > 0.0) {
        self.layer.borderWidth = 0.0;
    }
}

@end

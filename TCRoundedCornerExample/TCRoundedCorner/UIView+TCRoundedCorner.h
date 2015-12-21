//
//  UIView+TCRoundedCorner.h
//  TCRoundedCornerExample
//
//  Created by Travel Chu on 15/12/21.
//  Copyright © 2015年 TravelChu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM (NSUInteger, TCRoundedCornerType) {
    TCRoundedCornerTypeTopLeft,
    TCRoundedCornerTypeTopRight,
    TCRoundedCornerTypeBottomLeft,
    TCRoundedCornerTypeBottomRight,

    TCRoundedCornerTypeTop,
    TCRoundedCornerTypeBottom,
    TCRoundedCornerTypeLeft,
    TCRoundedCornerTypeRight,

    TCRoundedCornerTypeAllCorners
};


@interface UIView (TCRoundedCorner)
/**
 *  Round the view's specified corner(s) with specified radius
 *
 *  @param cornerType which corner should be rounded, see TCRoundedCornerType for detail
 *  @param radius     radius of corner
 */
-(void)roundedCorner:(TCRoundedCornerType)cornerType
              radius:(CGFloat)radius;

/**
 *  Round the view's specified corner(s) with specified radius, Also apply a border with specified color and width.
 *
 *  @param cornerType  which corner should be rounded, see TCRoundedCornerType for detail
 *  @param radius      radius of corner
 *  @param borderColor color of border
 *  @param borderWidth with of border
 */
-(void)roundedCorner:(TCRoundedCornerType)cornerType
              radius:(CGFloat)radius
         borderColor:(UIColor *)borderColor
         borderWidth:(CGFloat)borderWidth;

/**
 *  add border to view with specified color and width.
 *
 *  @param borderColor color of border
 *  @param borderWidth with of border
 */
-(void)addBorderWithColor:(UIColor *)borderColor
              borderWidth:(CGFloat)borderWidth;

/**
 *  remove border add by this class(also will remove some border added by other class if they just change self.layer.borderWidth).
 */
-(void)removeBorder;
@end

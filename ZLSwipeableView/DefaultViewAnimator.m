//
//  DefaultViewAnimator.m
//  ZLSwipeableViewDemo
//
//  Created by Zhixuan Lai on 10/25/15.
//  Copyright © 2015 Zhixuan Lai. All rights reserved.
//

#import "DefaultViewAnimator.h"

@implementation DefaultViewAnimator

- (CGFloat)degreesToRadians:(CGFloat)degrees {
    return degrees * M_PI / 180;
}

- (CGFloat)radiansToDegrees:(CGFloat)radians {
    return radians * 180 / M_PI;
}

- (void)rotateView:(UIView *)view
         forDegree:(float)degree
          duration:(NSTimeInterval)duration
atOffsetFromCenter:(CGPoint)offset
     swipeableView:(ZLSwipeableView *)swipeableView {
    float rotationRadian = [self degreesToRadians:degree];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                       view.center = [swipeableView convertPoint:swipeableView.center
                                                        fromView:swipeableView.superview];
                       CGAffineTransform transform =
                           CGAffineTransformMakeTranslation(offset.x, offset.y);
                       transform = CGAffineTransformRotate(transform, rotationRadian);
                       transform = CGAffineTransformTranslate(transform, -offset.x, -offset.y);
                       view.transform = transform;
                     }
                     completion:nil];
}

- (void)zoomView:(UIView *)view
         forScale:(float)scale
          duration:(NSTimeInterval)duration
atOffsetFromCenter:(CGPoint)offset
     swipeableView:(ZLSwipeableView *)swipeableView {
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         view.center = [swipeableView convertPoint:swipeableView.center
                                                          fromView:swipeableView.superview];
                         CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
                         transform = CGAffineTransformTranslate(transform, offset.x, offset.y);
                         view.transform = transform;
                     }
                     completion:nil];
}

- (void)animateView:(UIView *)view
              index:(NSUInteger)index
              views:(NSArray<UIView *> *)views
      swipeableView:(ZLSwipeableView *)swipeableView {
    CGFloat scale = powf(0.96, (CGFloat)(index));
    NSTimeInterval duration = 0.4;
    CGPoint offset = CGPointMake(0, (view.bounds.size.height*(1.0-scale))/2.0 + 8.0*(CGFloat)index); // real offset is 5.0
    switch (index) {
    case 0:
            [self zoomView:view
                     forScale:scale
                      duration:duration
            atOffsetFromCenter:offset
                 swipeableView:swipeableView];
        break;
    case 1:
        [self zoomView:view
                     forScale:scale
                      duration:duration
            atOffsetFromCenter:offset
                 swipeableView:swipeableView];
        break;
    case 2:
        [self zoomView:view
                     forScale:scale
                      duration:duration
            atOffsetFromCenter:offset
                 swipeableView:swipeableView];
        break;
    case 3:
        [self zoomView:view
                     forScale:scale
                      duration:duration
            atOffsetFromCenter:offset
                 swipeableView:swipeableView];
        break;
    default:
        break;
    }
}


@end

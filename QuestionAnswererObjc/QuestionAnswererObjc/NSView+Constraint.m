//
//  NSView+Constraint.m
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/1/24.
//

#import <Cocoa/Cocoa.h>


@implementation NSView (Constraint)

- (void) pinToCenterOf: (NSView *) view {
    [NSLayoutConstraint activateConstraints: @[
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
    ]];
}

- (void)pinTo:(NSView *)view {
    [self pinTo:view top:0 bottom:0 leading:0 trailing:0];
}

- (void) pinTo: (NSView *) view top: (CGFloat) top bottom: (CGFloat) bottom leading: (CGFloat) leading trailing: (CGFloat) trailing {
    [NSLayoutConstraint activateConstraints: @[
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:leading],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:trailing],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:top],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom]
    ]];
}

- (void) setWidth: (CGFloat) width height: (CGFloat) height; {
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0 constant:width],
        [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:height]
    ]];
}

@end

//
//  QuestionCell.m
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/1/24.
//

#import <Cocoa/Cocoa.h>
#import "QuestionCell.h"
#import "NSView+Constraint.h"

@implementation QuestionCell {
    NSTextField *textField;
    NSImageView *iconView;
    NSStackView *stackView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    [self setupLayout];
    return self;
}

-(void) setupLayout {
    stackView = [[NSStackView alloc]init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:stackView];
    
    [stackView pinTo: self];
    
    iconView = [[NSImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    iconView.image = [NSImage imageWithSystemSymbolName:@"circle" accessibilityDescription:nil];
    [stackView addArrangedSubview:iconView];
    
    textField = [[NSTextField alloc]init];
    textField.backgroundColor = NSColor.clearColor;
    [textField setEditable:NO];
    [textField setBezeled:NO];
    [stackView addArrangedSubview:textField];
    [iconView setWidth:30 height:30];
}

-(void) setTitle:(NSString *)string selected:(BOOL)selected {
    textField.stringValue = string;
    iconView.image = [NSImage imageWithSystemSymbolName: selected ? @"circle.fill" : @"circle" accessibilityDescription:nil];
    
}

@end

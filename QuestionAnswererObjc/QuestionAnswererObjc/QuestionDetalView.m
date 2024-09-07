//
//  QuestionDetalView.m
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/2/24.
//

#import <Foundation/Foundation.h>
#import "QuestionDetailView.h"
#import "NSView+Constraint.h"

@implementation QuestionDetailView {
    NSTextField* textField;
    NSStackView *stackView;
    NSMutableArray<NSButton *> *buttons;
    NSString *questionID;
    NSInteger index;
}

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->buttons = [[NSMutableArray alloc] init];
    }
    [self setup];
    return self;
}

-(void) setup {
    stackView = [[NSStackView alloc] init];
    stackView.spacing = 10;
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:stackView];
    [stackView pinToCenterOf:self];
    
    textField = [[NSTextField alloc]init];
    textField.backgroundColor = NSColor.clearColor;
    [textField setEditable:NO];
    [textField setBezeled:NO];
    [stackView addArrangedSubview:textField];
    
    [stackView setHidden:YES];
    
    for (int i = 0 ; i < 4; i++)
    [self addButton];
    
}

- (void)setQuestion:(Question *)question withIndex: (NSInteger) index answered: (NSUInteger) answered {
    textField.stringValue = question.question;
    [stackView setHidden:NO];
    questionID = question.id;
    self->index = index;
    
    for (int i = 0 ; i < 4; i++) {
        [buttons[i] setTitle: question.answers[i]];
        [buttons[i] setState:0];
    }
    if (answered >0 && answered < 4) {
        [buttons[answered] setState:1];
    }
}

-(void) addButton {
    NSButton* button = [[NSButton alloc]init];
    [button setButtonType:NSButtonTypeRadio];
    [button setAction:@selector(answerSelected)];
    [button setTarget:self];
    [stackView addArrangedSubview:button];
    
    [buttons addObject:button];
}

-(void) answerSelected {
    NSInteger answerIndex = [buttons indexOfObjectPassingTest:^BOOL(NSButton * button, NSUInteger idx, BOOL * stop) {
        return button.state == 1;
    }];
    [delegate questionAnswered:answerIndex witID:questionID index:index];
}

@end

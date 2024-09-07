//
//  ResultView.m
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/6/24.
//
@import QuestionKitObjc;
#import "ResultViewController.h"
#import "NSView+Constraint.h"

@implementation ResultViewController {
    NSTextField* textField;
    NSStackView *stackView;
    NSImageView *imageView;
    NSButton *confirmButton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->stackView = [[NSStackView alloc] init];
        self->textField = [[NSTextField alloc]init];
        self->imageView = [[NSImageView alloc]init];
        self->confirmButton = [[NSButton alloc]init];
    }
    return self;
}

-(void) setResult: (ExamResult *) result {
    if (result.passed) {
        imageView.image = [NSImage imageWithSystemSymbolName:@"checkmark.seal" accessibilityDescription:nil];
        textField.stringValue = @"Yay! you've succeed at the exam!";
    }else {
        imageView.image = [NSImage imageWithSystemSymbolName:@"x.circle.fill" accessibilityDescription:nil];
        textField.stringValue = @"Oh no! you've failed the exam! please try again.";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void) setup {
    
    stackView.spacing = 20;
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stackView];
    [stackView pinToCenterOf:self.view];
    
    [imageView setImageScaling:NSImageScaleProportionallyUpOrDown];
    
    textField.backgroundColor = NSColor.clearColor;
    [textField setEditable:NO];
    [textField setBezeled:NO];
    
    [confirmButton setAction:@selector(confirmTapped)];
    [confirmButton setTarget:self];
    [confirmButton setTitle:@"OK"];
    
    [stackView addArrangedSubview:imageView];
    [stackView addArrangedSubview:textField];
    [stackView addArrangedSubview:confirmButton];
    
    [imageView setWidth:100 height:100];
}

-(void) confirmTapped {
    [self dismissViewController:self];
}



@end

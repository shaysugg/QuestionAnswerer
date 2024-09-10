//
//  QuestionView.h
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/2/24.
//

#import "Cocoa/Cocoa.h"
#import "QuestionDetailView.h"
#ifndef QuestionView_h
#define QuestionView_h

@protocol QuestionViewDelegate
-(void) submitButtonTapped;
@end

@interface QuestionView : NSView <NSTableViewDelegate, NSTableViewDataSource, QuestionViewDetailDelegate>

@property(weak, nonatomic) id <QuestionViewDetailDelegate, QuestionViewDelegate> delegate;
-(void) bindAnswers: (NSDictionary<NSString *, NSNumber *> *) answers;

-(void) setup;
-(void) reloadQuestions: (NSArray *)questions;
-(void) questionLoadFailed: (NSError*) error;
-(void) reset;

@end



#endif /* QuestionView_h */

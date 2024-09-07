//
//  QuestionDetailView.h
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/2/24.
//
@import QuestionKitObjc;
#import "Cocoa/Cocoa.h"

#ifndef QuestionDetailView_h
#define QuestionDetailView_h

@protocol QuestionViewDetailDelegate

-(void) questionAnswered:(NSInteger) answer witID: (NSString *) questionID index: (NSInteger) index;

@end

@interface QuestionDetailView : NSView

@property(weak, nonatomic) id <QuestionViewDetailDelegate> delegate;
- (void)setQuestion:(Question *)question withIndex: (NSInteger) index answered: (NSUInteger) answered;

@end




#endif /* QuestionDetailView_h */

//
//  ViewController.h
//  QuestionAnswererObjc
//
//  Created by Shayan on 8/31/24.
//

#import <Cocoa/Cocoa.h>
#import "QuestionDetailView.h"
#import "QuestionView.h"

@interface ViewController : NSViewController


@end

@interface ViewController (TableView) <NSTableViewDelegate, NSTableViewDataSource, QuestionViewDetailDelegate, QuestionViewDelegate>

@end

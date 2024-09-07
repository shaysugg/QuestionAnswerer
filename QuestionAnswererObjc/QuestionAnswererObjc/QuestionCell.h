//
//  QuestionCell.h
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/1/24.
//

#import <Cocoa/Cocoa.h>

#ifndef QuestionCell_h
#define QuestionCell_h

@interface QuestionCell : NSTableCellView

-(void) setTitle: (NSString *) string selected: (BOOL) selected;

@end

#endif /* QuestionCell_h */

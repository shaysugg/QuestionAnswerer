//
//  NSView+Constraint.h
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/1/24.
//

#ifndef NSView_Constraint_h
#define NSView_Constraint_h

@interface NSView (Constraint)
- (void) pinToCenterOf: (NSView *) view;
- (void) pinTo: (NSView *) view;
- (void) pinTo: (NSView *) view top: (CGFloat) top bottom: (CGFloat) bottom leading: (CGFloat) leading trailing: (CGFloat) trailing;
- (void) setWidth: (CGFloat) width height: (CGFloat) height;
@end


#endif /* NSView_Constraint_h */

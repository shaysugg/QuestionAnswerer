//
//  QuestionView.m
//  QuestionAnswererObjc
//
//  Created by Shayan on 9/2/24.
//

@import QuestionKitObjc;
#import <Foundation/Foundation.h>
#import "QuestionView.h"
#import "NSView+Constraint.h"
#import "QuestionCell.h"
#import "QuestionDetailView.h"

@implementation QuestionView {
    NSSplitView *sv;
    NSTableView *tableView;
    QuestionDetailView *detailView;
    NSButton *submitButton;
    NSArray<Question *> *questions;
    NSMutableIndexSet *answeredQuestionsIndexes;
    NSDictionary<NSString *, NSNumber *> *answeredQuestions;
}

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->answeredQuestionsIndexes = [[NSMutableIndexSet alloc] init];
    }
    return self;
}

-(void) bindAnswers: (NSDictionary<NSString *, NSNumber *> *) answers {
    answeredQuestions = answers;
}

-(void)setup {
    [self addSplitView];
    [self addQuestionList];
    [self addQuestionView];
    [self addSubmitView];
    detailView.delegate = self;
}

-(void) addSplitView {
    sv = [[NSSplitView alloc] init];
    
    sv.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:sv];
    [sv setVertical:YES];
    [sv pinTo:self top:0 bottom:-40 leading:0 trailing:0];
    
}

-(void) addQuestionList {
    NSScrollView *scrollView = [[NSScrollView alloc] init];
    scrollView.hasVerticalRuler = YES;
    tableView = [[NSTableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"Question"];
    column.title = @"Questions";
    column.width = 200;
    [tableView addTableColumn:column];
    
    NSTableHeaderView *header = [[NSTableHeaderView alloc] init];
    [tableView setHeaderView:header];
    
    [scrollView setDocumentView:tableView];
    [sv addArrangedSubview:scrollView];
    [scrollView setFrameSize:NSMakeSize(200, 100)]; //hacky!
}

-(void) addQuestionView {
    detailView = [[QuestionDetailView alloc]init];
    
    [sv addArrangedSubview:detailView];
    [detailView setFrameSize:NSMakeSize(200, 100)]; //hacky!
}

-(void) addSubmitView {
    submitButton = [[NSButton alloc] init];
    submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [submitButton setTitle:@"Submit"];
    [submitButton setEnabled:NO];
    [submitButton setAction:@selector(submitButtonTapped)];
    [submitButton setTarget:self];
    
    [self addSubview:submitButton];
    [NSLayoutConstraint activateConstraints: @[
        [NSLayoutConstraint constraintWithItem:submitButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-10],
        [NSLayoutConstraint constraintWithItem:submitButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:-30],
    ]];
    
}

- (void)reloadQuestions:(NSArray *)qs {
    questions = qs;
    [tableView reloadData];
}

- (void)questionLoadFailed:(NSError *)error {
    //TODO:
}

-(void) reset {
    [answeredQuestionsIndexes removeAllIndexes];
    [tableView reloadData];
    [detailView setQuestion:questions[0] withIndex:0 answered:0];
}

-(void) questionAnswered:(NSInteger) answer witID: (NSString *) questionID index: (NSInteger) index {
    [delegate questionAnswered:answer witID:questionID index:index];
    [answeredQuestionsIndexes addIndex:index];
    
    NSIndexSet *refreshRow = [[NSIndexSet alloc] initWithIndex:index];
    NSIndexSet *refreshColumn = [[NSIndexSet alloc] initWithIndex:0];
    [tableView reloadDataForRowIndexes:refreshRow columnIndexes:refreshColumn];
    [submitButton setEnabled: answeredQuestions.count == questions.count];
}

-(void) submitButtonTapped {
    [delegate submitButtonTapped];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return questions.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    QuestionCell *cell = [[QuestionCell alloc]init];
    Question *q = questions[row];
    BOOL selected = [answeredQuestionsIndexes containsIndex:row];
    [cell setTitle:q.question selected:selected];
    return cell;
    
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 30;
}

- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    NSTableRowView *rowView = [[NSTableRowView alloc]init];
    rowView.backgroundColor = NSColor.redColor;
    return rowView;
}


- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    Question *question = questions[tableView.selectedRow];
    [detailView setQuestion:question withIndex:tableView.selectedRow answered:answeredQuestions[question.id].integerValue];
}

@end

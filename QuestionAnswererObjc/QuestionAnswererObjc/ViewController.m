//
//  ViewController.m
//  QuestionAnswererObjc
//
//  Created by Shayan on 8/31/24.
//

@import QuestionKitObjc;
#import "Foundation/Foundation.h"
#import "ViewController.h"
#import "QuestionView.h"
#import "ResultViewController.h"
#import "NSView+Constraint.h"


@implementation ViewController {
    QuestionView *rootView;
    NSArray<Question *> *questions;
    NSMutableDictionary<NSString *, NSNumber *> *answers;
    NSString * doneToolbarID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadQuestions];
    rootView.delegate = self;
    
    answers = [NSMutableDictionary dictionary];
    [rootView bindAnswers:answers];
    
}

- (void)loadView {
    rootView = [[QuestionView alloc] init];
    self.view = rootView;
    [rootView setup];
}

-(void) resetExam {
    [answers removeAllObjects];
    [rootView reset];
}

- (void)questionAnswered:(NSInteger)answer witID:(NSString *) questionID index:(NSInteger)index {
    answers[questionID] = [[NSNumber alloc] initWithLong: answer];
    NSLog(@"%@", answers);
}

- (void)submitButtonTapped {
    ExamResult *result = [ExamResult fromQuestions:questions answers:answers error:nil passedCondition:^BOOL(NSInteger correct, NSInteger total) {
        return correct > total / 2;
    }];
    
    ResultViewController *resultVC = [[ResultViewController alloc] init];
    [resultVC setResult:result];
    [self presentViewControllerAsSheet:resultVC];
    if (!result.passed) {
        [self resetExam];
    }
}

-(void) loadQuestions {
    //For the education purposesReading data manually is implemented and not used the package reading process
    NSURL *url = [[NSURL alloc] initWithString:@"http://127.0.0.1:8090/api/collections/questions/records"];
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *res, NSError *error) {
        //FIXME: weak self
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->rootView questionLoadFailed:error];
                [self presentError:error];
                
            });
            return;
        }
        
        NSError *decodingError;
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&decodingError];
        
        if (decodingError != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentError:error];
                return;
            });
        }
        NSArray* items = json[@"items"];
        NSMutableArray<Question *> *questions = [[NSMutableArray alloc] init];
        for (id item in items) {
            [questions addObject:[Question fromJsonData:item]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self->questions = questions;
            [self->rootView reloadQuestions:questions];
        });
    }];
    
    [task resume];
}


@end




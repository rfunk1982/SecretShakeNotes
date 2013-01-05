//
//  ViewController.m
//  SecretShakeNotes
//
//  Created by Ricardo Funk on 12/3/12.
//  Copyright (c) 2012 Ricardo Funk. All rights reserved.
//  www.ideveloperblog.com

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Notes View --------------------------
    _notesView = [[UIView alloc] initWithFrame:CGRectMake(17, -220, 290, 180)];
    _notesView.backgroundColor = [UIColor whiteColor];
    
    //Notes Textfield ---------------------
    _notesTextField = [[UITextView alloc] initWithFrame:CGRectMake(10, 20, 265, 142)];
    _notesTextField.font = [UIFont fontWithName:@"Courier New" size:20];
    _notesTextField.editable = YES;
    _notesTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //Add Textfield to view 
    [_notesView addSubview:_notesTextField];
    //Add NotesView to MainView
    [self.view addSubview:_notesView];


}

//We become first responders
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

//When the shake ends, we'll execute an action
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    if (event.type == UIEventSubtypeMotionShake)
    {
        //Show or hide notes
        [self showHideNotes];
    }
    
}

//Show/Hide notes method
-(void)showHideNotes
{
    //We add the begin animation to make the show/hide smoother..
    [UIView beginAnimations:@"myName" context:nil];
    [UIView setAnimationDuration:0.5];
        
        if (_toggle == YES)
        {
            //Move notes view off-screen
            _notesView.center = CGPointMake(160, -180);
            //Set the BOOL
            _toggle = NO;
            //Resign first responder (hide keyboard)
            [_notesTextField resignFirstResponder];
          
            
        } else
        {
            //Move notes view so we can see it on-screen
            _notesView.center = CGPointMake(160, 70);
            //Set the BOOL
            _toggle = YES;
            //Become first responder (show keyboard)
            [_notesTextField becomeFirstResponder];
            
            
        }
    //Always commit animations
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

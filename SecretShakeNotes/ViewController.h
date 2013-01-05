//
//  ViewController.h
//  SecretShakeNotes
//
//  Created by Ricardo Funk on 12/3/12.
//  Copyright (c) 2012 Ricardo Funk. All rights reserved.
//  www.ideveloperblog.com

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) UIView *notesView;
@property (nonatomic,strong) UITextView *notesTextField;
@property (nonatomic) BOOL toggle;

@end

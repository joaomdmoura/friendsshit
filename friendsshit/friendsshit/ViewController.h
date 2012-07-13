//
//  ViewController.h
//  friendsshit
//
//  Created by João Moura on 6/5/12.
//  Copyright (c) 2012 D3TR1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource> {
    UITableView * tableView;
    NSArray * results;
    UIImageView *top_bg;
    UIImageView *input_image;
    UIImageView *input_image_name;
    UIButton *friends_name;
    UIButton *friends_profile;
    UITextField *friends_shit;
    UITextField *friends_shit_name;
    UIButton *publish_btn;
    BOOL adding;
}

@end

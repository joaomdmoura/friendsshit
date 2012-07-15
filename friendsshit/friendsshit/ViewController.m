//
//  ViewController.m
//  friendsshit
//
//  Created by João Moura on 6/5/12.
//  Copyright (c) 2012 D3TR1. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "EGOImageView.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    UIImage *logo_img = [UIImage imageNamed:@"logo.png"];
    UIImageView *logo=[[UIImageView alloc] initWithImage:logo_img];
    logo.alpha=0;
    logo.center = CGPointMake(160, 80);
    
    UIImage *top_img = [UIImage imageNamed:@"bigger_top_bg.png"];
    top_bg=[[UIImageView alloc] initWithImage:top_img];
    top_bg.alpha=0;
    top_bg.center = CGPointMake(160, -10);
    
    UIButton *plus = [UIButton new];
    [plus setFrame:CGRectMake(18, 71, 33, 30)];
    [plus setImage:[UIImage imageNamed:@"plus_btn.png"] forState:UIControlStateNormal];
    [plus setAlpha:100];
    [plus addTarget:self action:@selector(newPost) forControlEvents:UIControlEventTouchUpInside];
    
    publish_btn = [UIButton new];
    [publish_btn setFrame:CGRectMake(35, 205, 238, 41)];
    [publish_btn setImage:[UIImage imageNamed:@"publish_btn.png"] forState:UIControlStateNormal];
    [publish_btn setAlpha:0];
    [publish_btn addTarget:self action:@selector(publishPostWithOutFacebook) forControlEvents:UIControlEventTouchUpInside];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 110, 290, 348)];
    [tableView setSeparatorColor:[UIColor clearColor]];
    tableView.rowHeight = 135;
    [tableView setDataSource:self];
    
    friends_name = [UIButton new];
    [friends_name setFrame:CGRectMake(33, 175, 109, 128)];
    [friends_name setImage:[UIImage imageNamed:@"friends_name.png"] forState:UIControlStateNormal];
    [friends_name setAlpha:0];
    [friends_name addTarget:self action:@selector(PostWithOutFacebook) forControlEvents:UIControlEventTouchUpInside];
    
    friends_profile = [UIButton new];
    [friends_profile setFrame:CGRectMake(180, 175, 109, 128)];
    [friends_profile setImage:[UIImage imageNamed:@"friends_profile.png"] forState:UIControlStateNormal];
    [friends_profile setAlpha:0];
    [friends_profile addTarget:self action:@selector(PostWithFacebook) forControlEvents:UIControlEventTouchUpInside];
    
    friends_shit = [UITextField new];
    [friends_shit setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [friends_shit setPlaceholder:@"Post your Friends' shit here"];
    [friends_shit setFrame:CGRectMake(20, 125, 285, 42)];
    [friends_shit setTextColor: [UIColor grayColor ]];
    [friends_shit setBackground:nil];
    [friends_shit setAlpha:0];
    
    UIImage *bg_input_image = [UIImage imageNamed:@"input_field.png"];
    input_image =[[UIImageView alloc] initWithImage:bg_input_image];
    input_image.alpha=0;
    input_image.center = CGPointMake(160, 135);

    friends_shit_name = [UITextField new];
    [friends_shit_name setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [friends_shit_name setPlaceholder:@"Friends Name"];
    [friends_shit_name setFrame:CGRectMake(20, 170, 285, 42)];
    [friends_shit_name setTextColor: [UIColor grayColor ]];
    [friends_shit_name setBackground:nil];
    [friends_shit_name setAlpha:0];
    
    UIImage *bg_input_image_name = [UIImage imageNamed:@"input_field.png"];
    input_image_name =[[UIImageView alloc] initWithImage:bg_input_image_name];
    input_image_name.alpha=0;
    input_image_name.center = CGPointMake(160, 180);

    
    [[self view] addSubview:tableView];
    [[self view] addSubview:top_bg];
    [[self view] addSubview:logo];
    [[self view] addSubview:plus];
    [[self view] addSubview:friends_name];
    [[self view] addSubview:friends_profile];
    [[self view] addSubview:input_image];
    [[self view] addSubview:friends_shit];
    [[self view] addSubview:input_image_name];
    [[self view] addSubview:friends_shit_name];
    [[self view] addSubview:publish_btn];
    
    [UIView animateWithDuration:1 animations:^{
        [logo setFrame:(CGRect){{20, 20}, logo.frame.size}];
        [logo setAlpha:100];
        [top_bg setAlpha:100];
    }];
    adding = FALSE;
}

- (void) newPost {
    if (adding == TRUE) {
        [friends_name setAlpha:0];
        [friends_profile setAlpha:0];
        [friends_shit setAlpha:0];
        [input_image setAlpha:0];
        [friends_shit_name setAlpha:0];
        [input_image_name setAlpha:0];
        [publish_btn setAlpha:0];
        [UIView animateWithDuration:1 animations:^{
            [top_bg setFrame:(CGRect){{0, -145}, top_bg.frame.size}];
        }];
        adding = FALSE;
    }
    else {
        [UIView animateWithDuration:1 animations:^{
            [top_bg setFrame:(CGRect){{0, 60}, top_bg.frame.size}];
            [friends_name setAlpha:100];
            [friends_profile setAlpha:100];
            [friends_shit setAlpha:100];
            [input_image setAlpha:100];
        }];
        adding = TRUE;
    }
}

- (void) PostWithOutFacebook {
    [friends_name setAlpha:0];
    [friends_profile setAlpha:0];
    [UIView animateWithDuration:1 animations:^{
        [top_bg setFrame:(CGRect){{0, 0}, top_bg.frame.size}];
        [friends_shit_name setAlpha:100];
        [input_image_name setAlpha:100];
        [publish_btn setAlpha:100];
    }];
}

- (void) publishPostWithOutFacebook {
    
//    NSString * data = [[NSString alloc ] initWithFormat:@"http://friendsshit.com/api/create_shit?shit=%@", friends_shit.text ];
//
//    NSURL * url = [NSURL URLWithString:data];
//    NSData *jsonData = [NSData dataWithContentsOfURL:url];
//
//    results = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//    
//    [tableView reloadData];

}

- (void) PostWithFacebook {

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [results count];
}
#define TAG_USER_IMG 700
#define TAG_USER_PHRASE 600
#define TAG_USER_LOCATION 500

- (UITableViewCell *)tableView:(UITableView *)localTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"Shit";
    UITableViewCell * cell = [localTableView dequeueReusableCellWithIdentifier:identifier];
    EGOImageView *user_img;
    UILabel *phrase;
    UILabel *location;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        user_img=[[EGOImageView alloc] init];
        user_img.frame = (CGRect){{12, 17}, 100, 100};
        [user_img.layer setBorderColor: [[UIColor grayColor] CGColor]];
        [user_img.layer setBorderWidth: 1.0];
        user_img.layer.cornerRadius = 5.0;
        [user_img setTag:TAG_USER_IMG];
        
        phrase = [[UILabel alloc] initWithFrame:CGRectMake(120, -22, 173, 122) ];
        [phrase setFont:[UIFont fontWithName:@"HelveticaNeue" size:12.4]];
        [phrase setTextColor: [UIColor colorWithRed:0x4b/255.0f
                                              green:0x30/255.0f
                                               blue:0x28/255.0f alpha:1]];
        [phrase setNumberOfLines:0];
        [phrase setBackgroundColor: [UIColor clearColor] ];
        [phrase setTag:TAG_USER_PHRASE];
        
        location = [[UILabel alloc] initWithFrame:CGRectMake(120, 195, 100, 100) ];
        [location setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
        [location setTextColor: [UIColor grayColor ]];
        [location setBackgroundColor: [UIColor clearColor] ];
        [location setTag:TAG_USER_LOCATION];
        
        UIImage *post_img = [UIImage imageNamed:@"post_bg.png"];
        UIImageView *post=[[UIImageView alloc] initWithImage:post_img];
        post.frame = (CGRect){{0, 6}, post.frame.size};
        

        [cell addSubview:post];
        [cell addSubview:phrase];
        [cell addSubview:location];
        [cell addSubview:user_img];
        
    } else {
        user_img = (EGOImageView *) [cell viewWithTag:TAG_USER_IMG];
        phrase = (UILabel *) [cell viewWithTag:TAG_USER_PHRASE ];
        location = (UILabel *) [cell viewWithTag:TAG_USER_LOCATION ];
    }
    
    NSDictionary * item = [results objectAtIndex:indexPath.row];
    NSString *s_phrase = [NSString stringWithFormat:@"\"%@\" - %@", [item objectForKey:@"phrase"], [item objectForKey:@"name"]];
    NSString *s_location = [item objectForKey:@"location"];
    NSString *i_photo_url = [item objectForKey:@"photo_url"];
    
    [phrase setText:s_phrase];
    [location setText:s_location];
    
    NSString *s_photo_url = [NSString stringWithFormat:@"http://www.friendsshit.com%@", i_photo_url];
    NSURL * imageURL = [NSURL URLWithString:s_photo_url];
    [user_img setImageURL:imageURL];
    
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL * url = [NSURL URLWithString:@"http://friendsshit.com/api/shits/get"];

    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    results = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    [tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

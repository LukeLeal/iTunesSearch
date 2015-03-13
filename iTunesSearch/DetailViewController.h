//
//  DetailViewController.h
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Filme.h"
#import "Musica.h"
#import "Podcast.h"
#import "EBook.h"
#import "Midia.h"

@interface DetailViewController : UIViewController
@property (nonatomic, strong) Midia *midia;

@end

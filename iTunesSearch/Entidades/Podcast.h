//
//  Podcast.h
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 11/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Midia.h"


@interface Podcast : Midia

@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *genero;
@property (nonatomic, strong) NSString *colecao;

@end

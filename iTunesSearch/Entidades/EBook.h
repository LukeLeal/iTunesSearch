//
//  EBook.h
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 11/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Midia.h"


@interface EBook : Midia

@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *duracao;
@property (nonatomic, strong) NSString *fileSize;
@property (nonatomic, strong) NSString *media;



@end

//
//  Musica.h
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 14/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Midia.h"

@interface Musica : Midia

@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *duracao;
@property (nonatomic, strong) NSString *colecao;

@end

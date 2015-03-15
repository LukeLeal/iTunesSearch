//
//  Midia.h
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Midia : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *artista;
@property (nonatomic, strong) NSString *preco;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *image60;

- (void) converteImagem: (NSString *)s full:(bool)f;

@end

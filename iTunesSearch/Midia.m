//
//  Midia.m
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Midia.h"

@implementation Midia

- (void) converteImagem: (NSString *)s full:(bool)f{
    NSURL *url = [[NSURL alloc] initWithString:s];
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    if (f) {
        _image = [[UIImage alloc] initWithData:data];
    } else {
        _image60 = [[UIImage alloc] initWithData:data];
    }
}

@end

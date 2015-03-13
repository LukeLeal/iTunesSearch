//
//  DetailViewController.m
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *artista;
@property (weak, nonatomic) IBOutlet UILabel *preco;

@end

@implementation DetailViewController

- (void) viewWillAppear:(BOOL)animated{
    self.nome.text = [NSString stringWithFormat:@"Nome: %@", _midia.nome];
    self.artista.text = [NSString stringWithFormat:@"Artista: %@", _midia.artista];
    self.preco.text = [NSString stringWithFormat:@"Preço %@", _midia.preco];
    //[NSString stringWithFormat:@" %@",];
    /*if([_midia isMemberOfClass:[Filme class]]){
        Filme *filme = (Filme *) self.midia;
        //self.nome.text = [NSString stringWithFormat:@"Nome: %@",filme.nome];
    } else if ([_midia isMemberOfClass:[Musica class]]){
        Musica *musica = (Musica *) self.midia;
    } else if ([_midia isMemberOfClass:[Podcast class]]){
        Podcast *podcast = (Podcast *) self.midia;
    } else if ([_midia isMemberOfClass:[EBook class]]){
        EBook *ebook = (EBook *) self.midia;
    }*/
    
}

@end

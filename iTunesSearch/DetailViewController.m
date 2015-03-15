//
//  DetailViewController.m
//  iTunesSearch
//
//  Created by Lucas Leal Mendonça on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *artista;
@property (weak, nonatomic) IBOutlet UILabel *preco;
@property (weak, nonatomic) IBOutlet UILabel *customA;
@property (weak, nonatomic) IBOutlet UILabel *customB;
@property (weak, nonatomic) IBOutlet UILabel *tipo;

@end

@implementation DetailViewController

- (void) viewWillAppear:(BOOL)animated{
    self.nome.text = [NSString stringWithFormat:@"Nome: %@", _midia.nome];
    self.artista.text = [NSString stringWithFormat:@"Artista: %@", _midia.artista];
    self.preco.text = [NSString stringWithFormat:@"Preço: %@", _midia.preco];
    _tipo.text = (NSStringFromClass([_midia class]));
    
    UIImage *tmpImage = _midia.image;
    
    self.imagem.image = tmpImage;
    //[NSString stringWithFormat:@" %@",];
    if([_midia isMemberOfClass:[Filme class]]){
        Filme *filme = (Filme *) self.midia;
        self.customA.text = [NSString stringWithFormat:@"Duração: %@",filme.duracao];
        self.customB.text = [NSString stringWithFormat:@"Gênero: %@", filme.genero];
    } else if ([_midia isMemberOfClass:[Musica class]]){
        Musica *musica = (Musica *) self.midia;
        self.customA.text = [NSString stringWithFormat:@"Duração: %@",musica.duracao];
        self.customB.text = [NSString stringWithFormat:@"Coleção: %@",musica.colecao];
    } else if ([_midia isMemberOfClass:[Podcast class]]){
        Podcast *podcast = (Podcast *) self.midia;
        self.customA.text = [NSString stringWithFormat:@"Gênero: %@",podcast.genero];
        self.customB.text = [NSString stringWithFormat:@"Coleção: %@",podcast.colecao];
    } else if ([_midia isMemberOfClass:[EBook class]]){
        EBook *ebook = (EBook *) self.midia;
        self.customA.text = [NSString stringWithFormat:@"Tamanho: %@",ebook.fileSize];
        self.customB.text = [NSString stringWithFormat:@"Nota media: %@",ebook.media];
    }
    
}

@end

//
//  iTunesManager.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Entidades/Musica.h"
#import "Entidades/Podcast.h"
#import "Entidades/EBook.h"

@implementation iTunesManager

static iTunesManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}

//Filme
- (NSArray *)buscarFilmes:(NSString *)termo{
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=movie", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *filmes = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Filme *filme = [[Filme alloc] init];
        [filme setNome:[item objectForKey:@"trackName"]];
        [filme setTrackId:[item objectForKey:@"trackId"]];
        [filme setArtista:[item objectForKey:@"artistName"]];
        [filme setDuracao:[self formatInterval:[NSString stringWithFormat:@"%@", [item objectForKey:@"trackTimeMillis"]]]];
        [filme setGenero:[item objectForKey:@"primaryGenreName"]];
        [filme setPais:[item objectForKey:@"country"]];
        [filme setPreco:[NSString stringWithFormat:@"U$ %@", [item objectForKey:@"trackPrice"]]];
        [filme setImage:[item objectForKey:@"artworkUrl100"]];
        [filmes addObject:filme];
    }
    
    return filmes;
}

//Musica
- (NSArray *)buscarMusicas:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=music", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *musicas = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Musica *musica = [[Musica alloc] init];
        [musica setNome:[item objectForKey:@"trackName"]];
        [musica setTrackId:[item objectForKey:@"trackId"]];
        [musica setArtista:[item objectForKey:@"artistName"]];
        [musica setDuracao:[self formatInterval:[NSString stringWithFormat:@"%@", [item objectForKey:@"trackTimeMillis"]]]];
        [musica setPreco:[NSString stringWithFormat:@"U$ %@", [item objectForKey:@"trackPrice"]]];
        [musica setImage:[item objectForKey:@"artworkUrl100"]];
        [musica setColecao:[item objectForKey:@"collectionName"]];
        [musicas addObject:musica];
    }
    
    return musicas;
}

//Podcast
- (NSArray *)buscarPodcasts:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=podcast", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *podcasts = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Podcast *podcast = [[Podcast alloc] init];
        [podcast setNome:[item objectForKey:@"trackName"]];
        [podcast setTrackId:[item objectForKey:@"trackId"]];
        [podcast setArtista:[item objectForKey:@"artistName"]];
        [podcast setGenero:[item objectForKey:@"primaryGenreName"]];
        [podcast setPreco:[NSString stringWithFormat:@"U$ %@", [item objectForKey:@"trackPrice"]]];
        [podcast setImage:[item objectForKey:@"artworkUrl100"]];
        [podcast setColecao:[item objectForKey:@"collectionName"]];
        [podcasts addObject:podcast];
    }
    
    return podcasts;
}

//Ebook
- (NSArray *)buscarEBooks:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=ebook", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *ebooks = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        EBook *ebook = [[EBook alloc] init];
        [ebook setNome:[item objectForKey:@"trackName"]];
        [ebook setTrackId:[item objectForKey:@"trackId"]];
        [ebook setArtista:[item objectForKey:@"artistName"]];
        [ebook setPreco:[NSString stringWithFormat:@"U$ %@", [item objectForKey:@"price"]]];
        [ebook setImage:[item objectForKey:@"artworkUrl100"]];
        [ebook setFileSize:[NSString stringWithFormat:@"%@ bytes", [item objectForKey:@"fileSizeBytes"]]];
        [ebook setMedia:[NSString stringWithFormat:@"%@", [item objectForKey:@"averageUserRating"]]];
        [ebooks addObject:ebook];
    }
    
    return ebooks;
}

//Método que converte double de milissegundos em uma NSString hh:mm:ss
- (NSString *) formatInterval: (NSString *) i{
    NSTimeInterval interval;
    if ([i doubleValue]) {
        interval = [i doubleValue];
    } else {
        interval = 0.0;
    }
    unsigned long milliseconds = interval;
    unsigned long seconds = milliseconds / 1000;
    milliseconds %= 1000;
    unsigned long minutes = seconds / 60;
    seconds %= 60;
    unsigned long hours = minutes / 60;
    minutes %= 60;
    
    NSMutableString * result = [NSMutableString new];
    
    if(hours)
        [result appendFormat: @"%d:", hours];
    else
        [result appendFormat: @"0:"];
    
    [result appendFormat: @"%2d:", minutes];
    [result appendFormat: @"%2d", seconds];
    //[result appendFormat: @"%2d",milliseconds];
    
    return result;
}


#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[iTunesManager alloc] init];
}

- (id)mutableCopy
{
    return [[iTunesManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end

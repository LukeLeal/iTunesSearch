//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Midia.h"
#import "Entidades/Filme.h"
#import "Entidades/Musica.h"
#import "Entidades/Podcast.h"
#import "Entidades/EBook.h"
#import "DetailViewController.h"

@interface TableViewController () {
    NSArray *filmes;
    NSArray *musicas;
    NSArray *podcasts;
    NSArray *ebooks;
    UITextField *search;
    iTunesManager *itunes;
}

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    
#warning Necessario para que a table view tenha um espaco em relacao ao topo, pois caso contrario o texto ficara atras da barra superior
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.bounds.size.width, 75.f)];
    
    search = [[UITextField alloc] initWithFrame:CGRectMake(0, 25, self.tableview.frame.size.width -100, 35)];
    [search setBackgroundColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0]];
    [search becomeFirstResponder];
    [self.tableview.tableHeaderView addSubview:search];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(265, 25, 50, 35);
    [button setTitle:NSLocalizedString(@"Search", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(busca:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableview.tableHeaderView addSubview:button];
    itunes = [iTunesManager sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)busca:(UIButton *)button {
    filmes = [itunes buscarFilmes:search.text];
    musicas = [itunes buscarMusicas:search.text];
    podcasts = [itunes buscarPodcasts:search.text];
    ebooks = [itunes buscarEBooks:search.text];
    [self resignFirstResponder];
    
    [self.tableview reloadData];
}

#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *details = [[DetailViewController alloc] init];
    Midia *midia;
    if(indexPath.section == 0){
        midia = filmes[indexPath.row];
    } else if(indexPath.section == 1){
        midia = musicas[indexPath.row];
        
    } else if(indexPath.section == 2){
        midia = podcasts[indexPath.row];
        
    } else if(indexPath.section == 3){
        midia = ebooks[indexPath.row];
    }
    details.midia = midia;
    [self.navigationController pushViewController:details animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [filmes count];
    } else if (section == 1) {
        return [musicas count];
    } else if (section == 2) {
        return [podcasts count];
    } else if (section == 3) {
        return [ebooks count];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    if(indexPath.section == 0){
        Filme *filme = [filmes objectAtIndex:indexPath.row];
        
        [celula.nome setText:filme.nome];
        [celula.tipo setText:NSLocalizedString(@"Movie", nil)];
        [celula.artista setText:filme.artista];
        [celula.duracao setText:filme.duracao];
        [celula.preco setText:filme.preco];
        [celula.imagem setImage:filme.image60];
        
    } else if(indexPath.section == 1){
        Musica *musica = [musicas objectAtIndex:indexPath.row];
        
        [celula.nome setText:musica.nome];
        [celula.tipo setText:NSLocalizedString(@"Music", nil)];
        [celula.artista setText:musica.artista];
        [celula.duracao setText:musica.duracao];
        [celula.preco setText:musica.preco];
        [celula.imagem setImage:musica.image60];
        
    } else if(indexPath.section == 2){
        Podcast *podcast = [podcasts objectAtIndex:indexPath.row];
        
        [celula.nome setText:podcast.nome];
        [celula.tipo setText:@"Podcast"];
        [celula.artista setText:podcast.artista];
//        [celula.duracao setText:podcast.duracao];
        [celula.preco setText:podcast.preco];
        [celula.duracao setHidden:YES];
        [celula.imagem setImage:podcast.image60];
        
    } else if(indexPath.section == 3){
        EBook *ebook = [podcasts objectAtIndex:indexPath.row];
        
        [celula.nome setText:ebook.nome];
        [celula.tipo setText:@"EBook"];
        [celula.artista setText:ebook.artista];
        [celula.preco setText:ebook.preco];
        [celula.duracao setHidden:YES];
        [celula.imagem setImage:ebook.image60];
    }

    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return NSLocalizedString(@"Movies", nil);
    if (section == 1)
        return NSLocalizedString(@"Musics", nil);
    if (section == 2)
        return @"Podcasts";
    if (section == 3)
        return @"EBooks";
    return @"undefined";
}


@end

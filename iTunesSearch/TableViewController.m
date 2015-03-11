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
#import "Entidades/Filme.h"
#import "Entidades/Musica.h"
#import "Entidades/Podcast.h"
#import "Entidades/EBook.h"

@interface TableViewController () {
    NSArray *midias;
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
    [self.tableview.tableHeaderView addSubview:search];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(265, 25, 50, 35);
    [button setTitle:@"Buscar" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(busca:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableview.tableHeaderView addSubview:button];
    
    itunes = [iTunesManager sharedInstance];
    //midias = [itunes buscarMidias:@"Apple"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)busca:(UIButton *)button {
    NSMutableArray *hue = [[NSMutableArray alloc] init];
    [hue addObjectsFromArray:[itunes buscarPodcasts:search.text]];
    [hue addObjectsFromArray:[itunes buscarMusicas:search.text]];
    [hue addObjectsFromArray:[itunes buscarFilmes:search.text]];
    [hue addObjectsFromArray:[itunes buscarEBooks:search.text]];
    midias = hue;
    [self.tableview reloadData];
}

#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [midias count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    if([[midias objectAtIndex:indexPath.row] isKindOfClass:[Filme class]]){
        Filme *filme = [midias objectAtIndex:indexPath.row];
        
        [celula.nome setText:filme.nome];
        [celula.tipo setText:@"Filme"];
        [celula.artista setText:filme.artista];
        [celula.duracao setText:filme.duracao];
        [celula.preco setText:filme.preco];
        
    } else if([[midias objectAtIndex:indexPath.row] isKindOfClass:[Musica class]]){
        Musica *musica = [midias objectAtIndex:indexPath.row];
        
        [celula.nome setText:musica.nome];
        [celula.tipo setText:@"Música"];
        [celula.artista setText:musica.artista];
        [celula.duracao setText:musica.duracao];
        [celula.preco setText:musica.preco];
        
    } else if([[midias objectAtIndex:indexPath.row] isKindOfClass:[Podcast class]]){
        Podcast *podcast = [midias objectAtIndex:indexPath.row];
        
        [celula.nome setText:podcast.nome];
        [celula.tipo setText:@"Podcast"];
        [celula.artista setText:podcast.artista];
//        [celula.duracao setText:podcast.duracao];
//        [celula.preco setText:podcast.preco];
        [celula.duracao setHidden:YES];
        [celula.preco setHidden:YES];
    } else if([[midias objectAtIndex:indexPath.row] isKindOfClass:[EBook class]]){
        EBook *ebook = [midias objectAtIndex:indexPath.row];
        
        [celula.nome setText:ebook.nome];
        [celula.tipo setText:@"EBook"];
        [celula.artista setText:ebook.artista];
//        [celula.duracao setText:ebook.duracao];
//        [celula.preco setText:ebook.preco];
        [celula.duracao setHidden:YES];
        [celula.preco setHidden:YES];
    }
    
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


@end


Create table Client(
    id VARCHAR(30) PRIMARY KEY not null,
    nomClient VARCHAR(30) not null,
    prenom VARCHAR(30) not null,
    numeroClient VARCHAR(30) not null,
    adresse VARCHAR(30) not null,
);
CREATE SEQUENCE idClient START WITH 1;


Create table TypeProduit(
    id VARCHAR(30) PRIMARY KEY not null,
    TypeProduit VARCHAR(30) not null
);
CREATE SEQUENCE idTypeProduit START WITH 1;


Create table Produit(
    id VARCHAR(30) PRIMARY KEY not null,
    nomProduit VARCHAR(30) not null,
    idTypeProduit VARCHAR(30) not null,
    FOREIGN KEY(idTypeProduit) REFERENCES TypeProduit(id)
);
CREATE SEQUENCE idProduit START WITH 1;


Create table Devise(
    id VARCHAR(30) PRIMARY KEY not null,
    nomDevise VARCHAR(30) not null
);
CREATE SEQUENCE idDevise START WITH 1;


Create table Unite(
    id VARCHAR(30) PRIMARY KEY not null,
    nomUnite VARCHAR(30) not null
);
CREATE SEQUENCE idUnite START WITH 1;


Create table Pays(
    id VARCHAR(30) PRIMARY KEY not null,
    nomPays VARCHAR(30) not null
);
CREATE SEQUENCE idPays START WITH 1;


Create table Fournisseur(
    id VARCHAR(30) PRIMARY KEY not null,
    nomFournisseur VARCHAR(30) not null,
    idPays VARCHAR(30) not null,
    idDevise VARCHAR(30) not null,
    adresse VARCHAR(30) not null,
    numeroFournisseur VARCHAR(30) not null,
    FOREIGN KEY(idPays) REFERENCES Pays(id),
    FOREIGN KEY(idDevise) REFERENCES Devise(id)
);
    CREATE SEQUENCE idFournisseur START WITH 1;


Create table TypeMouvement(
    id VARCHAR(30) PRIMARY KEY not null,
    typemouvement VARCHAR(30) not null
);
CREATE SEQUENCE idTypeMouvement START WITH 1;

Create table Mouvement(
    id VARCHAR(30) PRIMARY KEY not null,
    Datemouvement timestamp default CURRENT_TIMESTAMP,
    idTypeMouvement VARCHAR(30) not null,
    FOREIGN KEY(idTypeMouvement) REFERENCES TypeMouvement(id)
);
    CREATE SEQUENCE idMouvement START WITH 1;


Create table DetailMouvement(
    id VARCHAR(30) PRIMARY KEY not null,
    idMouvement VARCHAR(30) not null,
    idproduit VARCHAR(30) not null,
    PrixUnitaire DECIMAL(10,2) not null,
    quantite DECIMAL(10,2) not null,
    FOREIGN KEY(idMouvement) REFERENCES Mouvement(id),
    FOREIGN KEY(idproduit) REFERENCES Produit(id)
);
    CREATE SEQUENCE idDetailMouvement START WITH 1;
--marketing,rh,logistic

Create table Services(
    id VARCHAR(30) PRIMARY KEY not null,
    nomServices VARCHAR(30) not null
);
CREATE SEQUENCE idServices START WITH 1;

Create table DemandeAchat(
    id VARCHAR(30) PRIMARY KEY not null,
    idServices VARCHAR(30) not null,
    dateachat timestamp default CURRENT_TIMESTAMP,
    FOREIGN KEY(idServices) REFERENCES Services(id)
);
CREATE SEQUENCE idDemandeAchat START WITH 1;

Create table DetailAchat(
    id VARCHAR(30) PRIMARY KEY not null,
    idTypeProduit VARCHAR(30) not null,
    designation VARCHAR(30) not null,
    quantite DECIMAL(10,2) not null,
    FOREIGN KEY(idTypeProduit) REFERENCES TypeProduit(id) 
);
CREATE SEQUENCE idDetailAchat START WITH 1;


Create table BonCommande(
    id VARCHAR(30) PRIMARY KEY not null,
    Datemouvement timestamp default CURRENT_TIMESTAMP
);
CREATE SEQUENCE idBonCommande START WITH 1;

Create table DetailBonCommande(
    id VARCHAR(30) PRIMARY KEY not null,
    reference VARCHAR(30) not null,
    idDevise VARCHAR(30) not null,
    FOREIGN KEY(idDevise) REFERENCES Devise(id) 
);
CREATE SEQUENCE idDevise START WITH 1;

Create table Proforma(
    id VARCHAR(30) PRIMARY KEY not null,
    nom VARCHAR(30) not null,
    DateLimite timestamp default CURRENT_TIMESTAMP,
    idClient VARCHAR(30) not null,
    FOREIGN KEY(idClient) REFERENCES Client(id) 
);
CREATE SEQUENCE idProforma START WITH 1;

Create table BondeSortie(
    id VARCHAR(30) PRIMARY KEY not null,
    datesortie timestamp default CURRENT_TIMESTAMP,
    idmouvement VARCHAR(30) not null,
    idclient VARCHAR(30) not null,
    FOREIGN KEY(idMouvement) REFERENCES Mouvement(id),
    FOREIGN KEY(idClient) REFERENCES Client(id)
);
CREATE SEQUENCE idBondeSortir START WITH 1;

Create table Livreur(
    id VARCHAR(30) PRIMARY KEY not null,
    nom VARCHAR(30) not null
);
CREATE SEQUENCE idLivreur START WITH 1;

Create table Livraison(
    id VARCHAR(30) PRIMARY KEY not null,
    idClient VARCHAR(30) not null,
    idLivreur VARCHAR(30) not null,
    FOREIGN KEY(idClient) REFERENCES Client(id),
    FOREIGN KEY(idLivreur) REFERENCES Livreur(id)   
);
CREATE SEQUENCE idLivraison START WITH 1;

Create table LivraisonDetail(
    id VARCHAR(30) PRIMARY KEY not null,
    idLivraison VARCHAR(30) not null,
    idProduit VARCHAR(30) not null,
    quantiter DECIMAL(10,2) not null,
    FOREIGN KEY(idLivraison) REFERENCES Livraison(id),
    FOREIGN KEY(idProduit) REFERENCES Produit(id)
);
CREATE SEQUENCE idLivraisonDetail START WITH 1;

Create table Facture(
    id VARCHAR(30) PRIMARY KEY not null,
    DateFacture timestamp default CURRENT_TIMESTAMP,
    numeroFacture  VARCHAR(30) not null,
    idClient VARCHAR(30) not null,
    reductionglobal DECIMAL(10,2) default 0.00,
);

CREATE SEQUENCE idFacture START WITH 1;

Create table FactureDetail(
    id VARCHAR(30) PRIMARY KEY not null,
    idFacture VARCHAR(30) not null,
    idProduit VARCHAR(30) not null, 
    reductionproduit DECIMAL(10,2) default 0.00,
    FOREIGN KEY(idProduit) REFERENCES Produit(id),
    FOREIGN KEY(idFacture) REFERENCES Facture(id)
);
CREATE SEQUENCE idFactureDetail START WITH 1;
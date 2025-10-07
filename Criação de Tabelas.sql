CREATE TABLE Academia (
    ID_Academia NUMBER PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL,
    Mensalidade NUMBER(10,2),
    MestreFundador VARCHAR2(100)
);

CREATE TABLE Campeonato (
    Nome VARCHAR2(100) PRIMARY KEY,
    Data DATE NOT NULL,
    Organizador VARCHAR2(100)
);

CREATE TABLE Atleta (
    ID NUMBER PRIMARY KEY,
    ID_Academia NUMBER NULL, 
    Nome VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_atleta_academia FOREIGN KEY (ID_Academia) 
        REFERENCES Academia(ID_Academia)
);

CREATE TABLE Lutas (
    ID_Luta NUMBER PRIMARY KEY,
    Vencedor NUMBER NOT NULL,
    P1 NUMBER NOT NULL,
    P2 NUMBER NOT NULL,
    Avos_de_Final VARCHAR2(50) NOT NULL,
    NomeCampeonato VARCHAR2(100) NOT NULL,
    Metodo VARCHAR2(50) NOT NULL CHECK (Metodo IN ('Finalização', 'Pontos', 'Decisão')),
    Golpe VARCHAR2(100),
    Tempo_de_Luta NUMBER DEFAULT 5,
    CONSTRAINT fk_lutas_vencedor FOREIGN KEY (Vencedor) REFERENCES Atleta(ID),
    CONSTRAINT fk_lutas_p1 FOREIGN KEY (P1) REFERENCES Atleta(ID),
    CONSTRAINT fk_lutas_p2 FOREIGN KEY (P2) REFERENCES Atleta(ID),
    CONSTRAINT fk_lutas_campeonato FOREIGN KEY (NomeCampeonato) REFERENCES Campeonato(Nome)
);

CREATE TABLE Participa (
    ID_Atleta NUMBER NOT NULL,
    Nome_Campeonato VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_participa PRIMARY KEY (ID_Atleta, Nome_Campeonato),
    CONSTRAINT fk_participa_atleta FOREIGN KEY (ID_Atleta) REFERENCES Atleta(ID),
    CONSTRAINT fk_participa_campeonato FOREIGN KEY (Nome_Campeonato) REFERENCES Campeonato(Nome)
);
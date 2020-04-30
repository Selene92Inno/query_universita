create database universita;

use universita;

create table dipartimento(
  Codice int Primary Key,
  Nome varchar(70) not null
);

insert into dipartimento(Codice, Nome)
  values('010','Informatica e Comunicazione Digitale');

insert into dipartimento(Codice, Nome)
    values('011','Informatica e Tecnoligie per la Produzione Software');

insert into dipartimento(Codice, Nome)
    values('020','Economia e Commercio');

insert into dipartimento(Codice, Nome)
    values('021','Economia aziendale');

insert into dipartimento(Codice, Nome)
    values('030','Mediazione linguistica');

insert into dipartimento(Codice, Nome)
    values('031','Interpreti e Traduttori');

create table sede(
  Codice int Primary Key,
  Indirizzo varchar(100) not null,
  Citta varchar (30) not null
);


insert into sede(Codice, Indirizzo, Citta)
  values('0110', 'Via Leopoldo Latorre, 1','Firenze');

insert into sede(Codice, Indirizzo, Citta)
  values('0220', 'Via Luigi della Ducata, 5','Roma');

insert into sede(Codice, Indirizzo, Citta)
  values('0330', 'Via Leopizzi, 35','Perugia');

  create table sede_dipartimento(
    Codice_sede int not null,
    Codice_dipartimento int not null,
    Note varchar(150),
    Primary Key(Codice_dipartimento,Codice_sede),
    Foreign Key (Codice_sede) references sede(Codice),
    Foreign Key (Codice_dipartimento) references dipartimento(Codice)
  );

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento,Note)
    values('0110','010','null');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('0110','011');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
   values('0220','020');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('0220','021');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('0330','030');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('0330','031');


  create table corso_laurea(
  Codice int Primary Key,
  Nome varchar(50),
  Descrizione varchar(150)
  );

  insert into corso_laurea(Codice, Nome, Descrizione)
    values('01','INF','Informatica');

  insert into corso_laurea(Codice, Nome, Descrizione)
   values('02','ECO','Economia');

  insert into corso_laurea(Codice, Nome, Descrizione)
   values('03','LIN','Lingue');


create table modulo(
Codice int Primary Key,
Nome varchar(30) not null,
Descrizione varchar(150) not null,
CFU int not null
);

insert into modulo(Codice, Nome, Descrizione, CFU)
values('01','Linuaggi di Programmazione','Corso propedutico ai diversi linguaggi di programmazione','9');

insert into modulo(Codice, Nome, Descrizione, CFU)
values('02','Fondamenti di Informatica','Capacità di realizzare una macchina di Touring funzionale','6');


create table studente(
Matricola int not null,
Corso_laurea int not null,
Nome varchar(30),
Cognome varchar(30),
Data_nascita date not null,
Codice_fiscale char(16),
Foto blob default null,
Primary Key(Matricola, Corso_laurea), // è possibile usare la stessa matricola per corsi di laurea differenti
Foreign Key (Corso_laurea) references corso_laurea(Codice)
);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709332','01','Antonia','Musciacchio','1993/05/05','MSCNTN93E45L049M');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709326','01','Selene','Inno','1992/10/27','NNISLN92R67L049W');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709345','01','Mattia','Valente','1991/05/13','VLNMTT91E13L049G');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709345','02','Simone','Tornese','1991/08/14','TNSSMN91L05F076U');


create table docente(
Matricola int(6),
Dipartimento int not null,
Nome varchar(30) not null,
Cognome varchar(30) not null,
Data_nascita date not null,
Codice_fiscale char(16),
Foto blob default null,
Primary Key(Matricola, Dipartimento), // è possibile che ci siano stesse matricole per dipartimenti diversi
Foreign Key (Dipartimento) references dipartimento(Codice)
);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123567','010','Alessandra','Rao','1965/06/02','RAOLSN65H42L049I');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123568','011','Francesco','Guarino','1967/06/23','GRNFNC67H34L049I');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123568','030','Luca','Perrino','1977/04/13','PRNLCA77C33M043S');


create table esame(
Matricola_studente int not null,
Codice_modulo int NOT null,
Matricola_docente int(6),
Data date,
Voto int not null check(Voto>=18 AND Voto<=30),
Lode char(4),
     check(Lode='' OR Voto=30),
Note varchar(100),
Primary Key(Codice_modulo,Matricola_Studente),
Foreign Key (Matricola_studente)references studente(Matricola),
Foreign Key (Codice_modulo) references modulo(Codice),
Foreign Key (Matricola_docente)references docente(Matricola)
);

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709332', '01', '123567', '2019/07/18', '30');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709326', '02', '123568', '2020/01/21', '30');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto, Lode)
values ('709332', '02', '123568', '2019/04/18', '30','Lode');

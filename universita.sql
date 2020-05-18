create database universita;

use universita;

create table dipartimento(
  Codice int Primary Key,
  Nome varchar(70) not null
);

insert into dipartimento(Codice, Nome)
  values('10','Informatica e Comunicazione Digitale');

insert into dipartimento(Codice, Nome)
    values('11','Informatica e Tecnoligie per la Produzione Software');

insert into dipartimento(Codice, Nome)
    values('20','Economia e Commercio');

insert into dipartimento(Codice, Nome)
    values('21','Economia aziendale');

insert into dipartimento(Codice, Nome)
    values('30','Mediazione linguistica');

insert into dipartimento(Codice, Nome)
    values('31','Interpreti e Traduttori');

create table sede(
  Codice int Primary Key,
  Indirizzo varchar(100) not null,
  Citta varchar (30) not null
);


insert into sede(Codice, Indirizzo, Citta)
  values('110', 'Via Leopoldo Latorre, 1','Firenze');

insert into sede(Codice, Indirizzo, Citta)
  values('220', 'Via Luigi della Ducata, 5','Roma');

insert into sede(Codice, Indirizzo, Citta)
  values('330', 'Via Leopizzi, 35','Perugia');

  create table sede_dipartimento(
    Codice_sede int,
    Codice_dipartimento int,
    Note varchar(150),
    Primary Key(Codice_dipartimento,Codice_sede),
    Foreign Key (Codice_sede) references sede(Codice) on update cascade,
    Foreign Key (Codice_dipartimento) references dipartimento(Codice) on update cascade
  );

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('110','10');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('110','11');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
   values('220','20');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('220','21');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('330','30');

  insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('330','31');


  create table corso_laurea(
  Codice int Primary Key,
  Nome varchar(50),
  Descrizione varchar(150)
  );

  insert into corso_laurea(Codice, Nome, Descrizione)
    values('1','INF','Informatica');

  insert into corso_laurea(Codice, Nome, Descrizione)
   values('2','ECO','Economia');

  insert into corso_laurea(Codice, Nome, Descrizione)
   values('3','LIN','Lingue');


create table modulo(
Codice int Primary Key,
Nome varchar(30) not null,
Descrizione varchar(150),
CFU int not null check(CFU>=1 and CFU<=12)
);

insert into modulo(Codice, Nome, Descrizione, CFU)
values('1','Linuaggi di Programmazione','Corso propedutico ai diversi linguaggi di programmazione','9');

insert into modulo(Codice, Nome, Descrizione, CFU)
values('2','Fondamenti di Informatica','Capacità di realizzare una macchina di Touring funzionale','6');

insert into modulo(Codice, Nome, Descrizione, CFU)
values('3','PPM','Progettazione e Produzione multimediale','8');

insert into modulo(Codice, Nome, Descrizione, CFU)
values('4','PPW','Progettazione e Produzione WEB','9');

insert into modulo(Codice, Nome, Descrizione, CFU)
values('5','Basi di Dati','Capacità di realizzare un database','8');

insert into modulo(Codice, Nome, Descrizione, CFU)
values('6','Ingegneria Software','Capacità di realizzare un sito web','9');

create table studente(
Matricola int Primary Key,
Corso_laurea int,
Nome varchar(30) not null,
Cognome varchar(30) not null,
Data_nascita date not null check (Data_nascita < '2003/01/01'),
Codice_fiscale char(16) unique,
Foto blob default null,
Foreign Key (Corso_laurea) references corso_laurea(Codice) on update cascade
);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709332','01','Antonia','Musciacchio','1993/05/05','MSCNTN93E45L049M');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709333','01','Selene','Inno','1992/10/27','NNISLN92R67L049W');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709334','01','Mattia','Valente','1991/05/13','VLNMTT91E13L049G');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709335','02','Simone','Tornese','1991/08/14','TNSSMN91L05F076U');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709336','02','Simona','Schingaro','1995/04/14','SCHSMN95D54A662X');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709337','01','Filippo','Reitano','1997/10/20','RTNFPP97R60D086K');

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
values('709338','01','Irene','Bottino','1994/11/23','BTTRNI94S23C351I');


create table docente(
Matricola int Primary Key,
Dipartimento int not null,
Nome varchar(30) not null,
Cognome varchar(30) not null,
Data_nascita date not null check (Data_nascita <'1998/01/01'),
Codice_fiscale char(16) unique,
Foto blob default null,
Foreign Key (Dipartimento) references dipartimento(Codice) on update cascade
);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123567','10','Alessandra','Rao','1965/06/02','RAOLSN65H42L049I');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123568','11','Francesco','Guarino','1967/06/23','GRNFNC67H34L049I');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123570','11','Nicola','Chieppa','1955/02/16','CHPNCL55B16L219M');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123571','10','Giuseppe','Ressa','1958/08/27','RSSGPP58M27F205N');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123572','11','Miguel','Ceriani','1954/02/13','CRNMGL54B13E715K');

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
values('123573','11','Salvatore','Condorelli','1956/03/13','CNDSVT56C13F205X');

create table esame(
Matricola_studente int,
Codice_modulo int,
Matricola_docente int,
Data date not null,
Voto smallint not null check(Voto>=18 AND Voto<=30),
Lode char(4) default '' check (Lode='' or Lode='Lode'),
Note varchar(100),
Primary Key(Codice_modulo,Matricola_Studente),
check(Lode='' OR Voto=30),
Foreign Key (Matricola_studente)references studente(Matricola) on update cascade,
Foreign Key (Codice_modulo) references modulo(Codice) on update cascade,
Foreign Key (Matricola_docente)references docente(Matricola) on update cascade
);

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709332', '1', '123567', '2019/07/18', '30');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto, Lode)
values ('709332', '2', '123568', '2019/04/18', '30','Lode');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709332', '3', '123570', '2019/04/18', '28');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709332', '3', '123570', '2019/04/18', '27',);

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709333', '3', '123570', '2020/01/21', '30');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709333', '4', '123571', '2020/01/21', '28');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709333', '5', '123572', '2020/01/21', '26');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709334', '2', '123568', '2020/01/21', '24');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709334', '4', '123571', '2020/01/21', '18');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709334', '5', '123572', '2020/01/21', '21');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709335', '1', '123567', '2020/01/21', '28');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709335', '4', '123571', '2020/01/21', '25');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709335', '5', '123572', '2020/01/21', '30');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709336', '2', '123568', '2020/01/21', '26');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709336', '3', '123570', '2020/01/21', '23');

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
values ('709336', '5', '123572', '2020/01/21', '22');

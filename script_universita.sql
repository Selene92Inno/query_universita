use universita;

insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
  values('0440','031'); // not valid (sede non valida)

insert into sede_dipartimento(Codice_sede, Codice_dipartimento)
    values('0330','060'); // not valid (dipartimento non valido)

insert into corso_laurea(Codice, Nome, Descrizione)
    values('01','LIN','Lingue'); //Primary Key valid

insert into modulo(Codice, Nome, Descrizione, CFU)
    values('01','Fondamenti di Informatica','Capacità di realizzare una macchina di Touring funzionale','6'); // not valid (stesso codice modulo)

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
    values('709345','01','Simone','Tornese','1991/08/14','TNSSMN91L05F076U'); // not valid (stessa matricola, stesso corso)

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
    values('709412','05','Sonia','Aleandri','1999/04/24','ANRSNA99L05F076U'); // not valid (il corso non esiste)

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale)
    values('709415','02','Sonia','Perchiazzi','1999/06/23','PCZSNA99L040W'); // ERRORE: Mi permette di inserire codici fiscali anche inferiori a 16 caratteri.

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
    values('123568','011','Luca','Perrino','1977/04/13','PRNLCA77C33M043S'); // not valid (stessa matricola, stesso dipartimento)

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
    values('123568','230','Luca','Perrino','1977/04/13','PRNLCA77C33M043S'); // not valid (il dipartimento non esiste)

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale)
    values('1235644','010','Davide','Scarangella','1976/05/13','SGLDVD76C78L043S'); ERRORE: Mi permette di inserire una matricola superiore a 6 caratteri.

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto)
    values ('709326', '02', '123568', '2019/07/18', '24'); // not valid ( stesso studente, stesso esame)

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto, Lode)
    values ('709314', '02', '123568', '2019/06/18', '24', 'lode'); // not valid ( voto<18 per avere la lode)

insert into esame(Matricola_studente, Codice_modulo, Matricola_docente, Data, Voto,)
    values ('709332', '02', '123568', '2019/06/18', '14'); // not valid (voto<18)

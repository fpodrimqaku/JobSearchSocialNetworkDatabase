drop database if exists projekti;
create database Projekti;
use Projekti;

create table Adresa(
AID int primary key,
rruga varchar(40),
qyteti varchar(30),
shteti varchar(40),
Kodi_postal int(11),
gpsx float,
gpsy float
);

create table Studenti(
SID int primary key,
emri varchar(20) NOT NULL,
mbiemri varchar(30) NOT NULL,
gjinia char(1) NOT NULL,
ditelindja date NOT NULL,
statusi_martesor char(1),
AID int ,
telefoni varchar(15),
email varchar(30) NOT NULL UNIQUE,
username varchar(20) NOT NULL unique,
fjalkalimi varchar(20) NOT NULL unique,
foto longblob,
pershkrim varchar(50),
foreign key(AID) references Adresa(AID)
);

create table Mentori(
MID int primary key,
emri_mentorit varchar(15) NOT NULL,
mbiemri_mentorit varchar(15) NOT NULL
);


create table Uni_Fk_Dpt(
UFDID int primary key,
emri_universitetit varchar(30) NOT NULL,
fakulteti varchar (40) NOT NULL,
departamenti varchar(50) NOT NULL
);


create table Edukimi(
EID int primary key,
SID int,
viti_fillimit int NOT NULL,
viti_mbarimit int,
UFDID int,
foreign key(SID) references Studenti(SID),
foreign key(UFDID) references Uni_Fk_Dpt(UFDID)
);



create table Tema(
SID INT ,
EID INT ,
MID int,
titulli varchar(50) NOT NULL,
fusha_studimit  varchar(60) NOT NULL,
foreign key(MID) references Mentori(MID),
PRIMARY KEY(SID,EID),
FOREIGN KEY (SID) REFERENCES Studenti(SID),
FOREIGN KEY (EID) REFERENCES Edukimi(EID)

);




create table Aftesit_Profesionale(
APID int primary key,
SID int,
aftesia varchar(20) NOT NULL,
foreign key(SID) references Studenti(SID)
);

create table Hobi(
HID int primary key,
SID int,
lloji varchar(40),
foreign key(SID) references Studenti(SID)
);

create table F_Librat(
FLID int primary key,
SID int,
titulli_librit varchar(50),
autori varchar(50),
foreign key(SID) references Studenti(SID)
);

create table F_Filmat(
FFID int primary key,
SID int,
titulli_filmit varchar(50),
foreign key(SID) references Studenti(SID)
);

create table F_Muzika(
FMID int primary key,
SID int,
zhanri varchar(20),
foreign key(SID) references Studenti(SID)
);

create table Gjuhet(
GJID int primary key,
gjuha varchar(10) 
);

create table Studenti_Flet_Gjuhen(
GJID int primary key,
SID int,
aftesia int,
foreign key(SID) references Studenti(SID)
);


create table Institucioni(
INID int primary key,
lloji char(1),
emri varchar(20) NOT NULL
);

create table Projektet(
PID int primary key,
SID int,
emri_projektit varchar(100) NOT NULL,
data_fillimit date NOT NULL,
data_mbarimit date,
INID int,
vendi_realizimit varchar(40) NOT NULL,
pershkrimit varchar(100),
roli varchar(30) NOT NULL,
webfaqja varchar(60),
foreign key(SID) references Studenti(SID),
foreign key(INID) references Institucioni(INID)
);


create table Studenti_Punon(
SPNID int primary key,
SID int,
pozita varchar(60),
kompania varchar(50),
data_fillimit date,
data_mbarimit date,
foreign key(SID) references Studenti(SID)
);

create table Kompania(
CID int primary key,
emri_kompanise varchar(50) NOT NULL,
logo longblob,
pershkrimi varchar(60),
webfaqja varchar(50),
nr_telefonit bigint(15) NOT NULL,
nr_puntorve int NOT NULL,
lloji_kompanise varchar(60) NOT NULL,
viti_themelimit int NOT NULL,
AID int,
username varchar(15) NOT NULL unique,
fjalkalimi varchar(15) NOT NULL unique,
email varchar(60),
foreign key(AID) references Adresa(AID)
);

create table Pozita (
POZID int primary key,
CID int,
titulli_pozites varchar(50) NOT NULL,
pershkrimi_pozites varchar(100) NOT NULL,
AID int,
data_postimit date NOT NULL,
data_fundit_aplikimit date NOT NULL,
foreign key(CID) references Kompania(CID),
foreign key(AID) references Adresa(AID)
);

create table Aplikimet(
APID int primary key,
SID int,
POZID int,
data_aplikimit date NOT NULL,
koha_aplikimit time NOT NULL,
foreign key(SID) references Studenti(SID),
foreign key(POZID) references Pozita(POZID)
);

create table Komentet(
KID int primary key,
texti varchar(40)
);

create table Studenti_Komenton_Pozitat(
SID int,
POZID int,
KID int,
data_komentimit date,
koha time,
primary key (SID,POZID,KID),
foreign key(SID) references Studenti(SID),
foreign key(POZID) references Pozita(POZID),
foreign key(KID) references Komentet(KID)
);

create table Studenti_komenton_komentet(
SID int,
KID int,
SKID int,
data_komentit date,
koha time,
primary key(SID,KID,SKID),
foreign key(SID) references Studenti(SID),
foreign key(KID) references Komentet(KID)
);

create table Sudenti_pelqen_komentet(
SID int,
KID int,
data_pelqimit date,
koha time,
primary key(SID,KID),
foreign key(SID) references Studenti(SID),
foreign key(KID) references Komentet(KID)
);

create table Studenti_pelqen_pozitat(
SID int,
POZID int,
data_pelqimeve date,
koha time,
primary key(SID,POZID),
foreign key(SID) references Studenti(SID),
foreign key(POZID) references Pozita(POZID)
);

create table Studenti_shares_pozitat(
SID int,
POZID int,
KID int,
data_shares date,
koha time,
primary key(SID,POZID,KID),
foreign key(SID) references Studenti(SID),
foreign key(POZID) references Pozita(POZID),
foreign key(KID) references Komentet(KID)
);

create table Aftesite_nevojshme(
ANID int primary key,
POZID int,
aftesia varchar(30) NOT NULL,
foreign key(POZID) references Pozita(POZID)
);

create table Aftesit_deshiruara(
ADID int primary key,
POZID int,
aftesia varchar(40) NOT NULL,
foreign key(POZID) references Pozita(POZID)
);

insert into Adresa() values(1,'Gjergj Fishta','Gjilan','Kosove',42000,1.123,21.22),
							(2,'Queen St','Prishtin','Hawaii',96813,232.232,2.13),
                            (3,'Dragodan','Prishtine','Kosove',10000,231.1321,2.333),
                            (4,'L.Pavarsia 9200','Vlore','Shqiperi',9400,23.111,23.111),
                            (5,'Dardani','Prishtine','Kosove',10000,231.1321,2.333),
                            (6,'Rr.Elbasanit Vila Nr.77','Tiran','Shqiperi',1000,8.123,7.023),
                            (7,'Bregu i Diellit','Prishtine','Kosove',10000,231.1321,2.333),
                            (8,'Gazmend Zajmi','Peje','Kosove',30000,9.76,67.96),
                            (9,'Faik Konica','Prizeren','Kosove',20000,71.09,70.432),
                            (10,'Rruga Tirana','Gjakove','Kosove',50000,47.876,20.99);

select *
from Adresa;
                            
 insert into Studenti() values(1,'Drilona','Veliu','F',19960228,'P',1 ,'44567890','lona_32@hotmail.com','lona.aa','3478590hhs12',LOAD_FILE('E:/Images/avatar.png'),'asddasda');
 insert into Studenti() values(2,'Bana','Hada','F',19980206,'P',2 ,'17123456799','banah@live.com','hbana12','popcorn323',LOAD_FILE('E:/Images/avatar.png'),'Insistuese');
insert into Studenti() values (3,'Tahiti','Hernandez','F',19850703,'M',3 ,'80825534576','tahitibellaa@hotmail.com','tahitilovesu','haze23552',LOAD_FILE('E:/Images/avatar.png'),'E shpejt');
insert into Studenti() values (4,'Visar','Berisha','M',19940811,'P',4,'38349443576','vissi.94@gmail.com','Visar','barcelona01',LOAD_FILE('E:/Images/avatar.png'),'Intelegjent');
insert into Studenti() values(5,'Sabit','Jashari','M',19770116,'M',5,'38345414387','Sabit_jashari@hotmail.com','Sabit','jasharijashari',LOAD_FILE('E:/Images/avatar.png'),'I shpejt');
insert into Studenti() values(6,'Arjeta','Selimi','F',19900627,'M',6,'38344817491','arjeta12@yahoo.com','Jeta','mrsselimi',LOAD_FILE('E:/Images/avatar.png'),'Mireberes');
insert into Studenti() values(7,'Taulant','Hasani','M',19980429,'P',7,'38344456189','taulanti_533@gmail.com','Taulanit1','ManchesterUnited',LOAD_FILE('E:/Images/avatar.png'),'Shakagji');
insert into Studenti() values(8,'Ela','Mustafaraj','F',19861012,'P',8,'37733512114','ela_1986@hotmail.com','Ela','vloraime',LOAD_FILE('E:/Images/avatar.png'),'E bukur');
insert into Studenti() values(9,'Nora','Hoxha','F',19901204,'M',9,'38349339479','nora.nora@hotmail.com','Nora','asdf1234',LOAD_FILE('E:/Images/avatar.png'),'Puntore');
insert into Studenti() values(10,'Shaban','Morina','M',19710519,'M',10,'38344281056','shaban.m@live.com','ShabanM','veragojarti',LOAD_FILE('E:/Images/avatar.png'),'Serioz');

select*
from studenti;

insert into Mentori() values(1,'Freskim','Sfarqa'),
							(2,'Afrim','Prenaj'),
                            (3,'Mensur','Qoqaj'),
                            (4,'Getuar','Muriqi'),
                            (5,'Gezim','Preteni');
  
  select *
  from Mentori;
                            
                       
                            
insert into Uni_Fk_Dpt values(1,'UP','Fiek','Inxhinieri Kompjuterike'),
							(2,'Universum','Kompjuterik','Inxhinieri Softwerike'),
                            (3,'UBT','Ekonomi',' Marketing'),
                            (4,'Rinvest','Ekonomi','Hotelieri'),
                            (5,'Iliria','Juridik','Avokati'),
                            (6,'Tempulli','Juridik','Jurispodenc'),
							(7,'UP','Kimi','Kimia Organike'),
                            (8,'Universum','Juridik','Avokati'),
                            (9,'UBT','Mjeksi','Stomatologji'),
                            (10,'Rinvest','Arkitektur','Arkitektur');
                            
select*
from Uni_Fk_Dpt;						
                            
insert into Edukimi() values(1,1,20151015,20191015,1),
							(2,2,20161015,null,2), 
                            (3,3,20121001,null,3), 
                            (4,4,20121001,null,4), 
                            (5,5,20151001,null,5), 
                            (6,6,20151015,20191015,6), 
                            (7,7,20151015,20171005,7), 
                            (8,8,20151015,null,8), 
                            (9,9,20151015,20191015,9), 
                            (10,10,20151015,20191015,10);
                            
 select *
 from Edukimi;
                      
                       insert into Tema() values(1,1,1, 'Aplikacioni per mbathje','Inxhinieri dhe komunikim njeri kompjuter'),
							(2,9,2, 'Prishjet E dhembit','Stomatologji'),
                            (3,6,3, 'Ndryshimet rapide te cmimeve ne treg','Ekonomi'),
                            (4,7,4, 'Psikologjia bindese','Psikologji dhe Jurispodence'),
                            (5,10,5, 'Depozitat afatgjate','Ekonomi');

select *
from Tema;   
                            
  insert into Aftesit_Profesionale() values (45,1,'Java'),
											(46	,1,'html'),
                                            (47,1,'css'),
                                            (48,2,'Komunikimi'),
                                            (49,2,'Planifikimi'),
                                            (50,2,'.NET'),
                                            (51,3,'Swift'),
                                            (52,8,'Preciziteti'),
                                            (53,9,'CCNA'),
                                            (54,10,'Swift');

select *
from Aftesit_Profesionale;

insert into Hobi() values(45,1,'Kendimi'),
						(46,1,'Vallezimi'),
						(47,10,'Piktura'),
						(48,2,'Vizatimi'),
						(49,2,'Lundrimi'),
						(50,6,'Citjeja'),
						(51,7,'Peshengritja'),
                        (52,8,'Aerobiku'),
                        (53,9,'Peshkimi'),
                        (54,4,'Filma');
 
 select*
 from Hobi;
 
 insert into F_Librat() values(60,1,'Sikur te isha djale','Haki Stermilli'),
(61,2,'PapertownS','John Green'),
(62,3,'Paris for One','Jojo Moyes'),
(63,4,'Nje shetitje e paharruar','Nicholas Sparks'),
(64,5,'The Great Gatsby','F. Scott Fitzgerald'),
(65,6,'Don Kishoti','Migel Servantes'),
(66,7,'A Good Man Is Hard to Find and Other Stories','Flannery OConnor'),
(67,8,'The help	','KathrynStockett'),
(68,9,'Lojerat e urise','Suzanne Collins');                       

select*
from F_Librat;
                          
insert into F_Filmat values(15,1,'The Godfather'),
                              (16,2,'Schindlers List'),
                              (17,3,'Raging Bull'),
                              (18,4,'Casablanca'),
                              (19,5,'Citizen Kane'),
                              (20,6,'Gone with the Wind'),
                              (21,7,'The Wizard of Oz'),
                              (22,8,'Lawrence of Arabia'),
                              (23,9,'Vertigo'),
                              (24,10,'Psycho');

select*
from F_Filmat;                              
	
insert into F_Muzika values(29,1,'KPOP'),
(30,2,'HIP-HOP'),
(31,3,'Rock'   ),
(32,4,'rap'    ),
(33,5,'Classic'),
(34,6,'Rap'    ),
(35,7,'Hip-hop'),
(36,8,'pop'    ),
(37,9,'Rock'   ),
(38,10,'House' );

select*
from F_Muzika;

insert into Gjuhet values(1,'EN '),
(2,'DE '),
(3,'RUS'),
(4,'TU '),
(5,'JAP'),
(6,'SRB'),
(7,'FR ');

select *
from Gjuhet;

insert into Studenti_Flet_Gjuhen values(1,3,7),
(2,1,7),
(3,2,6),
(4,2,7),
(5,7,5),
(6,5,6),
(7,2,8),
(8,1,3),
(9,3,6),
(10,5,10);

select*
from Studenti_Flet_Gjuhen;
                           
insert into Institucioni values (1,'S','Fiek'),
(2,'P','Elkos'),
(3,'S','Fna'),
(4,'P','Etc'),
(5,'S','Universum'),
(6,'P','Primo');

select*
from Institucioni;

insert into Projektet values(15	,2	,'Zhvillimi i platformes per punesimin e studenteve',	20171118 ,20171127,	1,	'15',	'Shume fort',	'Menagjere',	'Github.com/asdfasf'),
(16	,2	,'Hulumtim Tregu',20171219,	20180113,2,'20','mire','Menagjere'	,'Github.com/asdfasf'),
(17	,3	,'Relamimi i nje produkti te nje kpmpanije',20160419,20160425,3	,'20',	'bukur',	'Pjesemarres',	'Github.com/asdfasf'),
(19	,2	,'Menagjimi i nje stafi te hoteli per 3 dit',20171213,20171213,	5,	'17',	'shum mire',	'Menagjere',	'Github.com/asdfasf'),
(21	,7	,'Sintetizimi i aminave',20180418,	20180518,3,	'19',	'shume experience e vlefshme',	'Menagjere',	'Github.com/asdfasf'),
(22	,7	,'Mbrojtja e nje klienti falas',20171211,20181218	,	2,	'20',	'projekt shum i veshtire por aftesues',	'Pjesemarres'	,'Github.com/asdfasf'),
(23	,9	,'Kontrollimi i shendetit te dhembeve ne qedhet e prishtines',20160409,	20160610,4,	'21',	'projekt shum i lezetshem','Menagjere',	'Github.com/asdfasf'),
(24	,10	,'Ndertimi i nje shtepie',20160417,	20170227,3,	'22','stafi ishin shum te sjellshem	','Pjesemarres','Github.com/asdfasf');

select*
from Projektet;

insert into Studenti_Punon values(1,1,'Programere','Zombie Soup',20181015,null),
(2,2,'Palues mallli','Etc',20171215,20180615),
(3,3,'Menagjer Restoranti',	'Restaurant Adriatiku',20150315,null),
(4,8,'Organizues i sektorit te marketingut ne Viva','Viva Fresh Store',20160114,null),		
(5,6,'Organizues Arkive','Gjykata Komunale',20180313,null);	

select*
from Studenti_Punon;

insert into Kompania values(1,'Zombie Soup',LOAD_FILE('E:/Images/avatar.png'),'Kompania me elite e softwerit','zm.com',383333111222,50,'Sherbime Softwerike',1999,10,'zombie_qorba','123123123','zsoup@gmail.com'),
(2,'Viva Fresh Store',LOAD_FILE('E:/Images/avatar.png'),'Kompania me fitimprurese','vfs.com',383333111222,100,'Shitblerje',1993,3,'vvs','33333333','c1@gmail.com'),
(3,'Amoreti',LOAD_FILE('E:/Images/avatar.png'),'Kompania me e embel','amoreti.com',383333111222,23,'Prodhim',1993,5,'te_amo','amoamoamo','aferati@gmail.com'),
(4,'Salamander',LOAD_FILE('E:/Images/avatar.png'),'Komapnia me e shpejte','slamander.com',383333111222,43,'Shitblerje',2000,8,'Salamander','sdfggh','salamander@gmail.com'),
(5,'Marigona Residence',LOAD_FILE('E:/Images/avatar.png'),'Komapnia me e rehatshme','mresidence.com',383333111222,50,'Ndertim',2011,4,'m_residence','mlmlmlm123','mresidence@gmail.com');

select *
from Kompania;

insert into Pozita values(1,1,'Programmer java','Programim',10,20181201,20190101),	
(2,2,'Menagjues i marketingut','Menagjim',3,20190115,20190131),	
(3,3,'Testues i shijes','testim',5,20190123,20190131),
(10,3,'prokurues sheqeri','prokurim',5,20190123,20190131),	
(4,4,'Organizues i interierit te depove','Organizim i interierit',8,20181203,20190101),	
(5,5,'Arkitekt','PLanifikim i hapsires',4,20181204,20190101),	
(6,1,'Sql developer','Zhvillim i databazes',10,20181205,20190101),	
(7,2,'Menagjer i sektorit te tekstilit','Menagjim i hyrjeve daljesve dhe puntorve',3,20181206,20190101),
(8,3,'Menagjer i sektorit te qokolatave','Menagjim i hyrjeve,daljveve dhe fitimit te sektorit',5,20181201,20190101),	
(9,5,'Ndihmes Arkitekt','Asistim i arkitektit',4,20181205,20190101);

select*
from Pozita;



insert into Aplikimet values(1,1,6,20180507,'8:46:55' ),
(2,2,1,20181203,'19:57:21'),
(3,3,4,20171117,'14:12:56'),
(4,4,5,20171206,'9:56:14'),
(5,5,8,20181203,'7:40:43'),
(6,7,5,20190131,'14:11:57'),
(7,2,5,20180322,'14:11:57'),
(8,2,9,20190131,'13:34:00'),
(9,5,5,20181203,'7:40:43'),
(10,6,5,20180322,'14:11:57'),
(11,9,4,20180322,'14:11:57'),
(12,7,7,20180110,'13:34:00');

select*
from Aplikimet;

insert into Komentet() values(1,'pozitive'),
(2,'interesant'),
(3,'negative'),
(4,'bukur'),
(5,'mire'),
(6,'interesant'),
(7,'sfiduese'),
(8,'paga e ulet'),
(9,'orari gjate'),
(10,'pauza e shkurter');

select *
from Komentet;

insert into Studenti_Komenton_Pozitat()values(1,1,1,20170312,'12:34:54'),
(2,2,2,20190129,'11:25:00'),
(2,4,3,20190130,'11:25:00'),
(3,3,3,20170207,'14:34:43'),
(4,4,4,20170110,'20:26:43'),
(5,5,5,20180529,'22:15:21'),
(6,6,6,20180630,'21:45:51'),
(7,7,7,20180815,'15:28:54');

select*
from Studenti_Komenton_Pozitat;

insert into  Studenti_komenton_komentet()values(4,1,7,20181201,'12:34:54'),
(5,2,6,20181202,'11:25:00'),
(6,3,5,20181202,'14:34:43'),
(7,4,4,20181203,'20:26:43'),
(8,5,3,20181204,'22:15:21'),
(9,6,2,20181205,'21:45:51'),
(10,7,1,20181206,'15:28:54');

select*
from Studenti_komenton_komentet;

insert into Sudenti_pelqen_komentet() values(1,4,20181201,'12:34:54'),
(2,5,20181202,'11:25:00'),
(3,6,20181202,'14:34:43'),
(4,7,20181203,'20:26:43'),
(5,8,20181204,'22:15:21'),
(6,9,20181205,'21:45:51'),
(7,10,20181206,'15:28:54');

select*
from Sudenti_pelqen_komentet;

insert into  Studenti_pelqen_pozitat() values(3,2,20170312,'12:34:54'),
(4,3,20180922,'11:25:00'),
(5,4,20170207,'14:34:43'),
(6,5,20171107,'20:26:43'),
(7,6,20180529,'22:15:21'),
(8,7,20180630,'21:45:51'),
(9,8,20180815,'15:28:54'),
(9,5,20180815,'15:28:54');

select *
from Studenti_pelqen_pozitat;

insert into Studenti_shares_pozitat()values (2,1,4,20190129,'12:34:54'),
(2,3,4,20190130,'12:34:54'),
(3,2,5,20180922,'11:25:00'),
(4,3,6,20170207,'14:34:43'),
(5,4,7,20171107,'20:26:43'),
(6,5,8,20180529,'22:15:21'),
(7,6,9,20180630,'21:45:51'),
(8,7,10,20180815,'15:28:54');

select*
from Studenti_shares_pozitat;

insert into Aftesite_nevojshme() values(1,2,'Menagjues i mire'),
(2,1,'Java'),
(3,9,'Organizativ'),
(4,4,'Dizain web'),
(5,4,'Java skript'),
(6,5,'Dizainer'),
(7,6,'SQL Server');

select *
from Aftesite_nevojshme;

insert into Aftesit_deshiruara() values (1,3,'Gastronomi'),
(2,4,'Komunikimi'),
(3,5,'Planifikimi'),
(4,6,'.NET'),
(5,7,'Swift'),
(6,5,'Preciziteti'),
(7,6,'CCNA');

select *
from projektet;

/*
use projekti;
-- query 1
select * from Studenti S where S.sid 
in (Select S1.sid from studenti S1,Adresa A1 where S1.sid=A1.aid and A1.qyteti like "prishtin%")
and S.sid not in (Select sid from Projektet);

-- query 2
select S.sid,S.emri,S.mbiemri from Studenti S
where 
S.sid in (select sid from Studenti_komenton_pozitat where data_komentimit=20190129) 
and 
S.sid in (select sid from Studenti_shares_pozitat where data_shares=20190130 )
and 
S.sid in(select sid from Studenti_komenton_pozitat where data_komentimit=20190129)
and
S.sid in (select sid from Studenti_shares_pozitat where data_shares=20190130 ); 



-- query 3
Select * from pozita p where
 p.aid in (Select aid from Adresa where qyteti like "prishtin%")
and p.data_postimit<=20190131
and p.data_postimit>=20190101
and p.pozid not in (select pozid from aplikimet);



-- query 4
select * from studenti s where 
s.sid in (select ap11.sid from aplikimet ap11,aplikimet ap12 
where ap11.sid=ap12.sid 
and not ap11.pozid=ap12.pozid
and ap11.data_aplikimit=20190131 and ap12.data_aplikimit=20190131)
and s.sid not in (select ap2.sid from aplikimet ap2 where data_aplikimit=20190201);
 
 
 -- query 5
 select k.cid,k.emri_kompanise,a.qyteti,k.email,count(p.pozid) as NPozitave from 
 kompania k,adresa a,pozita p 
 where
 p.cid=k.cid 
 and a.aid=k.aid
 and p.pozid in (select pozid from pozita where data_postimit between 20181201 and 20190131)
 group by k.cid order by NPozitave Desc limit 5;
 
 -- todo add email column to kompania 
 use projekti;
 -- query 6
 
 select pozid,titulli_pozites,emri_kompanise,nrStudenteve,data_postimit,pelqimet,shperndarjet,komentet from (

 select poz.pozid,poz.titulli_pozites,kom.emri_kompanise,count(apl.sid) as nrStudenteve,poz.data_postimit
 from pozita poz,kompania kom,aplikimet apl
 where poz.pozid=apl.pozid and poz.cid=kom.cid 
 and apl.sid in 
 (select studid from (select p1.sid as studid,count(p1.pid) as prnum from projektet p1 group by studid having count(p1.pid)>=2 ) bel4) group by poz.pozid order by nrStudenteve desc limit 3

)  t1


inner join


 (
select pozidp,ifnull(pelqimet,0) as pelqimet,ifnull(shperndarjet,0) as shperndarjet,ifnull(komentet,0) as komentet from (
(select * from 
(select pozita.pozid as pozidp,ifnull(count(spp.sid),0) as pelqimet from pozita left join studenti_pelqen_pozitat spp on spp.pozid=pozita.pozid group by pozita.pozid)  tp
left join
(select pozita.pozid as pozidk,ifnull(count(skp.sid),0) as komentet from pozita left join studenti_komenton_pozitat skp on skp.pozid=pozita.pozid group by pozita.pozid)  tk on tp.pozidp=tk.pozidk
) kom_pel_
left join 
(select pozita.pozid as pozids,ifnull(count(ssp.sid),0) as shperndarjet from pozita ,studenti_shares_pozitat ssp where ssp.pozid=pozita.pozid group by pozita.pozid) shar_ on shar_.pozids=kom_pel_.pozidp 
) 
) t2 on t1.pozid=t2.pozidp order by nrStudenteve desc;


*/
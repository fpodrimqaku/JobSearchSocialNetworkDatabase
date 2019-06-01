delimiter $$
create trigger CheckNrPuntorveOnInsertKompania before insert on Kompania
for each row
begin 
if new.nr_puntorve < 4
then signal sqlstate '45000' 
set message_text ='Na vjen keq , numri i puntoreve duhet te jet me i madh se 3. ';
end if;
end $$
delimiter $$

insert into Kompania values(11,'Zombie Soup',LOAD_FILE('E:/Images/avatar.png'),'Kompania me elite e softwerit','zm.com',383333111222,2,'Sherbime Softwerike',1999,10,'zombie_qorba','123123123');

drop trigger CheckDataFillimitOnUpdateProjektet;

delimiter $$
create trigger CheckDataFillimitOnUpdateProjektet before update on Projektet
for each row
begin
IF NEW.data_fillimit >old.data_mbarimit
THEN signal sqlstate'45000'
set message_text='Data e fillimit duhet te jete me e vogel se e mbarimit';
END IF ;
END $$
delimiter $$;

update Projektet
set data_fillimit=20190505
where PID=15;
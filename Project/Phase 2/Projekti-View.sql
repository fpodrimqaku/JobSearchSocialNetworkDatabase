create view Studenti_dhe_Projektet as
select s.sid,s.emri as 'Emri i studentit',s.mbiemri as 'Mbiemri i studentit',p.emri_projektit as 'Emri i projektit',
p.vendi_realizimit as 'Vendi i realizimit',p.pershkrimit as 'Pershkrimi mbi projektin',p.roli as 'Roli i studentit',i.emri as 'Emri i institucionit'
from Studenti s
inner join Projektet p
on s.sid=p.sid
inner join Institucioni i
on p.INID=i.INID;

select*
from Studenti_dhe_Projektet;

create view Shpalljet_Kompanive_TeVogla as
select k.emri_kompanise as 'Emri i kompanis',k.nr_puntorve as 'Numri i puntorve',k.lloji_kompanise as 'LLoji i kompanis',
p.titulli_pozites as'Titulli i pozites',p.pershkrimi_pozites as 'Pershkrimi mbi poziten',p.data_postimit as 'Data e postimit'
from Kompania k
inner join Pozita p
on k.CID=p.CID
where k.nr_puntorve<=50
order by nr_puntorve;

select *
from Shpalljet_Kompanive_TeVogla;


create view Studenti_3Projekte as
select s.emri as 'Emri i studentit',s.mbiemri as 'Mbiemri i studentit',s.gjinia as'Gjinia e studentit',
count(p.SID) as 'Numri i projekteve'
from Studenti s
inner join Projektet p
on s.SID=p.SID
group by s.emri
having count(p.SID)>=3;

select*
from Studenti_3Projekte;
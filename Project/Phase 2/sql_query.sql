-- query 1
select * from Studenti S where S.sid 
in (Select S1.sid from studenti S1,Adresa A1 where S1.aid=A1.aid and A1.qyteti like "prishtin%")
and S.sid not in (Select sid from Projektet);

-- query 2
select S.sid,S.emri,S.mbiemri from Studenti S
where 
S.sid in (select sid from Studenti_komenton_pozitat where data_komentimit=20190129) 
and 
S.sid in (select sid from Studenti_shares_pozitat where data_shares=20190130 )
and 
S.sid in(select sid from Studenti_komenton_pozitat where data_komentimit=20190130)
and
S.sid in (select sid from Studenti_shares_pozitat where data_shares=20190129 ); 



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

delimiter //
create procedure EditF_Librat(param_flid int,
param_sid int,
param_titulli_librit varchar(50),
param_autori varchar(50))
begin 
update f_librat
set SID= param_sid,
titulli_librit = param_titulli_librit,
autori = param_autori
where FLID= param_flid;
end //


call EditF_Librat(61,4,'Divergent','John Green');


delimiter //
CREATE PROCEDURE FindStudenti(IN Id INT)
BEGIN
  SELECT SID, CONCAT(emri, ' ', mbiemri) AS 'Emri i studentit'
  FROM Studenti
  WHERE SID = Id;
  END //
  
call FindStudenti(6);

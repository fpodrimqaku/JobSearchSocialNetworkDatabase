delimiter $$
create function llogaritKohenEmbarimit(viti_fillimit date, viti_mbarimit date)
returns int
begin
return DATEDIFF(viti_mbarimit,viti_fillimit);
end $$
delimiter $$

select llogaritKohenEmbarimit(20151015,20191015) as'Ditet';

SET GLOBAL log_bin_trust_function_creators = 1;
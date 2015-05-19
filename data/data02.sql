select * from test01.arbeidsledighet
-- 428 rows

select * from test01.kommuner 
select count(*) from test01.kommuner 
-- 434 rows - why 6 more?

select distinct
	kommuner.komm, 
	kommuner.navn
from test01.kommuner as K
left join test01.arbeidsledighet as A
on K.navn like K.kommnavn

select distinct
	kommuner.komm, 
	kommuner.navn
from test01.kommuner, test01.arbeidsledighet
where
	--kommuner.navn like '%' + arbeidsledighet.kommnavn + '%'
	kommuner.navn like arbeidsledighet.kommnavn

select 
	a.kommnavn ,
	k.navn
from 
	test01.arbeidsledighet as a, 
	test01.kommuner as k
where 
	--a.gid = k.gid
	--a.kommnavn like k.navn -- 416 rows
	k.navn like a.kommnavn -- 416 rows 
	--k.navn like a.kommnavn || '%' -- 445 rows due to ie Sel and Selje matches


select * from test01.arbeidsledighet
-- 428 rows

select * from test01.kommuner 
select count(*) from test01.kommuner 
-- 434 rows - why 6 more?

select distinct
	kommuner.komm, 
	kommuner.navn
from test01.kommuner, test01.arbeidsledighet
where
	--kommuner.navn like '%' + arbeidsledighet.kommnavn + '%'
	kommuner.navn like arbeidsledighet.kommnavn


CREATE OR REPLACE VIEW test01.vw_komm_ledighet AS
select distinct
	a.kommnavn as a_navn,
	k.navn as k_navn,
	k.komm as komm_nr ,
	a.gid as a_gid ,
	k.gid as k_gid ,
	a."2013", a."2012", a."2011", a."2010", a."2009",
	geom
from 
	test01.arbeidsledighet as a, 
	test01.kommuner as k
where 
	--a.gid = k.gid
	--a.kommnavn like k.navn -- 416 rows
	k.navn like a.kommnavn -- 416 rows 
	--k.navn like a.kommnavn || '%' -- 445 rows due to ie Sel and Selje matches
	--k.gid in(17,37,52,63,95,117,133,217,262,263,349,381,406,413,420,421,425,426) -- 7704 ows

select "a_navn","k_navn","komm_nr","a_gid","k_gid" from test01.vw_komm_ledighet 

-- Selects the last 18 kommuner 
CREATE OR REPLACE VIEW test01.vw_komm_nonjoined AS
SELECT 	gid, kommnavn
FROM   test01.arbeidsledighet a
WHERE  NOT EXISTS (
   SELECT a_gid
   FROM   test01.vw_komm_ledighet v
   WHERE  a.gid = v.a_gid
);
-- Selects the last 18 kommuner 
-- SELECT a.gid, kommnavn
-- FROM   test01.arbeidsledighet a
-- LEFT   JOIN test01.vw_komm_ledighet v ON a.gid = v.a_gid
-- WHERE  v.a_gid IS NULL;

select gid from test01.vw_komm_nonjoined

select distinct
	a.kommnavn as a_navn,
	'' as k_navn,
	null as komm_nr ,
	a.gid as a_gid ,
	null as k_gid ,
	a."2013", a."2012", a."2011", a."2010", a."2009"
	--, geom
from 	test01.arbeidsledighet a
where	a.gid in(17,37,52,63,95,117,133,217,262,263,349,381,406,413,420,421,425,426)


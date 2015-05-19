drop TABLE test01.Arbeidsledighet;

CREATE TABLE test01.Arbeidsledighet
  (
  "kommnavn" varchar(50),
  "2009" double precision,
  "2010" double precision,
  "2011" double precision,
  "2012" double precision,
  "2013" double precision
  );

COPY test01.Arbeidsledighet 
  FROM '/mnt/jbod_01/jonas/freelance/ellevator.net/GeoForum.no/repos/veiledning02/data/Arbeidsledighet_.csv' 
  DELIMITER ',' CSV;


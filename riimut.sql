DROP TABLE IF EXISTS riimu_perhe CASCADE;
DROP TABLE IF EXISTS riimut CASCADE;
DROP TABLE IF EXISTS avain_sanat CASCADE;

CREATE TABLE riimu_perhe (
  id bigint primary key generated always as identity,
  nimi text not null
);

CREATE TABLE riimut (
  id bigint primary key generated always as identity,
  nimi text not null,
  perhe_id bigint references riimu_perhe (id)
);

CREATE TABLE avain_sanat (
  id bigint primary key generated always as identity,
  riimu_id bigint references riimut (id),
  sana text not null
);

INSERT INTO
  riimu_perhe (nimi)
VALUES
  ('Freyan perhe'),
  ('Heimdallin perhe'),
  ('Torin(Tyrin) perhe'),
  ('Tyhjä riimu');

INSERT INTO
  riimut (nimi, perhe_id)
VALUES
  ('Fehu', 1),
  ('Uruz', 1),
  ('Thurisaz', 1),
  ('Ansuz', 1),
  ('Raid(h)o', 1),
  ('Kano(Kenaz,Kaunahaava)', 1),
  ('Gebo', 1),
  ('Wunjo', 1),
  ('Hagalaz', 2),
  ('Nautiz', 2),
  ('Isa', 2),
  ('Jera', 2),
  ('Eihwaz', 2),
  ('Perth(Perthro)', 2),
  ('Algiz(Elhaz)', 2),
  ('Sowelu(Sowilo)', 2),
  ('Teiwaz(Tiwaz)', 3),
  ('Berkana', 3),
  ('Ehwaz', 3),
  ('Mannaz', 3),
  ('Laguz', 3),
  ('Inguz(Ingwaz)', 3),
  ('Othila', 3),
  ('Dagaz', 3),
  ('Wyrd', 4);

INSERT INTO
  avain_sanat (riimu_id, sana)
VALUES
  (1, 'karja'),
  (1, 'vauraus'),
  (1, 'menestys'),
  (2, '(alku)härkä'),
  (2, 'alkuvoima'),
  (2, 'itsenäisyys'),
  (2, 'tahto'),
  (2, 'terveys'),
  (2, 'kestävyys'),
  (2, 'suoja'),
  (3, 'jätti'),
  (3, 'muutos'),
  (3, 'kärsimys'),
  (3, 'motivaatio'),
  (3, 'puolustus vihollisia vastaan'),
  (3, 'haaste'),
  (4, 'jumala'),
  (4, 'sisäinen viisaus'),
  (4, 'viestintuoja'),
  (4, 'inspiraatio'),
  (4, 'siunaus'),
  (5, 'ratsastus'),
  (5, 'kyyti'),
  (5, 'matka'),
  (5, 'työ'),
  (5, 'rytmi'),
  (5, 'suunnitelma'),
  (6, 'valo'),
  (6, 'tulinen luovuus'),
  (6, 'oppiminen'),
  (6, 'ymmärrys'),
  (7, 'lahja'),
  (7, 'tasapaino'),
  (7, 'kumppanuus'),
  (7, 'vaihtokauppa'),
  (7, 'yhteys'),
  (8, 'ilo'),
  (8, 'harmonia'),
  (8, 'hyvinvointi'),
  (8, 'hyvät uutiset'),
  (9, 'muutos'),
  (9, 'katastrofi'),
  (9, 'kaaos'),
  (9, 'luonnonvoimat'),
  (10, 'tarve'),
  (10, 'kärsimys'),
  (10, 'kärsivällisyys'),
  (10, 'vaikeus'),
  (10, 'rajoitus'),
  (11, 'jää'),
  (11, 'pysähtyminen'),
  (11, 'este'),
  (12, 'kierto'),
  (12, 'yltäkylläisyys'),
  (12, 'sadonkorjuu'),
  (12, 'oikeudenmukaisuus'),
  (12, 'vuosi'),
  (13, 'suoja'),
  (13, 'elinvoima'),
  (13, 'yhteys'),
  (13, 'kasvu'),
  (13, 'tasaisuus'),
  (13, 'joustavus'),
  (13, 'puolustus'),
  (13, 'marjakuusi'),
  (14, 'kohtalo'),
  (14, 'salaisuus'),
  (14, 'mahdollisuus'),
  (14, 'tiedostamaton'),
  (15, 'korkeampi tietoisuus'),
  (15, 'suoja (vihollisilta)'),
  (15, 'ohjaus'),
  (15, 'henkisyys'),
  (15, 'hirvi'),
  (15, 'voima'),
  (16, 'aurinko'),
  (16, 'voima'),
  (16, 'inspiraatio'),
  (16, 'täydentyminen'),
  (16, 'onnistuminen'),
  (16, 'voitto'),
  (17, 'oikeus'),
  (17, 'voittaminen'),
  (17, 'rohkeus'),
  (17, 'soturi'),
  (18, 'syntymä'),
  (18, 'kasvu'),
  (18, 'uusi alku'),
  (19, 'liike'),
  (19, 'yhteistyö'),
  (19, 'luottamus'),
  (19, 'lojaalisuus'),
  (19, 'eteneminen'),
  (19, 'hevonen'),
  (20, 'ihminen'),
  (20, 'yhteisö'),
  (20, 'identiteetti'),
  (20, 'tietoisuus'),
  (21, 'vesi'),
  (21, 'intuitio'),
  (21, 'virtaus'),
  (21, 'flow-tila'),
  (21, 'potentiaali'),
  (22, 'hedelmällisyys'),
  (22, 'potentiaali'),
  (22, 'täyttymys'),
  (22, 'kodin suoja'),
  (22, 'jumalatar Ing'),
  (23, 'perintö'),
  (23, 'koti'),
  (23, 'perinne'),
  (24, 'valo'),
  (24, 'läpimurto'),
  (24, 'muutos'),
  (24, 'toivo'),
  (24, 'hyvä energia'),
  (25, 'kohtalo'),
  (25, 'mysteeri'),
  (25, 'mahdollisuus'),
  (25, 'perheen ja historian vauraus');

SELECT 
    r.id as riimu_id,
    r.nimi as riimu_nimi,
    rp.nimi as perhe_nimi,
    STRING_AGG(a.sana, ', ') as avainsanat
FROM riimut r
LEFT JOIN riimu_perhe rp ON r.perhe_id = rp.id
LEFT JOIN avain_sanat a ON r.id = a.riimu_id
GROUP BY r.id, r.nimi, rp.nimi
ORDER BY r.id;
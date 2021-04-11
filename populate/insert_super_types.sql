INSERT INTO mtg.super_types (name) 
VALUES ('Basic') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.super_types (name) 
VALUES ('Elite') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.super_types (name) 
VALUES ('Host') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.super_types (name) 
VALUES ('Legendary') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.super_types (name) 
VALUES ('Ongoing') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.super_types (name) 
VALUES ('Snow') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.super_types (name) 
VALUES ('World') 
ON CONFLICT DO NOTHING; 


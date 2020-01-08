/*
TP 2 :
Lahchiouach Hasna
Hatoch Hamza
*/
/*A)Création des tables*/

CREATE TABLE PIECE (
NOP number(30), 
DESIGNATION varchar2(20),
COULEUR varchar2(50),
POIDS number(5)) ;

CREATE TABLE SERVICE (
NOS number(30), 
INTITULE VARCHAR(20),
LOCALISATION varchar2(30)) ;


CREATE TABLE ORDRE (
NOP number(30), 
NOS number(30), 
QUANTITE NUMBER(10));

CREATE TABLE NOMENCLATURE (
NOPA NUMBER(30), 
NOPC VARCHAR2(50), 
QUANTITE NUMBER(10)) ;

/*B)Contraintes d’intégrité*/

/*Q1*/
INSERT INTO PIECE VALUES (10,'piece1','gray',55);
INSERT INTO PIECE VALUES (10,'piece2','black',11);

/*Q2*/
INSERT INTO SERVICE VALUES (44,'Informatique','Casablanca');
INSERT INTO SERVICE VALUES (44,'Environnement','Agadir');
/*Q3*/
INSERT INTO ORDRE VALUES (10,45,8);
INSERT INTO ORDRE VALUES (14,20,4);

/*Q4*/
INSERT INTO NOMENCLATURE VALUES(10,44,55);
INSERT INTO NOMENCLATURE VALUES(10,11,78);
INSERT INTO NOMENCLATURE VALUES(10,47,99);

/*Q5*/
ALTER TABLE PIECE ADD CONSTRAINT piece_pk PRIMARY KEY(NOP);
ALTER TABLE SERVICE ADD CONSTRAINT service_pk PRIMARY KEY(NOS);
ALTER TABLE ORDRE ADD CONSTRAINT order_piece_fk FOREIGN KEY(NOP) REFERENCES PIECE(NOP);
ALTER TABLE ORDRE ADD CONSTRAINT order_service_fk FOREIGN KEY(NOS) REFERENCES SERVICE(NOS);
ALTER TABLE NOMENCLATUREADD CONSTRAINT nom_cla_pk PRIMARY KEY (NOPA, NOPC);
ALTER TABLE NOMENCLATUREADD CONSTRAINT nom_cla_piece1_fk FOREIGN KEY (NOPA) REFERENCES PIECE (NOP) ;
ALTER TABLE NOMENCLATUREADD CONSTRAINT nom_cla_piece2_fk FOREIGN KEY (NOPC) REFERENCES PIECE (NOP) ;

/*Q6*/


/*Q7*/
ALTER TABLE PIECE ADD CONSTRAINT piece_ck CHECK(COULEUR IN('ROUGE', 'VERTE', 'BLEUE' , 'JAUNE'));


/*C)Modification de la structure de la base*/
/*Q1*/
ALTER TABLE PIECE MODIFY (DESIGNATION CHAR(30));
ALTER TABLE SERVICE MODIFY (INTITULE CHAR(30));

/*Q2*/
ALTER TABLE SERVICE MODIFY (LOCALISATION VARCHAR2(20));

/*Q3*/
ALTER TABLE SERVICE ADD  DIRECTEUR VARCHAR2(30);

/*Q4*/
ALTER TABLE SERVICE DROP COLUMN LOCALISATION;

/*Q5*/
ALTER TABLE PIECE DROP PRIMARY KEY CASCADE;

/*Q6*/
ALTER TABLE PIECE DROP CONSTRAINT piece_ck;

/*Q7*/
DROP TABLE NOMENCLATURE;

/*Q8*/
DROP TABLE ORDRE CASCADE CONSTRAINTS;

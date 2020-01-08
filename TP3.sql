/* HATOCH HAMZA 
LAHCHIOUACH HASNA 
 BINOME 01 */

--***************************************EXERCICE1*********************************

--Q1:
SELECT NumAP 
FROM airplane 
WHERE Capacity > 350;

--Q2:
SELECT NumAP,NameAP
FROM airplane
WHERE Localisation LIKE ("Nice");

--Q3:
SELECT NumP,Dep_T
FROM pilote p , flight f
WHERE p.NumP = f.NumP;

--Q4:
SELECT * 
FROM pilote;

--Q5:
SELECT NumP,NameP
FROM pilote
WHERE Adresse LIKE("Paris") 
AND Salary > 15000

--Q6:
SELECT NumAP,NameAP
FROM airplane
WHERE Localisation LIKE("Nice") OR Capacity < 350;

--Q7:
SELECT NumF 
FROM flight
WHERE Dep_T LIKE("Nice") AND Dep_H = 18 AND Arr_T LIKE("Paris");

--Q8:
SELECT p.NumP,p.NameP
FROM pilote p, flight f
WHERE p.NumP <> f.NumP;

--Q9:
SELECT NumF,Dep_T
FROM flight
WHERE NumP IN (100,204);


--***************************************EXERCICE2*********************************

--Q1:
SELECT Personne 
FROM Emprunt
WHERE Livre = "Recueil Examens BD";

--Q2:
SELECT E.Personne 
FROM Emprunt E, Retard R
WHERE E.Personne <> R.Personne;

--Q3:
SELECT  Personne,COUNT(DISTINCT(Livre)) 
FROM Emprunt 
GROUP BY Personne
HAVING COUNT(DISTINCT(Livre)) = SELECT COUNT(DISTINCT(Livre))
                                    FROM Emprunt;

--Q4:
SELECT Livre,COUNT(DISTINCT(Personne))
FROM Emprunt
GROUP BY Livre
HAVING COUNT(DISTINCT(Personne)) = SELECT COUNT(DISTINCT(Personne))
                                        FROM Emprunt;

--Q5:
SELECT E.Personne
FROM Emprunt E, Retard R
WHERE 


DECLARE
 v_dept DEPARTMENTS%ROWTYPE;
 BEGIN
    SELECT MAX(department_id)+10 INTO v_dept.department_id FROM DEPARTMENTS
    INSERT INTO departments VALUES v_dept;
 END;
 
 
DECLARE 
    v_dept_id DEPARTMENTS.department_id%TYPE;
    BEGIN
    SELECT MAX(department_id) INTO v_dept_id FROM DEPARTMENTS;
    INSERT INTO departments(department_id) VALUES v_dept_id+10;
    END;
    
    
    
DECLARE 
    v_dept_id DEPARTMENTS.department_id%TYPE;
    BEGIN
    SELECT MAX(department_id) INTO v_dept_id FROM DEPARTMENTS;
    DBMS_OUTPUT.PUT_LINE(v_dept_id);
    END;
    
    
    
DECLARE
 v_dept DEPARTMENTS%ROWTYPE;
 BEGIN
    SELECT * INTO v_dept FROM DEPARTMENTS WHERE 
    department_id = (SELECT MAX(department_id) FROM DEPARTMENTS);
     DBMS_OUTPUT.PUT_LINE(v_dept.department_id||' '||v_dept.department_name);
 END;
 

    
DECLARE
 v_location_id NUMBER := 2500;
 BEGIN
 UPDATE DEPARTMENTS
 SET location_id := v_location_id
 WHERE department_id = (SELECT MAX(department_id) FROM DEPARTMENTS);
 DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
 END;
 
 
 
 DEFINE p_last_name = 60000 
 DECLARE 
    v_last_name employees.employees_id%TYPE := &p_last_name;
    v_id_manager employees.manager_id%TYPE;
    v_manager_name employees.last_name%TYPE;
    BEGIN
    SELECT manager_id INTO v_id_manager WHERE last_name=v_last_name;
    SELECT last_name INTO v_manager_name WHERE employees_id = v_id_manager;
    DBMS_OUTPUT.PUT_LINE(v_manager_name);
    END;



DECLARE 
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    CURSOR emp_cursor IS 
    SELECT first_name, last_name FROM employees
    ORDER BY hire_date;
    BEGIN
    OPEN emp_cursor;
    FOR i IN 1..10
    LOOP
    FETCH emp_cursor INTO v_first_name,v_last_name;
    DBMS_OUTPUT.PUT_LINE(v_last_name||' '||v_first_name);
    END LOOP;
    END;

DECLARE 
    v_sum_emp_30 NUMBER;
    BEGIN
    SELECT COUNT(*) INTO v_sum_emp_30 FROM employees WHERE department_id = 30;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
    END;


DECLARE 
     v_salary employees.salary%TYPE;
     v_name employees.last_name%TYPE;
     BEGIN
        SELECT last_name INTO v_name FROM employees WHERE employee_id=10;
        SELECT salary INTO v_salary FROM employees WHERE employee_id=10;

        IF v_salary<3000 THEN
        UPDATE employees SET salary = salary +500;
        DBMS_OUTPUT.PUT_LINE(v_name||'  salary updated');
        ELSE
        DBMS_OUTPUT.PUT_LINE(v_name||' earns '||v_salary);
        END IF;
        END;


--Exercice 11

--1) a)
SELECT Horaire
FROM Salle
WHERE Titre = "Les mesirables";

--b)
SELECT acteur
FROM Film
GROUP BY acteur
HAVING COUNT(Titre) = (SELECT COUNT(DISTINCT Titre) FROM Film);

--c)


--2)
DECLARE 
        v_realisateur Film.realisateur%TYPE;
        v_nbr_film NUMBER;
        CURSOR film_cursor IS
        SELECT COUNT(Titre),realisateur
        FROM Film
        GROUP BY realisateur;
    BEGIN
    OPEN film_cursor; 
    LOOP 
    FETCH film_cursor INTO v_nbr_film,v_realisateur;
    IF film_cursor%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('Pas de films disponibles !! ');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Le realisateur '||v_realisateur||' a realisé '||v_nbr_film||' films');
    END IF;
    END;
    
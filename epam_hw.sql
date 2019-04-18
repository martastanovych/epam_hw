----- HW 1   ----- 
----- TASK 1 -----
SELECT DISTINCT maker, type FROM product 
WHERE type='laptop' 
ORDER BY maker;

----- TASK 2 -----
SELECT model, ram, screen, price FROM laptop 
WHERE price>1000 
ORDER BY ram ASC, price DESC;

----- TASK 3 -----
SELECT * FROM printer 
WHERE color='y' 
ORDER BY price DESC;

----- TASK 4 -----
SELECT model, speed, hd, cd, price FROM pc 
WHERE (cd='12x' OR cd='24x') and price<600 
ORDER BY speed DESC;

----- TASK 5 -----
SELECT name, class FROM ships
WHERE name=class 
ORDER BY name;

----- TASK 6 -----
SELECT * FROM pc
WHERE speed !< 500 and price < 800 
ORDER BY price DESC;

----- TASK 7 -----
SELECT * FROM printer
WHERE type NOT LIKE 'Matrix' and price<300 
ORDER BY type DESC;

----- TASK 8 -----
SELECT model, speed FROM pc
WHERE price BETWEEN 400 and 600 
ORDER BY hd;
----- TASK 8/2 -----
SELECT model, speed FROM pc
WHERE price>=400 and price<=600 
ORDER BY hd;

----- TASK 9 -----
SELECT model, speed, hd, price FROM laptop
WHERE screen !< 12 
ORDER BY price DESC;

----- TASK 10 -----
SELECT model, type, price FROM printer
WHERE price<300 
ORDER BY type DESC;

----- TASK 11 -----
SELECT model, ram, price FROM laptop
WHERE ram=64 
ORDER BY screen;

----- TASK 12 -----
SELECT model, ram, price FROM pc
WHERE ram>64 
ORDER BY hd;

----- TASK 13 -----
SELECT model, speed, price FROM pc
WHERE speed BETWEEN 500 and 750 
ORDER BY hd DESC;

----- TASK 14 -----
SELECT * FROM Outcome_o
WHERE out>2000 
ORDER BY date DESC;

----- TASK 15 -----
SELECT * FROM income_o
WHERE inc BETWEEN 5000 and 10000 
ORDER BY inc;

----- TASK 16 -----
SELECT * FROM Income
WHERE point=1 
ORDER BY inc;

----- TASK 17 -----
SELECT * FROM Outcome
WHERE point=2 
ORDER BY out;

----- TASK 18 -----
SELECT * FROM Classes
WHERE country='Japan'
ORDER BY type DESC;

----- TASK 19 -----
SELECT name, launched FROM ships
WHERE launched BETWEEN 1920 and 1942
ORDER BY launched DESC;

----- TASK 20 -----
SELECT ship, battle, result FROM outcomes
WHERE battle= 'Guadalcanal' and result NOT LIKE 'sunk'
ORDER BY ship DESC;

----- TASK 21 -----
SELECT ship, battle, result FROM outcomes
WHERE result = 'sunk'
ORDER BY ship DESC;

----- TASK 22 -----
SELECT class, displacement FROM classes
WHERE displacement !< 40000
ORDER BY type;

----- TASK 23 -----
SELECT trip_no, town_from, town_to FROM trip
WHERE town_from = 'London' or town_to = 'London'
ORDER BY time_out;

----- TASK 24 -----
SELECT trip_no, plane, town_from, town_to FROM trip
WHERE plane = 'TU-134'
ORDER BY time_out DESC;

----- TASK 25 -----
SELECT trip_no, plane, town_from, town_to FROM trip
WHERE plane != 'IL-86'
ORDER BY plane;

----- TASK 26 -----
SELECT trip_no, town_from, town_to FROM trip
WHERE town_from != 'Rostov' and town_to != 'Rostov'
ORDER BY plane;

----- TASK 27 -----
SELECT * FROM pc
WHERE model LIKE '%1%1%';

----- TASK 28 -----
SELECT * FROM Outcome
WHERE  DATENAME(month, date) = 'march';

----- TASK 29 -----
SELECT * FROM Outcome_o 
WHERE DATENAME(day, date) = 14;

----- TASK 30 -----
SELECT name FROM ships
WHERE name LIKE 'W%n';

----- TASK 31 -----
SELECT name FROM ships
WHERE name LIKE '%e%e%';

----- TASK 32 -----
SELECT name, launched FROM ships
WHERE name NOT LIKE '%a';

----- TASK 33 -----
SELECT name FROM battles
WHERE name LIKE '% %' and name NOT LIKE '% %c';

----- TASK 34 -----
SELECT * FROM trip
WHERE  (DATENAME(hour, time_out) BETWEEN 12 AND 17)
            AND NOT 
           ((DATENAME(minute, time_out) > 0) 
            AND 
           (DATENAME(hour, time_out) = 17));
           
----- TASK 35 -----
SELECT * FROM trip
WHERE  (DATENAME(hour, time_in) BETWEEN 17 AND 23)
            AND NOT 
           ((DATENAME(minute, time_in) > 0) 
            AND 
           (DATENAME(hour, time_in) = 23));
           
----- TASK 36 -----
SELECT * FROM trip
WHERE  (DATENAME(hour, time_in) > 21 or DATENAME(hour, time_in) < 10);

----- TASK 37 -----
SELECT date FROM pass_in_trip
WHERE place LIKE '1%';

----- TASK 38 -----
SELECT date FROM pass_in_trip
WHERE place LIKE '%c';

----- TASK 39 -----
SELECT name FROM Passenger
WHERE name LIKE '% C%';

----- TASK 40 -----
SELECT name FROM Passenger
WHERE name NOT LIKE '% J%';

----- TASK 41 -----
SELECT ('Середня ціна = ' +str(Avg(price))) AS AVG_PRICE FROM laptop;

----- TASK 42 -----
SELECT ('Код: '+str(code,2)) AS code,
       ('Модель: '+str(model,4)) AS model,
       ('Швидкість: '+str(speed,3)) AS speed,
       ('ОЗП: '+str(ram,3)) AS ram,
       ('Жорсткий диск: '+str(hd,2)) AS hd,
       ('Оптичний привід: '+cd) AS cd,
       ('Ціна: '+str(price,3)) AS price
FROM  PC;

----- TASK 43 -----
SELECT CAST(YEAR(date) as varchar) +'.'+ CAST(MONTH(date) as varchar) +'.'+ CAST(DAY(date) as varchar) 
as date FROM Income;

----- TASK 44 -----
SELECT ship,battle, 
CASE
    WHEN result = 'OK' THEN 'цілий'
    WHEN result = 'sunk' THEN 'потоплений'
    WHEN result = 'damaged' THEN 'пошкоджений'
END result
FROM Outcomes;

----- TASK 45 -----
SELECT trip_no, date, id_psg,
('Ряд: ' + SUBSTRING(place,1,1)) as row,
('Місце: ' + SUBSTRING(place,2,1)) as place
FROM  Pass_in_trip;

----- TASK 46 -----
SELECT trip_no, id_comp, plane,
('from ' + RTRIM(town_from) + ' to ' + RTRIM(town_to)) as town_from_to, time_out, time_in 
FROM  Trip;

----- TASK 47 -----
/*SELECT (LEFT(trip_no,1) + RIGHT(trip_no,1) +
LEFT(id_comp,1) + RIGHT(id_comp,1) +
LEFT(plane,1) + RIGHT(plane,1) +
LEFT(town_from,1) + RIGHT(town_from,1) +
LEFT(town_to,1) + RIGHT(town_to,1) +
LEFT(time_out,1) + RIGHT(time_out,1) +
LEFT(time_in,1) + RIGHT(time_in,1)) as concat_
FROM  Trip;*/

----- TASK 48 -----
SELECT DISTINCT maker, COUNT(model) as count_model 
FROM product
GROUP BY maker
HAVING COUNT(model) >= 2;
   
----- TASK 49 -----
SELECT DISTINCT town_from, COUNT(trip_no) as count_trip_no_from
FROM trip
GROUP BY town_from;
/*SELECT DISTINCT town_to, COUNT(trip_no) as count_trip_no_to
FROM trip
GROUP BY town_to;*/

----- TASK 50 -----
SELECT DISTINCT type, COUNT(model) as count_model
FROM printer
GROUP BY type;

----- TASK 51 -----
SELECT DISTINCT cd, COUNT(model) as count_model
FROM pc
GROUP BY cd;

----- TASK 52 -----
SELECT trip_no, 
CASE
WHEN time_out > time_in THEN '12:00:00'-time_out+time_in+'12:00:00'
ELSE time_in - time_out 
END  as flight_time 
FROM trip;

----- TASK 53 -----
SELECT point, MAX(out_) as max_sum, MIN(out_) as min_sum
FROM (SELECT point, SUM(out) as out_
FROM outcome 
GROUP BY point, date
UNION
SELECT point, SUM(out) as out_
FROM outcome
GROUP BY point) as outcome_
GROUP BY point;

----- TASK 54 -----
SELECT trip_no, row, COUNT(place) as count_place
FROM (SELECT trip_no, date, id_psg,
		(SUBSTRING(place,1,1)) as row,
		(SUBSTRING(place,2,1)) as place 
		FROM Pass_in_trip) as Pass_in_trip_
GROUP BY trip_no, row;

----- TASK 55 -----
SELECT COUNT(name) as count_name 
FROM Passenger
WHERE (name LIKE '% S%') or (name LIKE '% B%') or (name LIKE '% A%');


----- HW 2     ----- 
----- TASK 2_1 -----
SELECT DISTINCT maker, type, speed, hd FROM product,pc
WHERE hd!>8 and type='pc';

----- TASK 2_2 -----
SELECT DISTINCT maker FROM product,pc
WHERE speed!<600 and type='pc';

----- TASK 2_3 -----
SELECT DISTINCT maker FROM product,laptop
WHERE speed!>500 and type='laptop';

----- TASK 2_4 -----
SELECT DISTINCT model,hd,ram FROM laptop
WHERE hd=hd and ram=ram
ORDER BY model DESC;

----- TASK 2_5 -----
SELECT DISTINCT c1.country
FROM Classes c1 INNER JOIN 
 Classes c2 ON c1.country = c2.country INNER JOIN 
 Ships s1 ON c1.class = s1.class INNER JOIN 
 Ships s2 ON c2.class = s2.class
WHERE c1.type = 'bb' AND c2.type = 'bc'
UNION
SELECT DISTINCT c1.country
FROM Classes c1 INNER JOIN 
 Classes c2 ON c1.country = c2.country INNER JOIN 
 Ships s1 ON c1.class = s1.class INNER JOIN 
 Outcomes s2 ON c2.class = s2.ship
WHERE c1.type = 'bb' AND c2.type = 'bc' OR c2.type = 'bb' AND c1.type = 'bc';

----- TASK 2_6 -----
SELECT  DISTINCT maker, p.model
FROM pc as p, product as pr
WHERE p.model=pr.model and p.price<600;

----- TASK 2_7 -----
SELECT  DISTINCT maker, prin.model
FROM printer as prin, product as pr
WHERE prin.model=pr.model and prin.price>300;

----- TASK 2_8 -----
SELECT DISTINCT maker, pс.model, pс.price
FROM pc as pс, product as pr
WHERE pс.model=pr.model
UNION 
SELECT DISTINCT maker, l.model, l.price
FROM product as pr, laptop as l
WHERE pr.model=l.model;

----- TASK 2_9 -----
SELECT DISTINCT maker, pс.model, pс.price
FROM pc as pс, product as pr
WHERE pс.model=pr.model;

----- TASK 2_10 -----
SELECT pr.maker, pr.type, l.model, l.speed
FROM laptop as l, product as pr
WHERE l.model=pr.model and l.speed!>600;

----- TASK 2_11 -----
SELECT ships.name, classes.displacement 
FROM Ships as ships, classes as classes
WHERE ships.class=classes.class;

----- TASK 2_12 -----
SELECT Outcomes.ship, outcomes.battle, Battles.date  
FROM Outcomes as Outcomes, Battles as Battles
WHERE (Outcomes.result='damaged' or Outcomes.result='OK') and outcomes.battle=battles.name;

----- TASK 2_13 -----
SELECT ships.name, classes.country 
FROM Ships as ships, classes as classes
WHERE ships.name=classes.class;

----- TASK 2_14 -----
SELECT DISTINCT trip.plane, company.name as company_name 
FROM trip as trip, company as company
WHERE trip.plane='Boeing' and trip.id_comp=company.id_comp;

----- TASK 2_15 -----
SELECT DISTINCT passenger.name, pass_in_trip.date
FROM passenger as passenger, pass_in_trip as pass_in_trip
WHERE passenger.id_psg=pass_in_trip.id_psg;

----- TASK 2_16 -----
SELECT DISTINCT pc.model, pc.speed, pc.hd 
FROM pc as pc, product as p
WHERE (hd=10 or hd=20) and p.maker='A'
ORDER BY speed;

----- TASK 2_17 -----
SELECT maker, [pc], [laptop], [printer] 
FROM Product 
PIVOT (COUNT(model) 
FOR type IN([pc], [laptop], [printer])
) pvt ;

----- TASK 2_18 -----
SELECT [avg], [11],[12],[14],[15]
FROM (SELECT 'average price' AS 'avg', screen, price FROM Laptop) x
PIVOT
(AVG(price)
FOR screen IN([11],[12],[14],[15])
) pvt;

----- TASK 2_19 -----
SELECT p.maker, laptop.*  
FROM Product as p 
CROSS APPLY (SELECT * FROM Laptop as laptop WHERE p.model=laptop.model) laptop;

----- TASK 2_20 -----
SELECT *
FROM laptop as l1
CROSS APPLY (SELECT MAX(price) as max_price FROM laptop as l2
JOIN  product as p1 ON l2.model=p1.model 
WHERE maker = (SELECT maker FROM product as p2 WHERE p2.model= l1.model)) as task_20;

----- TASK 2_21 -----
SELECT * FROM laptop as l1
CROSS APPLY (SELECT TOP 1 * FROM laptop as l2 
WHERE l1.model < l2.model OR (l1.model = l2.model AND l1.code < l2.code) 
ORDER BY model, code) as task_21
ORDER BY l1.model;

----- TASK 2_22 -----
SELECT * FROM laptop as l1
OUTER APPLY (SELECT TOP 1 * FROM laptop as l2 
WHERE l1.model < l2.model OR (l1.model = l2.model AND l1.code < l2.code) 
ORDER BY model, code) as task_22
ORDER BY l1.model;

----- TASK 2_23 -----
SELECT task_23.* FROM 
(SELECT DISTINCT type FROM product) as p1 
CROSS APPLY 
(SELECT TOP 3 * FROM product as p2 WHERE  p1.type=p2.type ORDER BY p2.model) as task_23;

----- TASK 2_24 -----
SELECT code, name, value FROM laptop
CROSS APPLY (VALUES('speed', speed),
					('ram', ram),
					('hd', hd),
					('screen', screen)
) task_24(name, value)
WHERE code < 4 
ORDER BY code, name, value;


----- HW 3     ----- 
----- TASK 3_1 -----
/*Написати довільний запит з одним СТЕ .*/
WITH cte as
(SELECT maker, model, type, ROW_NUMBER() 
OVER (PARTITION by maker ORDER BY maker) as cn_maker
FROM product)
SELECT * FROM cte;

----- TASK 3_2 -----
/*Написати довільний запит з двома СТЕ (в одному є звертання до іншого)*/
WITH cte as
(SELECT maker, model, type, ROW_NUMBER() 
OVER (PARTITION by maker order by maker) as cn_maker
FROM product), 
cte1 as (SELECT model, speed, ram FROM laptop)
SELECT * FROM cte JOIN cte1 on cte1.model=cte.model;

----- TASK 3_3 -----
SELECT id, name,region_id  from labor_sql.dbo.geography;
/*Написати запит (БД «Geography») котрий вертає регіони першого рівня 
(результат нижче, колонки можуть називатися інакше)*/

----- TASK 3_4 -----
/*Написати запит (БД «Geography») який вертає дерево для конкретного регіону 
(наприклад, Івано-Франківськ) Результат має виглядати наступним чином 
(колонки можуть називатися інакше)*/

----- TASK 3_5 -----
/*Виведіть одним запитом список натуральних чисел від 1 до 10 000.*/
WITH cte as
(
SELECT 1 as n
UNION ALL 
SELECT n +1 FROM cte 
WHERE n <10000
)
SELECT * FROM cte
OPTION (maxrecursion 10000);

----- TASK 3_6 -----
/*Виведіть одним запитом список натуральних чисел від 1 до 100 000.*/
declare @p1 table (k nvarchar(1))
insert @p1(k)
(select 0 union all select 1 union all select 2 union all select 3 union all select 4 union all select 5
 union all select 6 union all select 7 union all select 8 union all select 9)

select cast(p1.k + p1.k + p2.k + p3.k + p4.k + p5.k as int) as n from @p1 p1, @p1 p2, @p1 p3, @p1 p4, @p1 p5 order by 1;

/*DECLARE @n INT = 0;
WHILE @n < 100000
BEGIN SET @n = @n +1	
print @n	
END;*/

----- TASK 3_7 -----
/*Порахуйте запитом скільки субот і неділь в поточному році.*/
DECLARE @Date date
SET @Date = CONVERT(DATE, '2019-01-01');
WITH CTE AS
(SELECT @Date AS [Date], 
        MONTH(@Date) As [Month],
        DATENAME (MONTH,@Date) AS [MonthName],
        DATENAME (DW,@Date) AS [DayName]
    UNION ALL
    SELECT DATEADD(DAY,1,[DATE]) AS [Date],
        MONTH(DATEADD(DAY,1,[DATE])) AS [Month],
        DATENAME (MONTH,DATEADD(DAY,1,[DATE])) AS [MonthName],
        DATENAME (DW ,DATEADD(DAY,1,[DATE])) AS [DayName] 
    FROM CTE 
    WHERE YEAR(DATEADD(DAY,1,[DATE]) )= YEAR(@Date)
       -- AND MONTH(DATEADD(DAY,1,[DATE]))=MONTH(@Date)
)
SELECT * into #t1 from CTE 
WHERE [DayName] IN ('Saturday','Sunday') 
ORDER BY [DATE]
OPTION (MAXRECURSION 367)
  
    SELECT COUNT(*) as coun_ FROM #t1
    --where DayName != 'Sunday'

----- TASK 3_8 -----
SELECT DISTINCT p.maker 
FROM Product p INNER JOIN 
 PC ON p.model = PC.model
WHERE p.maker NOT IN (SELECT ip.maker FROM Laptop il INNER JOIN 
 Product ip ON il.model = ip.model);

----- TASK 3_9 -----
SELECT DISTINCT maker
FROM Product
WHERE type='pc' AND (maker!=ALL(SELECT maker FROM Product WHERE type='laptop')); 

----- TASK 3_10 -----
/*БД «Комп. фірма». Знайдіть виробників, що випускають ПК, 
але не ноутбуки (використати ключове слово ANY). Вивести maker.*/
/*SELECT DISTINCT p.maker 
FROM Product p INNER JOIN 
 PC ON p.model = PC.model
WHERE p.maker != ANY (SELECT ip.maker FROM Laptop il INNER JOIN 
 Product ip ON il.model = ip.model);*/

/*SELECT DISTINCT maker
FROM Product
WHERE type='pc' AND (maker!=ANY(SELECT maker FROM Product WHERE type='laptop')); */

----- TASK 3_11 -----
SELECT DISTINCT p.maker 
FROM Product p INNER JOIN 
pc ON p.model = pc.model
WHERE p.maker IN (SELECT ip.maker FROM Laptop il INNER JOIN 
Product ip ON il.model = ip.model );
 
 ----- TASK 3_12 -----
/*SELECT DISTINCT maker
FROM Product
WHERE type='pc' AND (maker=ALL(SELECT maker FROM Product WHERE type='laptop')); */

/*SELECT DISTINCT p.maker 
FROM Product p INNER JOIN 
 PC ON p.model = PC.model
WHERE p.maker = ALL (SELECT ip.maker FROM Laptop il INNER JOIN 
 Product ip ON il.model = ip.model);*/


 ----- TASK 3_13 -----
SELECT DISTINCT maker
FROM Product
WHERE (maker=ANY(SELECT maker FROM Product WHERE type='PC')) AND type='Laptop'; 

----- TASK 3_14 -----
SELECT DISTINCT maker
FROM Product 
WHERE model IN (SELECT model FROM PC );

----- TASK 3_15 -----
SELECT 
CASE
WHEN country = 'Ukraine' THEN 'Ukraine'
ELSE country 
END as country_, class
FROM classes;

----- TASK 3_16 -----
/*SELECT DISTINCT ship, battle FROM Outcomes as oc, battles as battl
WHERE EXISTS (SELECT ship FROM Outcomes as oa WHERE oa.ship = oc.ship and result = 'damaged') 
and EXISTS (SELECT ship FROM Outcomes as ou WHERE ou.ship=oc.ship 
GROUP BY ship HAVING COUNT(battle)>1);*/

----- TASK 3_17 -----
SELECT DISTINCT maker FROM Product as pr
WHERE EXISTS (SELECT model FROM pc as pc WHERE pc.model = pr.model);

----- TASK 3_18 -----
--??????????
SELECT DISTINCT maker FROM product, pc
WHERE type='printer' 
and maker= SOME (SELECT maker FROM product, pc WHERE type='pc' 
				and product.model=pc.model 
				and speed= (SELECT MAX(speed) FROM pc));

----- TASK 3_19 -----
/*Назви класів кораблів визначати за таблицею Ships, 
якщо його там немає, тоді порівнювати чи його назва 
не співпадає з назвою класу, тобто він є головним ????????*/
SELECT c.class, SUM(outc) 
FROM Classes c LEFT JOIN 
 Ships s ON c.class = s.class LEFT JOIN 
 (SELECT ship, 1 outc 
 FROM Outcomes 
 WHERE result = 'sunk') o ON s.name = o.ship OR 
 c.class = o.ship 
GROUP BY c.class
HAVING SUM(outc) IS NOT NULL;

----- TASK 3_20 -----
SELECT model, price FROM Printer  
WHERE price = (SELECT MAX(price) FROM Printer);

----- TASK 3_21 -----
SELECT DISTINCT pr.type, l.model, l.speed
FROM Product as pr, laptop as l
WHERE l.speed < (SELECT MIN(speed) FROM pc) and pr.type = 'laptop';
      
----- TASK 3_22 -----
--??????????
SELECT DISTINCT pr.maker, p.price, p.color
FROM Product as pr, printer as p
WHERE p.color='y' 
and pr.maker = SOME (SELECT maker FROM product,printer WHERE pr.model=p.model 
and price = (SELECT MIN(price) FROM printer));

----- TASK 3_23 -----
SELECT DISTINCT battle 
FROM (SELECT battle, country 
 FROM (SELECT battle, country 
 FROM Outcomes INNER JOIN 
 Classes ON ship = class 
 UNION ALL
 SELECT battle, country 
 FROM Outcomes o INNER JOIN 
 Ships s ON o.ship = s.name INNER JOIN 
 Classes c ON s.class = c.class
 ) x 
 GROUP BY battle, country 
 HAVING COUNT(*) > 2
 ) y;

----- TASK 3_24 -----
SELECT E.maker, E.pc, E.laptop, R.printer FROM (SELECT C.maker, C.pc, D.laptop 
FROM(SELECT A.maker, B.pc 
FROM (SELECT p1.maker FROM product p1 GROUP BY p1.maker) as A
LEFT JOIN (SELECT p2.maker, COUNT(p2.maker) pc FROM product p2 
GROUP BY p2.maker, p2.type HAVING p2.type='pc') as B ON A.maker=B.maker) as C
LEFT JOIN (SELECT p3.maker, COUNT(p3.maker) laptop FROM product p3
GROUP BY p3.maker, p3.type HAVING p3.type='laptop') as D ON C.maker=D.maker) as E
LEFT JOIN (SELECT p4.maker, COUNT(p4.maker) printer FROM product p4
GROUP BY p4.maker, p4.type HAVING p4.type='printer') as R ON E.maker=R.maker;

----- TASK 3_25 -----
SELECT maker, 
CASE WHEN 
(
SELECT COUNT(*) 
FROM Product
WHERE type='pc'
GROUP BY maker
HAVING maker=P.maker
)IS NOT NULL THEN 'yes('+str((
SELECT COUNT(*) 
FROM Product
WHERE type='pc'
GROUP BY maker
HAVING maker=P.maker),1)+')'
ELSE 'no' 
END AS pc
FROM Product P
GROUP BY maker;

----- TASK 3_26 -----
/*дублі на рядок дати*/
SELECT Income.point, Income.date, SUM(inc) as inc, SUM(out) as out 
FROM Income LEFT JOIN 
 Outcome ON Income.point = Outcome.point AND
 Income.date = Outcome.date
GROUP BY Income.point, Income.date
UNION
SELECT Outcome.point, Outcome.date, SUM(out), SUM(inc)
FROM Outcome LEFT JOIN 
 Income ON Income.point = Outcome.point AND
 Income.date = Outcome.date
GROUP BY Outcome.point, Outcome.date;

----- TASK 3_27 -----
-- задовільняють більше 2 критеріям
SELECT name, numGuns, bore, displacement, type, country, launched, class
FROM (SELECT name, numGuns, bore, displacement, type, country, launched, class,
		CASE WHEN numGuns=8 THEN 1 ELSE 0 END n,
		CASE WHEN bore=15 THEN 1 ELSE 0 END b,
		CASE WHEN displacement=32000 THEN 1 ELSE 0 END d,
		CASE WHEN type='bb' THEN 1 ELSE 0 END t,
		CASE WHEN country='USA' THEN 1 ELSE 0 END c,
		CASE WHEN launched=1915 THEN 1 ELSE 0 END l,
		CASE WHEN class='Kongo' THEN 1 ELSE 0 END cl
FROM (SELECT name, numGuns, bore, displacement, type, country, launched, ships.class 
FROM ships, classes
WHERE ships.class=classes.class) as A) as B
WHERE B.n+B.b+B.d+B.t+B.c+B.l+B.cl > 2;

----- TASK 3_28 -----
/*БД «Фірма прий. вторсировини». Визначіть лідера 
за сумою виплат у змаганні між кожною парою пунктів 
з однаковими номерами із двох різних таблиць – Outcome та Outcome_o 
– на кожний день, коли здійснювався прийом вторинної сировини 
хоча б на одному з них. Вивести: Номер пункту, дата, текст:
 – 'once a day', якщо сума виплат є більшою у фірми зі звітністю
  один раз на день; – 'more than once a day', якщо – у фірми зі 
  звітністю декілька разів на день; – 'both', якщо сума виплат є однаковою.*/
  
  
----- TASK 3_29 -----
SELECT maker, pc.model, type, price FROM product, pc
WHERE product.model=pc.model and maker='B'
	UNION
SELECT maker, laptop.model, type, price FROM product, laptop
WHERE product.model=laptop.model and maker='B'
	UNION
SELECT maker, printer.model, product.type, price FROM product, printer
WHERE product.model=printer.model and maker='B';

----- TASK 3_30 -----
/*БД «Кораблі». Перерахуйте назви головних кораблів, 
що є наявними у БД (врахувати також і кораблі з таблиці Outcomes). 
Вивести: назва корабля, class.*/
 
----- TASK 3_31 -----
SELECT class
FROM (SELECT class 
 FROM Ships 
 UNION ALL 
 SELECT ship 
 FROM Outcomes o 
 WHERE o.ship IN(SELECT class 
 FROM Classes
 )
 ) AS cl
GROUP BY class
HAVING COUNT(class) = 1;

/*SELECT Classes.class
FROM Outcomes RIGHT OUTER JOIN
 Classes ON Outcomes.ship = Classes.class LEFT OUTER JOIN
 Ships ON Classes.class = Ships.class
GROUP BY Classes.class
HAVING (COUNT(COALESCE (Outcomes.ship, Ships.name)) = 1);*/

----- TASK 3_32 -----
/*БД «Кораблі». Знайдіть назви усіх кораблів з БД, 
про які можна однозначно сказати, що вони були спущені
 на воду до 1942 р. Вивести: назву кораблів.*/





 
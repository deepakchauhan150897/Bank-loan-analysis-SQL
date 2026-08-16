show tables;
select count(*) AS total_rows
From finance_1;
select count(*) AS total_rows
From finance_2;
select Id, count(*) As count
From finance_1
Group by Id
Having count(*)>1;
select Id, Count(*) As Count
From finance_2
Group by Id
Having count(*)>1;
describe finance_1;
describe finance_2;
SELECT COUNT(*) AS matching_ids
FROM finance_1 f1
INNER JOIN finance_2 f2
    ON f1.id = f2.id;

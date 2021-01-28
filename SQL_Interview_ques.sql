# getNthHighestSalary(N INT) RETURNS INT

select distinct Salary from 
          (select Salary, dense_rank() over(order by Salary DESC) as drnk
          from Employee) t1
      where drnk = N

	
# second highest salary

SELECT max(Salary) as SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT max(Salary) FROM Employee)


# returns duplicate columns:
 
 select ID, count(ID)
	from Emp
	group by ID
	having count(ID) > 1
	
 
# delete duplicates: deletes duplicates rows and keeps the lowest ids;

 
 delete e1 from emp e1 inner join emp e2 
 where e1.id > e2.id and e1.name = e2.name
 
	
# Department top 3 salaries

select Department, Employee, Salary from (
    select d.Name as Department, e.Name as Employee, e.Salary as Salary,
    dense_rank() over(partition by d.Name order by e.Salary DESC) as rk
    from Employee e inner join Department d
    on e.DepartmentId = d.Id) t
where rk <= 3	

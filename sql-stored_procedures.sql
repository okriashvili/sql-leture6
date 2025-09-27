-- შენახული პროცედურები / stored procedures
-- სერვერზე შენნახული და შესრულებადი კოდის ბლოკი, რომელიც სამომავლოდ შეგვიძლია გამოვიყენოთ
-- მაგრამ, შენახული პროცედურა არ აბრუნებს არაფერს, არც მონაცემებს. პროცედურის დროს ხდება უშუალოდ ოპერაციის განხორციელება
-- უპირატესობა ისაა რომ ხშირად არ გვიწევს იგივე მოთხოვ ნების დაწერა

-- პროცედურის შექმნის სინტაქსი:
-- 1: create prodecures ბრძანება
-- 2: პროცედურის დასახელება() ფრჩხილებში შეგვიძლია არგუმენტები გადავცეთ
-- 3: language plpgsql AS
-- language plpgsql არის ენა, რომლითაც ვწერთ ამ კოდს
-- 4: $$ begin - 
-- დოლარის ნიშნებშ ვწერთ begin და end საკვანძო სიტყვებს რომლებშიც უშუალოდ ვწერთ ჩვენს ბრძანებას/მოთხოვნას
-- 5: end $$

-- create procedure increase_salary() 
-- language plpgsql AS
-- $$ 
-- BEGIN
-- 	update employees set salary = salary * 1.1 WHERE salary < 50000;
-- END
-- $$

-- პროცედურის ასამოქმედებლად კი საჭიროა გამოვიძახოთ call ბრძანებით
-- call increase_salary()
-- შეგვიძლია ფილტრაცია გავუკეთოთ და ამ მონაცემებზე გამოვიძახოთ პროცედურა



-- როგორცც ვიცით პროცედურას შეგვიძია გადავცეთ არგუმენტებიც:
-- თუკი დასაქმებულს არ აქვს მინიჭებული დეპარტამენტი, 
-- ეს პროცედურა მიანიჭებს მას იმ დეპარტამენტს რომლის აიდისაც გადავცემთ პროცედურის გამოძახებისას
-- create procedure assign_department(emp_id INT)
-- language plpgsql AS
-- $$
-- BEGIN
-- 	update employees set department_id = emp_id where employees.department_id is null;
-- END
-- $$
-- call assign_department(2)


-- create procedure set_salary(emp_id INT)
-- language plpgsql AS
-- $$
-- BEGIN
-- 	update employees set salary = 35000 where employee_id = emp_id;
-- END
-- $$
-- drop procedure set_salary
-- call set_salary(4)

-- create procedure inc_salary(amount INT, emp_id INT)
-- language plpgsql AS
-- $$
-- BEGIN
-- 	update employees set salary = salary + amount where employee_id = emp_id;
-- END
-- $$
-- call inc_salary(10000, 4)


-- drop procedure 

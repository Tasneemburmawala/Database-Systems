
--
-- Query 1 having 2 relations(Join)---Display all the University info and Students info studying in respective University(University Name,City,State,Student ID,Student Name,Email Address ,Major)
--

SELECT U.University_Name, U.city,U.State, S.Student_id,S.Student_name,S.Email_Address,S.S_major FROM University AS U INNER JOIN students AS S ON U.University_ID=S.S_University_ID;


--
-- Query 2 having 2 relations(Join)---Display  University info and Students info of student named "muffa"(University Name,City,State,Student ID,Student Name,Email Address ,Major)
--


SELECT U.University_Name, U.city,U.State, S.Student_id,S.Student_name,S.Email_Address,S.S_major FROM University AS U INNER JOIN students AS S ON U.University_ID=S.S_University_ID WHERE S.Student_name='muffa';

--
-- Query 3 having 3 relations(Join)---Display  student info ,standard book info and date when bought and quantity info related to the students who have bought standard book from BookStore with ID 1
--


SELECT S.Student_name,S.Email_Address,S.S_major,B.ISBN,B.textbook_name,B.Author,B.Std_price,buy.Date_Sold,buy.Qty_bought FROM students AS S INNER JOIN standard_books AS B INNER JOIN buy ON S.Student_ID=buy.B_Student_ID AND B.ISBN=buy.B_Book_Code AND B.S_BookStore_ID=buy.B_BookStore_ID where buy.B_BookStore_ID='1' AND buy.B_Tpe_Textbook='Standard';


--
-- Query 4 having 2 relations(Join) and Aggregation,Group by,having and order by---Display University name and id and count of Standard Books only when more than 1 Standard book is available 
--

Select U.university_name,C.C_University_ID, COUNT(C.C_Type_Textbook) AS StandardBooks FROM university AS U INNER JOIN courses AS C ON U.University_ID=C.C_University_ID where C.C_Type_Textbook='Standard' Group BY C.C_University_ID HAVING COUNT(C.C_Type_Textbook)>1 ORDER BY C.C_University_ID DESC;


--
-- Query 5 having 2 relations(Join) and Aggregation,Group by,having and order by---Display Student name and no of books bought by student only if student bought more than 1 book
--

Select S.Student_name,B.B_Student_ID, Sum(B.Qty_bought) AS Books_bought FROM Students AS S INNER JOIN buy AS B ON S.Student_id = B.B_Student_ID Group BY B.B_Student_ID HAVING SUM(B.Qty_bought)>1 ORDER BY B.B_Student_ID DESC;




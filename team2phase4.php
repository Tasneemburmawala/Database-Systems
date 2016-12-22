<?php
// Student Name:Tasneem Burmawala


$connection = mysqli_connect("localhost", "root", "","university_bookstore");
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

?>
<html>
<head>
<title>BookStore Database-Phase 4</title>
<style>
table		{ border-right:1px solid #ccc; border-bottom:1px solid #ccc; }
th	{ background:#eee; padding:5px; border-left:1px solid #ccc; border-top:1px solid #ccc; }
td	{ padding:5px; border-left:1px solid #ccc; border-top:1px solid #ccc; }
</style>

</head>
<body>
<center>
<h2> BookStore Database - Phase 4</h2>
</center>
<form action=" " method="post">
<p> Query1: </p>
<p> English query : Display all the University info and Students info studying in respective University. <br> </p>
<div> SQL : SELECT U.University_Name, U.city,U.State, S.Student_id,S.Student_name,S.Email_Address,S.S_major FROM University AS U INNER JOIN students AS S ON U.University_ID=S.S_University_ID </div>
<br>
<input type="submit" name="q1" value="Query1"/>
<?php 
if(isset($_POST['q1']))
{
$ses_sql1="SELECT U.University_Name, U.city,U.State, S.Student_id,S.Student_name,S.Email_Address,S.S_major FROM University AS U INNER JOIN students AS S ON U.University_ID=S.S_University_ID";
$row1 =mysqli_query($connection, $ses_sql1);

if (mysqli_num_rows($row1) > 0) {
echo "<p><table >
  <tr>
    <th >University Name </th>
    <th >City</th>
    <th >State</th>
    <th >Student ID</th>
	<th >Student Name </th>
    <th >Email Address</th>
    <th >Major</th>
   
  </tr>";


    // output data of each row
    while($result1 = mysqli_fetch_assoc($row1)) {
        echo "<tr>";
		echo "<td>".$result1['University_Name']."</td>";
		echo "<td>".$result1['city']."</td>";
		echo "<td>".$result1['State']."</td>";
		echo "<td>".$result1['Student_id']."</td>";
		echo "<td>".$result1['Student_name']."</td>";
		echo "<td>".$result1['Email_Address']."</td>";
		echo "<td>".$result1['S_major']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query2: </p>
<p> English query :Display  University info and Students info of student named "muffa" <br> </p>
<div> SQL : SELECT U.University_Name, U.city,U.State, S.Student_id,S.Student_name,S.Email_Address,S.S_major FROM University AS U INNER JOIN students AS S ON U.University_ID=S.S_University_ID WHERE S.Student_name='muffa' </div>
<br>
<input type="submit" name="q2" value="Query2"/>
<?php 
if(isset($_POST['q2']))
{
$ses_sql2="SELECT U.University_Name, U.city,U.State, S.Student_id,S.Student_name,S.Email_Address,S.S_major FROM University AS U INNER JOIN students AS S ON U.University_ID=S.S_University_ID WHERE S.Student_name='muffa'";
$row2 =mysqli_query($connection, $ses_sql2);
if (mysqli_num_rows($row2) > 0) {
echo "<p><table >
  <tr>
    <th >University Name </th>
    <th >City</th>
    <th >State</th>
    <th >Student ID</th>
	<th >Student Name </th>
    <th >Email Address</th>
    <th >Major</th>
   
  </tr>";


    // output data of each row
    while($result2 = mysqli_fetch_assoc($row2)) {
        echo "<tr>";
		echo "<td>".$result2['University_Name']."</td>";
		echo "<td>".$result2['city']."</td>";
		echo "<td>".$result2['State']."</td>";
		echo "<td>".$result2['Student_id']."</td>";
		echo "<td>".$result2['Student_name']."</td>";
		echo "<td>".$result2['Email_Address']."</td>";
		echo "<td>".$result2['S_major']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query3: </p>
<p> English query : Display  student info ,standard book info and date when bought and quantity info related to the students who have bought standard book from BookStore with ID 1 <br> </p>
<div> SQL : SELECT S.Student_name,S.Email_Address,S.S_major,B.ISBN,B.textbook_name,B.Author,B.Std_price,buy.Date_Sold,buy.Qty_bought FROM students AS S INNER JOIN standard_books AS B INNER JOIN buy ON S.Student_ID=buy.B_Student_ID AND B.ISBN=buy.B_Book_Code AND B.S_BookStore_ID=buy.B_BookStore_ID where buy.B_BookStore_ID='1' AND buy.B_Tpe_Textbook='Standard' </div>
<br>
<input type="submit" name="q3" value="Query3"/>
<?php 
if(isset($_POST['q3']))
{
$ses_sql3="SELECT S.Student_name,S.Email_Address,S.S_major,B.ISBN,B.textbook_name,B.Author,B.Std_price,buy.Date_Sold,buy.Qty_bought FROM students AS S INNER JOIN standard_books AS B INNER JOIN buy ON S.Student_ID=buy.B_Student_ID AND B.ISBN=buy.B_Book_Code AND B.S_BookStore_ID=buy.B_BookStore_ID where buy.B_BookStore_ID='1' AND buy.B_Tpe_Textbook='Standard'";
$row3 =mysqli_query($connection, $ses_sql3);

if (mysqli_num_rows($row3) > 0) {
echo "<p> <table >
  <tr>
    <th >Student Name </th>
    <th >Email Address </th>
    <th >Major</th>
    <th >ISBN</th>
	<th >Textbook Name </th>
	<th >Author </th>
    <th >Standard Book Price</th>
    <th >Date Sold</th>
	<th >Quantity bought</th>
   
  </tr>";


    // output data of each row
    while($result3 = mysqli_fetch_assoc($row3)) {
        echo "<tr>";
		echo "<td>".$result3['Student_name']."</td>";
		echo "<td>".$result3['Email_Address']."</td>";
		echo "<td>".$result3['S_major']."</td>";
		echo "<td>".$result3['ISBN']."</td>";
		echo "<td>".$result3['textbook_name']."</td>";
		echo "<td>".$result3['Author']."</td>";
		echo "<td>".$result3['Std_price']."</td>";
		echo "<td>".$result3['Date_Sold']."</td>";
		echo "<td>".$result3['Qty_bought']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query4: </p>
<p> English query : Display University name and id and count of Standard Books only when more than 1 Standard book is available <br> </p>
<div> SQL : Select U.university_name,C.C_University_ID, COUNT(C.C_Type_Textbook) AS StandardBooks FROM university AS U INNER JOIN courses AS C ON U.University_ID=C.C_University_ID where C.C_Type_Textbook='Standard' Group BY C.C_University_ID HAVING COUNT(C.C_Type_Textbook)>1 ORDER BY C.C_University_ID  </div>
<br>
<input type="radio" name="order" value="Descending"> Descending
<input type="radio" name="order" value="Ascending"> Ascending <br> <br>
<input type="submit" name="q4" value="Query4"/><br>
<?php 
if(isset($_POST['q4']))
{
	if (@$_POST['order'] == null){
		echo "Please select radio button";
		
	}
	else{
	if($_POST['order'] == 'Descending')
	{
		$ses_sql4="Select U.university_name,C.C_University_ID, COUNT(C.C_Type_Textbook) AS StandardBooks FROM university AS U INNER JOIN courses AS C ON U.University_ID=C.C_University_ID where C.C_Type_Textbook='Standard' Group BY C.C_University_ID HAVING COUNT(C.C_Type_Textbook)>1 ORDER BY C.C_University_ID DESC";
	}
	else{
		if($_POST['order'] == 'Ascending'){
		$ses_sql4="Select U.university_name,C.C_University_ID, COUNT(C.C_Type_Textbook) AS StandardBooks FROM university AS U INNER JOIN courses AS C ON U.University_ID=C.C_University_ID where C.C_Type_Textbook='Standard' Group BY C.C_University_ID HAVING COUNT(C.C_Type_Textbook)>1 ORDER BY C.C_University_ID ASC";
	
		}
	}
	
$row4 =mysqli_query($connection, $ses_sql4);


if (mysqli_num_rows($row4) > 0) {
echo "<p> <table >
  <tr>
    <th >University Name </th>
    <th >University ID </th>
    <th >No of Standard books Available</th>
    
   
  </tr>";


    // output data of each row
    while($result4 = mysqli_fetch_assoc($row4)) {
        echo "<tr>";
		echo "<td>".$result4['university_name']."</td>";
		echo "<td>".$result4['C_University_ID']."</td>";
		echo "<td>".$result4['StandardBooks']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}}?>
<p> Query5: </p>
<p> English query : Display Student name and no of books bought by student only if student bought more than one book <br> </p>
<div> SQL : Select S.Student_name,B.B_Student_ID, Sum(B.Qty_bought) AS Books_bought FROM Students AS S INNER JOIN buy AS B ON S.Student_id = B.B_Student_ID Group BY B.B_Student_ID HAVING SUM(B.Qty_bought)>1 ORDER BY B.B_Student_ID  </div>
<br>
<input type="radio" name="order" value="Descending"> Descending
<input type="radio" name="order" value="Ascending"> Ascending <br> <br>
<input type="submit" name="q5" value="Query5"/><br>
<?php 
if(isset($_POST['q5']))
{
	if (@$_POST['order'] == null){
		echo "Please select radio button";
		
	}
	else{
	if($_POST['order'] == 'Descending')
	{
		$ses_sql5="Select S.Student_name,B.B_Student_ID, Sum(B.Qty_bought) AS Books_bought FROM Students AS S INNER JOIN buy AS B ON S.Student_id = B.B_Student_ID Group BY B.B_Student_ID HAVING SUM(B.Qty_bought)>1 ORDER BY B.B_Student_ID DESC";
	}
	else{
		if($_POST['order'] == 'Ascending'){
		$ses_sql5="Select S.Student_name,B.B_Student_ID, Sum(B.Qty_bought) AS Books_bought FROM Students AS S INNER JOIN buy AS B ON S.Student_id = B.B_Student_ID Group BY B.B_Student_ID HAVING SUM(B.Qty_bought)>1 ORDER BY B.B_Student_ID ASC";
	
		}
	}
	
$row5 =mysqli_query($connection, $ses_sql5);


if (mysqli_num_rows($row5) > 0) {
echo "<p> <table >
  <tr>
    <th >Student Name </th>
    <th >Student ID </th>
    <th >Books Bought by Student</th>
    
   
  </tr>";


    // output data of each row
    while($result5 = mysqli_fetch_assoc($row5)) {
        echo "<tr>";
		echo "<td>".$result5['Student_name']."</td>";
		echo "<td>".$result5['B_Student_ID']."</td>";
		echo "<td>".$result5['Books_bought']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}}?>
<p> Query6: </p>
<p> English query : Display all the Standard textbooks info of a particular author available at BookStore. <br> </p>
<div> SQL :Select `Textbook_Name`,`Author`,`No_of_books_available`,`S_Bookstore_ID` from Standard_Books,bookstores where Author LIKE '%Dr Elmasari%' and S_Bookstore_ID=Bookstore_ID order by S_Bookstore_ID ASC </div>
<br>

<input type="submit" name="q6" value="Query6"/><br>
<?php 
if(isset($_POST['q6']))
{
	
$ses_sql6="Select `Textbook_Name`,`Author`,`No_of_books_available`,`S_Bookstore_ID` from Standard_Books,bookstores where Author LIKE '%Dr Elmasari%' and S_Bookstore_ID=Bookstore_ID order by S_Bookstore_ID ASC";
	
$row6 =mysqli_query($connection, $ses_sql6);


if (mysqli_num_rows($row6) > 0) {
echo "<p> <table >
  <tr>
    <th >BookStore ID</th>
    <th >Textbook Name </th>
    <th >Author</th>
    <th >No of books available</th>
	
    
   
  </tr>";


    // output data of each row
    while($result6 = mysqli_fetch_assoc($row6)) {
        echo "<tr>";
		echo "<td>".$result6['S_Bookstore_ID']."</td>";
		echo "<td>".$result6['Textbook_Name']."</td>";
		echo "<td>".$result6['Author']."</td>";
		echo "<td>".$result6['No_of_books_available']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query7: </p>
<p> English query :Display Customized Textbooks info with code "121" and University name to which it belongs. <br> </p>
<div> SQL : Select `University_Name`,`Textbook_Name`,`Author`,`No_of_books_available` from customized_books,university where SKU_Code='121' and C_Bookstore_ID=U_Bookstore_ID </div>
<br>

<input type="submit" name="q7" value="Query7"/><br>
<?php 
if(isset($_POST['q7']))
{
	
$ses_sql7="Select `University_Name`,`Textbook_Name`,`Author`,`No_of_books_available` from customized_books,university where SKU_Code='121' and C_Bookstore_ID=U_Bookstore_ID";
	
$row7 =mysqli_query($connection, $ses_sql7);


if (mysqli_num_rows($row7) > 0) {
echo "<p> <table >
  <tr>
    <th >University Name</th>
    <th >Textbook Name </th>
    <th >Author</th>
    <th >No of books available</th>
	
    
   
  </tr>";


    // output data of each row
    while($result7 = mysqli_fetch_assoc($row7)) {
        echo "<tr>";
		echo "<td>".$result7['University_Name']."</td>";
		echo "<td>".$result7['Textbook_Name']."</td>";
		echo "<td>".$result7['Author']."</td>";
		echo "<td>".$result7['No_of_books_available']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query8: </p>
<p> English query : Display all Standard Textbooks available at a BookStore. <br> </p>
<div> SQL : Select `Textbook_Name`,`Author`,`University_Name` from Standard_Books,bookstores,university where S_Bookstore_ID='1' and S_Bookstore_ID=Bookstore_ID and U_BookStore_ID=Bookstore_ID</div>
<br>

<input type="submit" name="q8" value="Query8"/><br>
<?php 
if(isset($_POST['q8']))
{
	
$ses_sql8="Select `Textbook_Name`,`Author` ,`University_Name` from Standard_Books,bookstores,university where S_Bookstore_ID='1' and S_Bookstore_ID=Bookstore_ID and U_BookStore_ID=Bookstore_ID";
	
$row8 =mysqli_query($connection, $ses_sql8);


if (mysqli_num_rows($row8) > 0) {
echo "<p> <table >
  <tr>
    <th >University Name</th>
    <th >Textbook Name </th>
    <th >Author</th>
  </tr>";


    // output data of each row
    while($result8 = mysqli_fetch_assoc($row8)) {
        echo "<tr>";
		echo "<td>".$result8['University_Name']."</td>";
		echo "<td>".$result8['Textbook_Name']."</td>";
		echo "<td>".$result8['Author']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query9: </p>
<p> English query : Show all the books name rented by a student whose Student ID is 1004 from BookStore ID is 1 <br> </p>
<div> SQL : Select Textbook_Name from standard_books,rent,students,university where ISBN=R_ISBN and R_Student_ID='1004' and R_BookStore_ID=1 and R_Student_ID=Student_ID and R_BookStore_ID=U_BookStore_ID </div>
<br>
<input type="submit" name="q9" value="Query9"/>
<?php 
if(isset($_POST['q9']))
{
$ses_sql9="Select Textbook_Name,Student_name from standard_books,rent,students,university where ISBN=R_ISBN and R_Student_ID='1004' and R_BookStore_ID=1 and R_Student_ID=Student_ID and R_BookStore_ID=U_BookStore_ID";
$row9 =mysqli_query($connection, $ses_sql9);
if (mysqli_num_rows($row9) > 0) {
echo "<p><table >
  <tr>
    <th >Student Name</th>
    <th >Rented TextBook Name</th>
    
   
  </tr>";


    // output data of each row
    while($result9 = mysqli_fetch_assoc($row9)) {
        echo "<tr>";
		echo "<td>".$result9['Student_name']."</td>";
		echo "<td>".$result9['Textbook_Name']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>
<p> Query10: </p>
<p> English query :Display all the Textbooks name available for Fall Semester for specific Major at a particular University. <br> </p>
<div> SQL : Select `C_Textbook_Name`,`C_Major`,`C_Type_Textbook`,`Semester_Name` from courses,semesters,university where C_Major='Computer Science' and  Semester_Name='Fall' and C_University_ID=1 and C_University_ID=University_ID and C_Semester_ID=Semester_ID
 </div>
<br>

<input type="submit" name="q10" value="Query10"/><br>
<?php 
if(isset($_POST['q10']))
{
	
$ses_sql10="Select `C_Textbook_Name`,`C_Major`,`C_Type_Textbook`,`Semester_Name` from courses,semesters,university where C_Major='Computer Science' and  Semester_Name='Fall' and C_University_ID=1 and C_University_ID=University_ID and C_Semester_ID=Semester_ID";
	
$row10 =mysqli_query($connection, $ses_sql10);


if (mysqli_num_rows($row10) > 0) {
echo "<p> <table >
  <tr>
    
    <th >Textbook Name </th>
    <th >Major</th>
    <th >Type of Textbook</th>
	<th >Semester Name</th>
    
   
  </tr>";


    // output data of each row
    while($result10 = mysqli_fetch_assoc($row10)) {
        echo "<tr>";
		echo "<td>".$result10['C_Textbook_Name']."</td>";
		echo "<td>".$result10['C_Major']."</td>";
		echo "<td>".$result10['C_Type_Textbook']."</td>";
		echo "<td>".$result10['Semester_Name']."</td>";
		echo "</tr>";
		
		
		}
} else {
    echo "0 results";
	
} 
echo "</table> </p>";
}?>


</form>
</body>
</html>	

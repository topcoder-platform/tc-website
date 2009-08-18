<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 550;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="515215" message="Discuss this article" />
</div>

<span class="bigTitle">A Crash Course in SQL, Part 2</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21684580" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>In this last installment of this article series on relational databases, we'll take a look at some more of the "core" SQL concepts any good programmer needs to know, and we'll take a look at how to interact with relational databases using Java.  We'll continue to use the Oracle Express database we developed in the first two articles:  <i>A Crash Course in Relational Databases, <a href="/tc?module=Static&d1=features&d2=032607" target="_blank">Part 1</a> &amp; <a href="/tc?module=Static&d1=features&d2=032907" target="_blank">Part 2</a></i>.  In addition, we'll expand on the concepts we started in the last article, <i>A Crash Course in SQL, <a href="/tc?module=Static&d1=features&d2=041907" target="_blank">Part 1</a></i>, and we'll learn some more SQL querying techniques that you'll be able to add to your bag of tricks.  Finally, we'll review some best practices which you can put to use as you begin developing database applications.</p>

<p><span class="bodySubtitle">I. The UPDATE statement</span><br>
We use the UPDATE statement to update data in our database.  UPDATE statements can be written in several ways, depending on what you're trying to accomplish, but the basic form is as follows:</p>

<pre class="code">
UPDATE	&lt;table name&gt;
SET		&lt;column_name1&gt; = &lt;value1&gt;
		&lt;column_name2&gt; = &lt;value2&gt;                            
		.
		.
WHERE  	&lt;conditions&gt;
</pre>

<p>You should take special caution when updating data in your database to ensure that your WHERE clause is correct.  Failure to do so can result in rows not being updated correctly, or the <strong>wrong</strong> rows being updated.  Recall that with Oracle, the results from your interactive SQL commands aren't made permanent in the database until you issue a COMMIT.  This is a really nice feature because, if you make a mistake in your UPDATE statement and update the wrong records, then you can just issue a ROLLBACK command and the changes are immediately undone.  Please keep in mind when working with other databases, though, that you can't assume that your statements can be rolled back.  For example, when working with Microsoft SQL Server, your statements are made permanent the moment you execute them unless you explicitly wrap them in a transaction.  In other words, Oracle wraps all your statements in an implicit transaction by default, whereas other databases do not.  We'll see a caveat, however, when we look at how to use Java to interact with our database later in the article.  The caveat is that the JDBC driver sets autocommit to true by default, meaning that as you execute SQL statements in Java the results are committed immediately.  We can, of course, change this autocommit property to false, which is strongly recommended.</p>

<p>Before we look at an UPDATE statement example, let's create a copy of our coder table so that we can have a "scratch" table with which to work.  We'll be able to make updates to this table without worrying about messing up our real coder table.  Oracle offers a nifty command to create a copy of a table, known as the "CREATE TABLE AS" command.  Here's how to create a copy of the coder table including the records.</p>

<pre class="code">
SQL&gt; create table topcoder.coder2 as
  2  select * from topcoder.coder
  3  ;

Table created.
</pre>

<p>Now if we do a select count(*) from the topcoder.coder2 table, we'll see that all of our coder records have been loaded.</p>

<pre class="code">
SQL&gt; select count(*) from topcoder.coder2;

  COUNT(*)
----------
      5614
</pre>

<p>One nice trick you can use, if you just want to create a copy of a table <strong>without</strong> copying the records, is to supply a WHERE CLAUSE of "where 0=1". Note that when you use the CREATE TABLE AS command, the foreign key constraints, indexes, etc. are <strong>not</strong> copied from the original table. </p>

<p>Now that we have our coder2 scratch table created, we're ready to try some UPDATE statements.  As an example, let's assume you're not happy with your algorithm rating and would like to change it.  Have you ever wondered what it would be like to be a red coder?  Here's an update statement that you can use to change your algorithm rating (this is obviously just for illustrative purposes).  You can change 'dcp' to your handle:</p>

<pre class="code">
SQL&gt; update topcoder.coder2
  2  set    alg_rating = 2200
  3  where  handle     = 'dcp'
  4  ;

1 row updated.

SQL&gt; commit;

Commit complete. 
</pre>

<p>Don't forget to issue the commit statement or, when you exit SQL*Plus, your results will be rolled back (assuming you don't commit later).</p>

<p>All the things you learned about queries in the last article can be applied to UPDATE statements.  For example, let's update all records for Irish coders to the maximum rating across all active coders:</p>

<pre class="code">
SQL&gt; update    topcoder.coder2
  2  set       alg_rating   = (select    max(alg_rating)
  3                            from      topcoder.coder2)
  4  where     country_name = 'Ireland'
  5  ;

5 rows updated.

SQL&gt; commit;

Commit complete.
</pre>

<p>What we did in this example was to use a subquery to determine the value to which to set the alg_rating column.  Now if we query our coder2 table again, we'll see that all records for Irish coders have the same alg_rating.</p>

<pre class="code">
SQL&gt; select
  2  distinct alg_rating
  3  from     topcoder.coder2
  4  where    country_name = 'Ireland'
  5  ;

ALG_RATING
----------
      3529
</pre>

<p>The key thing to realize when writing SQL is that you have to switch over to "set-based thinking".  By that I mean that you want to try to do things in the database with as few SQL statements as you can, because repeatedly running SQL statements is a lot of overhead for the database, and will likely incur the wrath of the DBAs in your company.  For example, let's assume that we were working in a high-level language such as C++ and our coder information was stored in an array.  To do the same update as shown above in C++, we would probably write a loop to iterate through the coder records and update the array values for the Irish coders.  Or, in C++ we could use a multimap structure that contained country as its key, and all the coders for each country as its values.  In either case, however, we would have to do some form of iteration to update the values. </p>

<p>The difference with SQL, as we've just seen, is that you can do that type of update with one statement, and that's what I mean by "set-based thinking".  On the other hand, that's not to say we don't ever need to use loops when writing SQL.  If you look at the code for the PL/SQL package provided for the RSS_UTIL package in the <a href="/tc?module=Static&d1=features&d2=032607" target="_blank">first</a> article you will see that we are using loops in several places.  But the key thing to remember is that you don't want to use a loop unless you have to.  We could have done this SQL update above the same way as we would in C++, that is, by using a loop to iterate through all the coder records and updating the ones in which we're interested.  But that method would be extremely inefficient compared to the single UPDATE statement.</p>

<p>Oracle provides several useful functions/operators you can use when updating (or querying) your data.  Some of the more common ones you'll use frequently are UPPER, LOWER, the concatenation operator (||), SUBSTR, and  TO_CHAR.  Most of these are pretty obvious if you have a coding background, so let's just look at a simple example to update the countries in our coder2 table to uppercase and append the string " TOPCODER" to the end:</p>

<pre class="code">
SQL&gt; update    topcoder.coder2
  2  set       country_name = upper(country_name) || ' TOPCODER'
  3  ;

5614 rows updated.

SQL&gt; commit;

Commit complete.
</pre>

<p>Another form of the UPDATE statement that you'll find useful is the ability to do update multiple columns using a SELECT statement.  This form also uses a subquery, but it is a bit different from the subquery example we looked at earlier because we'll be using the SELECT statement to provide the values for <strong>every</strong> column we are updating.  For example, now that we've thoroughly messed up the country_name and alg_rating values in our coder2 table, let's get the data back in sync with the original coder table.  While it would be simple enough to just drop and recreate the coder2 table using the CREATE TABLE AS technique, we'll look at this example just so you get the idea of how to do it with an UPDATE statement:</p>
 
<pre class="code">
SQL&gt; update   topcoder.coder2 t1
  2  set     (country_name
  3          ,alg_rating) = (select    country_name
  4                                   ,alg_rating
  5                          from      topcoder.coder  t2
  6                          where     t1.coder_id = t2.coder_id)
  7  where exists
  8          (select    country_name
  9                    ,alg_rating
 10           from      topcoder.coder  t2
 11           where     t1.coder_id = t2.coder_id)
 12  ;

5614 rows updated.

SQL&gt; commit;

Commit complete.
</pre>

<p>As you can see, the inner select statement is a correlated subquery which we learned about in <a href="/tc?module=Static&d1=features&d2=041907" target="_blank">Part 1</a> of <i>A Crash Course in SQL</i>.  One thing to be aware of in this example is the WHERE EXISTS clause.  That clause is very important because if you leave it out, then any records in your coder2 table that don't have a corresponding record in your coder table will get NULL stored for their country_name and alg_rating.  In this example it didn't matter because we had the same number of records in both tables.  But you should include the WHERE EXISTS any time you are doing this type of update if there is a chance that you won't get a matching row in the source table (i.e. the source table is the coder table in the example above).</p>

<p><span class="bodySubtitle">II. The INSERT statement</span><br>
The INSERT statement is a close cousin of the UPDATE statement.  We use it to insert records into the database.  Most of the tricks we learned about UPDATE statements can be applied to the insert statement as well.  But let's start with the basic format of an INSERT statement:</p>

<pre class="code">
INSERT INTO	&lt;table name&gt; (
      &lt;column_name1&gt;
      &lt;column_name2&gt;		
      .
      .
) VALUES (
      &lt;column1_value&gt;		
      &lt;column2_value&gt;		
      .
      .
)
</pre>

<p>We've seen plenty of examples of INSERT statements throughout this article series, but now let's look at a formal example:</p>

<pre class="code">
SQL&gt; insert into topcoder.coder (
  2      coder_id
  3     ,handle
  4     ,country_name
  5     ,alg_rating
  6     ,alg_vol
  7     ,alg_num_ratings
  8  ) values (
  9      1234
 10     ,'foobar'
 11     ,'Netherlands'
 12     ,'1989'
 13     ,'234'
 14     ,'192'
 15  );

1 row created.

SQL&gt; commit;

Commit complete.
</pre>

<p>Note that the column list is not required.  In other words, you could have written the above INSERT statement like this:</p>

<pre class="code">
insert into topcoder.coder 
values (
     1234
    ,'foobar'
    ,'Netherlands'
    ,'1989'
    ,'234'
    ,'192'
);
</pre>

<p>The way this form of the INSERT statement works is that the values in your values clause correspond to the order of the columns in the table.  So the 1234 corresponds to coder_id, 'foobar' corresponds to handle, etc.  This is an extremely bad way to write an INSERT statement, because if the order of the columns in the table ever changes your code will break -- if you're lucky. If you're unlucky, the values will be inserted into the wrong columns but your code will continue to work.  Then you end up with bad data in the database but you probably won't find out until your irate users discover it.  The moral here is to always specify a column list.  The only time I use the second form of the INSERT statement is if I'm writing interactive (i.e. "on the fly") SQL to manipulate data.  But you would never want to use this form of an INSERT statement when writing a PL/SQL module or in a production piece of SQL code.</p>

<p>Another powerful way to use the INSERT statement is to use it in conjunction with a SELECT  statement.  This technique works much like the CREATE TABLE AS command we saw previously.  So let's go ahead and truncate our coder2 table, and then insert all records from our coder table where the handle begins with the letter 'D' (without regard for case). </p>

<pre class="code">
SQL&gt; truncate table topcoder.coder2;

Table truncated.

SQL&gt; insert into topcoder.coder2 (
  2            coder_id
  3           ,handle
  4           ,country_name
  5           ,alg_rating
  6           ,alg_vol
  7           ,alg_num_ratings
  8  )
  9  select    coder_id
 10           ,handle
 11           ,country_name
 12           ,alg_rating
 13           ,alg_vol
 14           ,alg_num_ratings
 15  from      topcoder.coder
 16  where     lower(handle) like 'd%'
 17  ;

320 rows created.

SQL&gt;
SQL&gt; commit;

Commit complete.
</pre>

<p>Note that we introduced another tool you can use with queries, which is the LIKE clause.  The way the LIKE clause works is that you can use the % character as a wildcard to match any character.  So the 'd%' above means match any handle starting with d followed by 0 or more characters.  You can put the % character anywhere in the expression.  So if we wanted to match an expression that begins with 'ab' and ends with 'yz', we could use 'ab%yz'.  The "lower(handle)" part of the WHERE clause above just converts the handle to lowercase before we do the comparison, effectively making our search case-insensitive.</p>

<p>One thing to be especially aware of when writing production SQL code is that whenever you use a function in your WHERE clause, such as the LOWER function, it can cause the optimizer not to use an index on your query, which can cause poor query performance.  However, with Oracle8i and later, we can create function-based indexes, which alleviate this problem.  As an example, we could create a function index on the handle column like this:</p>

<pre class="code">
SQL&gt; create unique index topcoder.ndxu2_topcoder
  2  on topcoder.coder( lower(handle) )
  3  ;

Index created.
</pre>

<p>Now, whenever we use 'lower(handle)' in a WHERE clause, the optimizer can use this index we created and speed up query performance.</p>

<p><span class="bodySubtitle">III. The DELETE statement</span><br>
The DELETE statement is used to delete records from the database.   Its form is as follows:</p>

<pre class="code">
DELETE FROM  &lt;table name&gt;
WHERE  &lt;query conditions&gt;
</pre>

<p>Since we've already covered SELECT, INSERT, and UPDATE statements in detail, there aren't many new concepts you need to learn with the DELETE statement.  It goes without saying that you want to be careful when deleting records from your database, and take special care to write the correct WHERE clause so you delete the appropriate records, but <strong>only</strong> those records.  As we discussed in <i>A Crash Course in Relational Databases <a href="/tc?module=Static&d1=features&d2=032907" target="_blank">Part 2</a></i>, one way to protect against bad deletes is through the use of referential integrity.</p>

<p>Let's look at a quick example of how to delete a record from our coder2 table:</p>

<pre class="code">
SQL&gt; delete from topcoder.coder2
  2  where    handle = 'dcp'
  3  ;

1 row deleted.

SQL&gt; commit;

Commit complete.
</pre>

<p>Remember that our coder2 table is just a copy of the coder table, and doesn't have any of the referential integrity set up on it as our coder table does.  If we tried this same delete from the <strong>real</strong> coder table, we would get an integrity constraint violation.</p>

<p>Note that you can use correlated subqueries, etc. in the WHERE CLAUSE of the DELETE statement which allows you to join to other tables if you need to lookup information to determine which rows to delete.</p>

<p><span class="bodySubtitle">IV. Interacting with the Database using Java</span><br>
In this section, we'll take a look at how to use Java to interact with the database.   I'm going to assume you are familiar with Java IDEs (Integrated Development Environment) so I won't be spending time discussing how to set up a Java project, etc.  If you don't have a Java IDE there are many free ones available.  Personally, I use <a target="_blank" href="<tc-webtag:linkTracking link='http://www.eclipse.org' refer='feature_051407' />">Eclipse</a>.</p>

<p>The first thing you'll need is a JDBC driver which will allow you to connect to your Oracle database.  If you're using Oracle Express edition then one is provided with the distribution.  The path to this driver (if you're using Windows and installed Oracle Express edition to C:\oraclexe) is C:\oraclexe\app\oracle\product\10.2.0\server\jdbc\lib\ojdbc14_g.jar.  So you need to create a project in your IDE and add a reference to this jar file. </p>

<p>Let's create a Java class called TopCoder and connect to our Oracle Express database using our topcoder Oracle account.  Here's the code:</p>

<pre class="code">
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;
import oracle.jdbc.driver.OracleCallableStatement;
import oracle.jdbc.driver.OracleTypes;
 
<b>public class</b> TopCoder {
  <b>public static void</b> main(String[] args) <b>throws</b> Exception {
    
    Connection conn = <b>null</b>;
    
    <b>try</b> {
      // register the JDBC driver
      DriverManager.registerDriver(<b>new</b> oracle.jdbc.OracleDriver());
 
      // connect to database
      conn = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:XE","topcoder", "topcoder"
      );
      System.out.println("connection successful!");
      
      // turn off autocommit
      conn.setAutoCommit(<b>false</b>);
 
      // .
      // do some useful stuff
      // .
      
      conn.close();  // close database connection    
    
    }
    <b>catch</b> (SQLException ex) {
      System.out.println("exception:  " + ex.getMessage());
      <b>if</b> (conn != <b>null</b>) conn.close();
    }
  }
}
</pre>

<p>All we're really doing in this code is just connecting to the database.  We specify the port number, Oracle instance name, and username/password in the connection string. Note that with real production code, you would obviously not want to hardcode the username and password into your connection string -- conversely, you'd want to read those values from a secure file or maybe the registry if you're using Windows.</p>

<p>Also note that we set autocommit to false.  You want to always make sure to do that because if you don't, the JDBC driver will commit after every statement you execute.</p>

<p>Go ahead and compile the code and run it, making sure you get the "connection successful!" message.  If you are unable to connect, be sure that you have created the topcoder Oracle account and that you have added the ojdbc14_g.jar file to your classpath.</p>

<p>Now let's try executing a SELECT statement.  Put this code in place of the "do some useful stuff" comment:</p>

<pre class="code">
// create a statement
Statement stmt = conn.createStatement();
ResultSet rs;
rs = stmt.executeQuery("select count(*) from topcoder.coder");
rs.next(); // move to first record in result set
System.out.println("there are " + rs.getInt(1) + 
                   " rows in the coder table.");
</pre> 

<p>Recompile and run the program and you should get a message back reporting the number of rows in the coder table.  So the basic idea is that you just use a ResultSet to hold the results of your query, and you then call ResultSet.next() to move to the first record in the result set.  The other thing to note here is that column indexes are 1-based in the ResultSet.  In other words, we use rs.getInt(1), not rs.getInt(0) to bring back the first column result (there's only one column result in this example, namely the count of coder records).</p>

<p>The SQL we used above just returns a single row (i.e. the count of coder records).  But what if we want to bring back multiple results?  We can use a loop on the ResultSet.  Here's an example to bring back the handles of all Japanese coders:</p>
 
<pre class="code">
Statement stmt = conn.createStatement();
ResultSet rs;             
rs = stmt.executeQuery("select    c.handle                 "
                      +"from      topcoder.coder c         "
                      +"where     c.country_name = 'Japan' ");
<b>while</b>(rs.next()) {
    System.out.println(rs.getString(1));
}
</pre>

<p>To perform UPDATE or DELETE statements, we can use the executeUpdate() method of the Statement class.  Here is an example to do an UPDATE and DELETE from the coder2 (our scratch table):</p>

<pre class="code">
Statement stmt = conn.createStatement();
stmt.executeUpdate("update    topcoder.coder2                "
                  +"set       country_name = 'U.S.'          "
                  +"where     country_name = 'United States' "
                   );
stmt.executeUpdate("delete from topcoder.coder2 "
                  +"where  handle = 'dcp'");
conn.commit();                        
</pre>

<p>Notice that we call the Connection.commit() method to commit the results to the database, which is required since we set autocommit to false.</p>


<p><span class="bodySubtitle">V. Best Practices </span><br>
In the previous section we observed how easy it is to use a language such as Java to interact with the database.  The same concepts above can be applied to a language such as C# or VB.net as well.  The approach we used above was just to embed our SQL code directly into the application to bring back the results we need, or update the data in which we were interested. </p>

<p>However, there are many reasons why you would <strong>not</strong> want to embed SQL statements directly into your application code.  In fact, I'll go so far as to say you should really <strong>never</strong> use SQL statements inside your high level language code if you are writing a true production level application.  The correct approach is to always use PL/SQL packages for your SQL code, creating the appropriate stored procedures to perform the tasks your application needs.  Your application then interacts only with the stored procedures.</p>

<p>This approach offers a number of benefits, the first of which is that the database code layer is kept inside the database which makes for nice encapsulation.  If there is a problem with a stored procedure, the PL/SQL code can be modified and the Java/C#/VB.Net applications don't have to be changed at all in most cases.  However, if you embed SQL code directly in the applications, every time you need to change the SQL logic you have to go back and modify code in <strong>all</strong> of those applications.</p>

<p>Another benefit of using this approach is that it provides a clean separation of duties.  If your development team consists of Java experts and Oracle/PL/SQL experts, then this approach works beautifully.  The Java experts can concentrate on writing the front-end code, and the PL/SQL experts can write the back end code to interact with the database.</p>

<p>So let's go ahead and create a PL/SQL package with procedures to manipulate our coder table, and see how to call these procedures from Java code.  You can run this <a href="/i/education/downloads/create_tc_maint_pkg.sql">file</a> to create the package, which is called tc_maint_pkg.  Just run this script from SQL*Plus the same way you created the rss_util package in <i>A Crash Course in Relational Databases <a href="/tc?module=Static&d1=features&d2=032607" target="_blank">Part 1</a></i>.</p>

<p>The stored procedures in tc_maint_pkg consist of the following:  insert_coder_rec, update_coder_rec, delete_coder_rec, and fetch_coders_by_country.  Now let's see how we would call the insert_coder_rec procedure from our Java program to insert two coder records for JohnQPublic and JaneQPublic:</p>

<pre class="code">
OracleCallableStatement cstmt = <b>null</b>;
        
cstmt = (OracleCallableStatement)conn.prepareCall
      ( "begin tc_maint_pkg.insert_coder_rec(?,?,?,?,?,?); end;" );
      
cstmt.setInt(1,1196);               // coder_id
cstmt.setString(2,"JohnQPublic");   // handle
cstmt.setString(3,"Croatia");       // country_name
cstmt.setInt(4,1000);               // alg_rating
cstmt.setInt(5,221);                // alg_vol        
cstmt.setInt(6,42);                 // alg_num_ratings
cstmt.execute();
 
cstmt.setInt(1,1197);               // coder_id
cstmt.setString(2,"JaneQPublic");   // handle
cstmt.setString(3,"Croatia");       // country_name
cstmt.setInt(4,1234);               // alg_rating
cstmt.setInt(5,119);                // alg_vol        
cstmt.setInt(6,140);                // alg_num_ratings
cstmt.execute();
      
conn.commit();
cstmt.close();
</pre>

<p>Note that we are using the OracleCallableStatement class, which allows us to call our stored procedure. The question marks (i.e. the ? characters) in the tc_maint_pkg.insert_coder_rec call are parameter placeholders, more commonly referred to as "bind variables".  We then specify the parameter values for each parameter of the procedure and call the OracleCallableStatement.execute() method to run the procedure.  After we run this code, if we query our coder table for these two records we'll see that they were successfully inserted:</p>

<pre class="code">
SQL&gt; select * from topcoder.coder where handle in ('JohnQPublic','JaneQPublic');

CODER_ID  HANDLE          COUNTRY_NAME  ALG_RATING  ALG_VOL  ALG_NUM_RATINGS
--------- --------------- ------------- ----------- -------- ---------------
1196      JohnQPublic     Croatia       1000        221      42 
1197      JaneQPublic     Croatia       1234        119      140 
</pre>

<p>Here are a couple more examples, which make use of our update_coder_rec and delete_coder_rec procedures.  In the update_coder_rec call, we're updating JohnQPublic's alg_rating from 1000 to 1200 and his alg_num_ratings from 42 to 43.  In the delete_coder_rec call, we're deleting JaneQPublic's coder record:</p>

<pre class="code">
OracleCallableStatement cstmt = <b>null</b>;
        
cstmt = (OracleCallableStatement)conn.prepareCall
      ( "begin tc_maint_pkg.update_coder_rec(?,?,?,?,?,?); end;" );
      
cstmt.setInt(1,1196);               // coder_id
cstmt.setString(2,"JohnQPublic");   // handle
cstmt.setString(3,"Croatia");       // country_name
cstmt.setInt(4,2000);               // alg_rating is now 2000
cstmt.setInt(5,221);                // alg_vol        
cstmt.setInt(6,43);                 // alg_num_ratings is now 43
cstmt.execute();
      
conn.commit();
cstmt.close();
         
cstmt = (OracleCallableStatement)conn.prepareCall
      ( "begin tc_maint_pkg.delete_coder_rec(?); end;" );
      
// delete JaneQPublic's coder record
cstmt.setInt(1,1197);               // coder_id
cstmt.execute();
      
conn.commit();
cstmt.close();
</pre>

<p>Now, to fetch coder records we need to use something in Oracle known as a "ref cursor".  A ref cursor basically allows us to run a query inside a PL/SQL procedure, and have the results returned to us in a scrollable ResultSet object.  The fetch_coders_by_country procedure does just that, so here's an example of how to call it to retrieve Croatian coders and print out their handle and rating:</p>

<pre class="code">
OracleCallableStatement cstmt = <b>null</b>;
cstmt = (OracleCallableStatement)conn.prepareCall
  ( "begin tc_maint_pkg.fetch_coders_by_country(?,?); end;" );
 
cstmt.registerOutParameter(1,OracleTypes.CURSOR);
cstmt.setString(2,"Croatia");
      
cstmt.execute();
ResultSet rs = (ResultSet)cstmt.getObject(1);
 
<b>while</b> (rs.next()) {
  System.out.println(rs.getString("handle") + " " +              
                     rs.getString("alg_rating"));
}

cstmt.close();
</pre>

<p>Besides the benefits we've already discussed, one of the most important benefits of always using stored procedures and functions instead of embedded SQL is that it reduces database overhead tremendously.   Whenever you execute a SQL statement in Oracle, the statement is parsed and a query plan is generated and stored in the shared pool.  Every unique statement which is executed has to go through this parsing step.  However, whenever you use stored procedures and bind variables, then Oracle can reuse the compiled plan from the pool.  In other words, it doesn't have to reparse the statement, regenerate the query plan etc.  So if you were inserting 100 coder records, for example, Oracle only has to parse the statement one time, and the other 99 times it can reuse the query plan which saves a tremendous amount of time.  This may not sound like a big deal, but in his book, <i>Expert Oracle</i>, Thomas Kyte offers an example of querying 1000 records with using bind variables the first time and not using them the next.  When not using bind variables his queries took 14.86 seconds, but when using bind variables the queries only took 1.27 seconds!  So bind variables make a tremendous difference in performance which is why you should always use them.  If you make it a habit to never put SQL statements in your high level code but instead, always use stored procedures, you'll be on your way to writing highly scalable applications while minimizing performance bottlenecks.</p>

<p>The last topic we'll discuss in this section is the highly controversial topic of where business rules belong:  in the database or in high level code.  Here's an example of a business rule:</p>

<blockquote>United States customers from the state of California pay a 12% shipping charge (where the 12% is based on total purchase price of their items)  unless they are purchasing $500.00 or more in which case the rate changes to 8.5%.    The exception to this rule is for Orange county residents, who always pay a flat shipping rate of 9.25% regardless of their purchase amount unless it's a leap year, in which case they pay 8.25%.</blockquote>

<p>So where should we code the logic for this business rule?  Well, there are many schools of thought depending on who you ask.  Let's look at what Rod Johnson says in his book, <i>Expert One-on-One J2EE Design and Development</i>:  "Do not use stored procedures to implement business logic. This should be done in Java business objects."  David Heinemeier Hansson, creator of Ruby on Rails, makes the following comment in this <a target="_blank" href="<tc-webtag:linkTracking link='http://www.builderau.com.au/strategy/businessmanagement/soa/Ruby-on-Rails-chases-simplicity-in-programming/0,339028271,339216761,00.htm' refer='feature_051407' />">article</a>:  "We took a pretty radical stand: Stored procedures and all things that make your database clever are evil.  If you tell a lot of IT shops that, they'll be majorly offended, because that's just the way they do things."  The argument here is for database independence.  In other words, these guys are saying that when you start to use database specific features, you are somehow reducing the scalability of your application.</p> 

<p>Let's listen to what Thomas Kyte says regarding this concern:  "The decision to strive for database independence and total 'openness' is one that people are absolutely free to take, and many try, but I believe that it is the wrong decision. No matter what database you are using, you should exploit it fully, squeezing every last bit of functionality you can out of that product.  You'll find yourself doing that in the tuning phase (which again always seems to happen right after deployment) anyway. It is amazing how quickly the database independence requirement can be dropped when you can make the application run five times faster just by exploiting the software's capabilities.</p>

<p>So back to our question, where do we code the business rule above?  Well, if you follow Rod Johnson's philosophy he'll tell you to put it in your Java code.  And if you're planning on using stored procedure calls with Ruby on Rails, then I wouldn't plan on inviting David Heinemeier Hansson over for lunch any time soon!  But think about it from this standpoint:  will Java still be one of the primary high-level coding languages 10 years from now?  It might, but if you look back to the early 1990's Java, C#, and VB.net had not even been invented yet.  Client/Server applications were just starting to gain momentum and C/C++ were two of the primary languages used to write software.  How many Web-based applications are being written in C these days?  The point is that whether it's PHP, Ruby on Rails, or what have you, new languages are coming out all the time.  Let's again refer to Thomas Kyte (from his <i>Expert Oracle</i> book) for some insight on this subject:  </p>

<p>"&#8230;what you must remember is that the 'whiz bang' technology of today, EJBs for example, (become) yesterday's concept, and tomorrow's old, tired technology. What has persevered for over 20 years in the relational world (and probably most of the object implementations as well) is the database itself. The front ends to the data change almost yearly, and as they do, the applications that have all of the security (and business logic) built inside themselves, not in the database, become obstacles, roadblocks to future progress."</p>

<p>You may disagree, but I share Kyte's viewpoint here that the best place for business rules is in the database, not in a high-level language such as Java or C#.  In the business rule above, let's look at how we might write create the rule in the database, and put the skills we've learned throughout this article series into practice in one final example which you'll find <a href="/i/education/downloads/shipping.sql">here</a>.  Go ahead and run the script to create the tables and package, and you may want to keep the script open in another browser window as we'll be referring to it below.</p>

<p>In looking at the script, you'll see that we're creating a shipping_rate and shipping_exception_rate table.  Let's look at the layouts of these tables and discuss them:</p>

<pre class="code">
  <b>SHIPPING_RATE</b>
  id                   
  country_name         
  state_name           
  threshold_amt        
  below_threshold_rate 
  above_threshold_rate

  <b>SHIPPING_EXCEPTION_RATE</b>
  id
  shipping_rate_id
  county_name
  flat_rate
  leap_year_rate
</pre>

<p>In the shipping rate table we're keeping track of the country, state, and a threshold amount, which we use to determine whether to apply the "below threshold rate" or "above threshold rate".  In other words, if the customer purchases the threshold amount or greater, they get the above threshold rate.  Otherwise they get the below threshold rate.  The exception to this rule (there are almost always exceptions to business rules) occurs when we find a shipping_exception_rate record for the county corresponding to the country and state.  In that case, we must determine whether to use the flat rate or leap year rate, depending on whether or not it's a leap year.  You can see in the PL/SQL code that we're determining the rate with a single SQL statement!  Let's look at the case statement part of the SQL to get a better idea of how it works: </p>

<pre class="code">
case
  when e.id is not null then
    -- we found a shipping_rate_exception record, determine whether
    -- to use flat_rate or leap_year_rate
    case
      when is_leap(
        to_number(to_char(sysdate,'YYYY'))) = 'Y' then leap_year_rate
      else flat_rate
    end
  when p_purchase_amt < r.threshold_amt then r.below_threshold_rate
  else r.above_threshold_rate
end
</pre>

<p>The basic idea is that we're outer joining to the shipping_rate_exception table and if we find a record then we apply the exception rate rules, handling the leap year case appropriately.  If we do not find an shipping_rate_exception record, then we just use the normal rules for the country and state, determining which threshold rate to use based on purchase amount.</p>

<p>Note that we are also using referential integrity through a foreign key and we're also using unique indexes to ensure the integrity of the data in these tables.</p>

<p>Here are some examples of how we could call the get_shipping_rate procedure from Java.  In the first example, we're checking the rate for Los Angeles county for a purchase amount of $500.56.  In the second example we changed the county to Orange and the purchase amount to $123.98.  The key thing to realize is that the business logic is kept in the database, <strong>not</strong> in our Java code.  So whenever you want to rewrite this application in another language next month or 10 years from now, the business rule can be used over and over and never has to be rewritten, regardless of which high-level language you use.</p>

<pre class="code">
OracleCallableStatement cstmt = <b>null</b>;
<b>double</b> purchaseAmt,rate;
String county;
        
purchaseAmt = 500.56;
county = "Los Angeles";
cstmt = (OracleCallableStatement)conn.prepareCall
     ( "begin shipping_pkg.get_shipping_rate(?,?,?,?,?); end;" );
      
cstmt.setString(1,"United States");               // country name
cstmt.setString(2,"California");                  // state name
cstmt.setString(3,county);                        // county
cstmt.setDouble(4,purchaseAmt);                   // purchase amount
cstmt.registerOutParameter(5,OracleTypes.NUMBER); // shipping rate
            
cstmt.execute();
rate = (<b>double</b>)cstmt.getDouble(5);
System.out.println("The rate for purchase amt $" + purchaseAmt
                    +" for " + county + " county is " + rate);
 
      
// now try Orange county for purchase amt 123.98
      
purchaseAmt = 123.98;
county = "Orange";
cstmt.setString(3,county);                         // county
cstmt.setDouble(4,purchaseAmt);                    // purchase amount
cstmt.execute();
rate = (<b>double</b>)cstmt.getDouble(5);                 // shipping rate
System.out.println("The rate for purchase amt $" + purchaseAmt
     +" for " + county + " county is " + rate);
      
cstmt.close();
</pre>

<p><span class="bodySubtitle">VI. Conclusion</span><br>

<p>This marks the end of our whirlwind journey through the world of relational databases.  We've covered a lot of topics, but hopefully you have a better grasp of databases and how to interact with them than you did previously.  If there's a topic I didn't cover that you'd like to discuss, the forums are a great place to post questions.</p>

<p>I sincerely hope that you'll be able to put the information in these articles to good use as you pursue career opportunities or component development competitions, and I wish you the best of luck!</p>

<p><b>References</b>
<ul><li><i>Expert Oracle</i>, by Thomas Kyte</li>
<li><i>Expert One-on-One J2EE Design and Development</i>, by Rod Johnson</li>
</ul>
</p>

<p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>

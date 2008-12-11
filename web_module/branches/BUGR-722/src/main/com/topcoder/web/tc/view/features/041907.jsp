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
   width: 500;
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

<span class="bigTitle">A Crash Course in SQL</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21684580" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<br clear="all">

<p>In the first two parts of this article series we looked at the basic components of relational databases: <i>A Crash Course in Relational Databases, <a href="/tc?module=Static&d1=features&d2=032607" target="_blank">Part 1</a> &amp; <a href="/tc?module=Static&d1=features&d2=032907" target="_blank">Part 2</a></i>.  We touched briefly on SQL -- the language we use to interact with the database -- but in this article we'll look at it in much more detail, with a specific focus on writing queries.  We'll continue to use the database we developed in the first two articles if you'd like to follow along with the examples.</p>

<p>Note that different databases have syntax variations for SQL.  Since we have used <a target="_blank" href="<tc-webtag:linkTracking link='http://www.oracle.com/technology/xe/index.html' refer='feature_041907' />">Oracle</a> throughout the article series, we will focus on Oracle's SQL syntax.  While we don't have the space to cover every aspect of SQL, we'll focus on some of the core concepts that will help you "hit the ground running" as you begin to work with relational databases.  This article should give you some good tools to begin putting your database to work, and it should help you avoid some common pitfalls.</p>

<p>Note that I have loaded data for the following SRMs into my database for the examples:  342, 343, and 344.  You don't need to have that data loaded to your database, but the examples throughout the article will be based on them.  Please refer to the previous articles for the procedure for loading SRM data into your database.</p>

<p><span class="bodySubtitle">I. Types of SQL statements</span><br />
SQL statements fall into two primary categories:  data definition language (DDL) and data manipulation language (DML).  We use DDL statements to alter the structure of our database.  For example, a CREATE TABLE statement is an example of a DDL statement.  DML statements, on the other hand, are used to manipulate the data in the database.  INSERT and UPDATE statements are examples of DML statements.</p>

<p>In most shops, the role of creating tables, indexes, etc. on the production database will be the responsibility the Database Administrator (DBA).  However, if you are the developer on a project you will most likely have a lot of influence on the design of the tables, indexes, etc.  And in many shops, such as the one I work in, you will have rights to create tables on the development database as you are working on projects.  So it's a good idea to become familiar with the different types of DDL statements (CREATE, DROP, ALTER, and TRUNCATE) </p>

<p>However, since this article is a crash course in SQL, we're going to focus on DML statements -- as a developer, these are usually what you will need to know best.</p>

<p><span class="bodySubtitle">II. The SELECT statement</span><br />
The SELECT statement is one you will find yourself using quite often.  As we saw in the previous articles, we use the SELECT command to get records out of the database so we can view them.  The structure of a SELECT statement is as follows:</p>

<p>
SELECT    &lt;column list - 1 or more columns from target tables or * for all columns&gt;<br>
FROM        &lt;source tables&gt;<br>

WHERE      &lt;query conditions&gt;<br>
GROUP BY    &lt;group by conditions&gt;<br>
HAVING    &lt;aggregate conditions&gt;<br>
ORDER BY    &lt;sort conditions&gt;
</p>
 
<p>Here's a simple example of a SELECT statement:</p>
<pre class="code">

SQL&gt; select    handle
  2           ,country_name
  3  from      topcoder.coder
  4  where     handle = 'dcp'
  5  ;

HANDLE               COUNTRY_NAME
-------------------- --------------------------------------------
dcp                  United States
</pre>

<p>In this example, we list the columns we want to bring back in our query (handle and country_name), the source table (topcoder.coder) and the query conditions (handle = 'dcp').  The FROM clause lists the target tables from which we are querying data.  The WHERE clause is used to specify the conditions of our query (i.e. limit the query to bring back the rows in which we're interested).  The GROUP BY clause is used when we need to aggregate data and summarize it, and the HAVING clause provides a way to add conditions for our grouped results.  We aren't using a GROUP BY and HAVING clause in this example.  Don't worry if this paragraph doesn't make much sense right now, as we'll be looking at each of these components in detail.</p>

<p><span class="bodySubtitle">III. Column list, FROM clause, and WHERE clause</span><br />
We saw in the previous section that the column list is simply the list of columns we want to bring back in our query.  If you are using multiple tables in your query (we'll discuss table joins later) and the same column is present in two or more tables in your FROM clause, then you'll need to prefix the column name with the table name or table alias.  For example, the coder table and round_results table both have a coder_id column.  Any time we are querying both of those tables in the same query, and we have coder_id in our column list, we need to specify from which table we are extracting the coder_id.  Let's look at an example of how <strong>not</strong> to write the query:</p>

<pre class="code">

SQL&gt; select    coder_id
  2           ,country_name
  3  from      topcoder.coder
  4           ,topcoder.round_results
  5  where     coder.coder_id = round_results.coder_id
  6  ;
select    coder_id
          *
ERROR at line 1:
ORA-00918: column ambiguously defined
</pre>

<p>Here, we get a 'column ambiguously defined' error because the coder_id column is in both tables in our FROM clause.  We can alleviate this problem by prefixing the coder_id column in our column list with the table name or table alias.  In other words, we can specify coder.coder_id or round_results.coder_id, or if we have aliased our coder table with 'c,' for example, we can just specify c.coder_id.  Here's an example using table aliases (note that the rownum &lt;= 5 condition tells Oracle to bring back only the first 5 rows of the query results):</p>

<pre class="code">
SQL&gt; select    c.coder_id
  2           ,c.country_name
  3  from      topcoder.coder          c
  4           ,topcoder.round_results  r
  5  where     c.coder_id = r.coder_id
  6  and       rownum &lt;= 5 -- just bring back first 5 rows
  7  ;

  CODER_ID COUNTRY_NAME
---------- ------------------------------------------------------
  10676764 Romania
   9905330 Romania
   8555447 Poland
  15693244 Poland
  15693244 Poland 
</pre>

<p>A very important point to take note of here is that even if you don't have column name conflicts between tables in your queries, it's an <strong>extremely</strong> good habit to always use table aliases like this.  One reason is that it makes your SQL query much more readable and easier to maintain.  For example, in the query above I don't have to wonder which table the country_name column is being extracted from, because the table alias let's me know that it's coming from the coder table.  When you come back to this query next week or 6 months from now, it will be much easier to maintain if you've used column aliases.  But just as important as maintainability is the fact that using column aliases will lessen the chance that your SQL query breaks sometime in the future.  </p>

<p>As an example, consider a situation where you have two tables in your query and you aren't using table aliases on your columns in your select list.  So let's say you have table A and table B in your query, and column C1 is a column in your select list.  Column C1 only exists in table A currently, but next month one of your fellow developers decides to add column C1 to table B.  If you haven't used table aliases and prefixed your columns with those aliases, then your query is sure to break.  As you can imagine, this can lead to catastrophic results in a production environment and is a major pitfall.  But by using table aliases and being sure to prefix each column name with a table alias, your query is virtually bulletproof.</p>

<p>As we've seen, the FROM clause is just the list of target tables for our query.  We can have table names in our FROM clause, but we can also use views, which we discussed in the last article.  We're not limited only to tables and views in our FROM clause, however -- we can also use another SELECT statement in our FROM clause and treat it as a table!  This is an extremely powerful technique that we'll look at a bit later.</p>

<p>In the WHERE clause, we just list the query conditions we need to use to limit the results to be brought back.  We've seen several examples where we limit the query results to a specific country, etc., and these conditions go in the WHERE clause in most cases.  We also put our table join conditions in the WHERE clause.</p>

<p><span class="bodySubtitle">IV. GROUP BY and HAVING</span><br />
The GROUP BY clause allows us to roll data up by some column or group of columns.  Put another way, it allows us to summarize or aggregate data.  As an example, let's see how many SRMs that Russian coders have competed in, and pull the results back by coder handle.  We can use SQL's 'count' function, which is an aggregate function, and use our coder and round_results tables to get the required data.  Note that we have to issue a GROUP BY clause on our handle column because that tells Oracle to group the results by handle.  Also, since we only have data for three SRMs loaded to the database, the num_competitions column in the query results is just going to be 1, 2 or 3. </p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,count(r.round_id) num_competitions
  3  from      topcoder.coder         c
  4           ,topcoder.round_results r
  5  where     c.country_name = 'Russian Federation'
  6  and       c.coder_id     = r.coder_id
  7  group by  c.handle
  8  ;

HANDLE               NUM_COMPETITIONS
-------------------- ----------------
eidewood                            2
laser_rus                           2
shadow87                            1
gevak                               3
.
.
results truncated for brevity

</pre>

<p>Now, what if we wanted to modify this query to only bring back Russian coders who have only competed in <strong>exactly</strong> two competitions?  We can use a HAVING clause as shown below:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,count(r.round_id) num_competitions
  3  from      topcoder.coder         c
  4           ,topcoder.round_results r
  5  where     c.country_name    = 'Russian Federation'
  6  and       c.coder_id        = r.coder_id
  7  group by  c.handle
  8  having    count(r.round_id) = 2
  9  ;

HANDLE               NUM_COMPETITIONS
-------------------- ----------------
eidewood                            2
laser_rus                           2
zibada                              2
mehas                               2
root85                              2
.
.
results truncated for brevity
</pre>

<p>The key difference between a WHERE clause condition and a HAVING clause condition is that the WHERE clause limits the <strong>rows</strong> returned, whereas the HAVING clause limits the <strong>groups</strong> returned.  In the example above, we are only bringing back groups with count(r.round_id) = 2.</p>

<p>Some other handy aggregate functions you can use are SUM, MAX, and MIN.  Let's write a query to sum up the point total (not including challenge points) by coder handle for all SRMs we have loaded to our database:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,sum(nvl(r.level_one_final_points,0) +
  3                nvl(r.level_two_final_points,0) +
  4                nvl(r.level_three_final_points,0)) point_total
  5  from      topcoder.coder         c
  6           ,topcoder.round_results r
  7  where     c.coder_id  =  r.coder_id
  8  group by  c.handle
  9  ;

HANDLE               POINT_TOTAL
-------------------- -----------
xhl_kogitsune            1148.06
IvanP                     402.27
anouk                          0
gaby_wiz                  202.29
radeinla                  192.32
nikkitousen               452.22
.
.
results truncated for brevity
</pre>

<p>Note the use of the "nvl" function in this example.  That function basically says if the column value is null, replace it with some value -- in this case, we are replacing the null value with 0.  The reason this is extremely important is because null + anything = null.  What this means in our query is that if someone had a null value for any of the columns we are adding together, then the entire arithmetic result will be null.  Here are a couple of simple examples to explain this concept:</p>

<pre class="code">
SQL&gt; select 20 + 10 + null from dual;

20+10+NULL
----------


SQL&gt; select 20 + 10 from dual;

     20+10
----------
        30

</pre>

<p>The dual table is just a one row, one column test table that Oracle provides to run little tests like the ones above.  But as you can see from these examples, you need to be sure to always handle the possibility of nulls when performing arithmetic operations on column values.  This is a pitfall that's very easy to stumble into, so watch out for it.  Another way to alleviate the problem completely is to not allow nulls in the column to begin with; then you never have to worry about this problem.  Oracle has a "not null" constraint which can be used on almost any column in a table.</p>

<p><span class="bodySubtitle">V. ORDER BY</span><br />

<p>You'll often find that you would like your query results to come back in a certain order.  For example, if we are querying our topcoder.coder table for coders from Peru, we might want to sort the query results by handle.  We can use an ORDER BY clause on our query to do just that:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,c.country_name
  3  from      topcoder.coder c
  4  where     c.country_name = 'Peru'
  5  order by  c.handle
  6  ;

HANDLE               COUNTRY_NAME
-------------------- --------------------------------------------
Antonio_Ocampo       Peru
BVnQRucsm            Peru
DanielHugo           Peru
Danny_Montalvo       Peru
.
.
results truncated for brevity
</pre>

<p>When we use an ORDER BY clause to sort our query results, the default order is ascending (i.e. "lexigraphically earliest," if you're used to reading TopCoder problem statements).  If we want to reverse the order, we can specify the DESC keyword at the end of the column name by which we are sorting:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,c.country_name
  3  from      topcoder.coder c
  4  where     c.country_name = 'Peru'
  5  order by  c.handle desc
  6  ;

HANDLE               COUNTRY_NAME
-------------------- --------------------------------------------
xandr                Peru
xRadamantisx         Peru
trulo_17             Peru
skneo2               Peru
.
.
results truncated for brevity
</pre>

<p>You can sort by as many columns as you need in order to get the correct query results.  Moreover, you can also sort one column in ascending order, another in descending, and mix and match however you need.  For example, let's query our coder table in descending order by country_name, but ascending order by handle. </p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,c.country_name
  3  from      topcoder.coder c
  4  order by  c.country_name desc
  5           ,c.handle asc
  6  ;

HANDLE               COUNTRY_NAME
-------------------- --------------------------------------------
DoomBringer          Zimbabwe
GokuFour             Zimbabwe
Minny                Zimbabwe
v_sandy              Zimbabwe
.
.
results truncated for brevity
</pre>

<p><span class="bodySubtitle">VI. Table JOINS</span><br />
You'll find that often you will need to get information from multiple tables in the same query, and we've seen several examples of this already.  To get information from multiple tables, we have to join the different tables together in our where clause.  There are different types of joins we can use, depending on the type of query we are writing.  The topcoder.coder_round_results view we created in the last article is a good example of using joins to pull data together from different tables.</p>

<p>The first type of join is an INNER JOIN.  The key thing to remember about an INNER JOIN is that if the join fails between two or more tables, then no query result will be brought back for those rows.  In other words, think of an INNER JOIN like you would a set intersection.   Let's look at some examples to get a better understanding of this concept. </p>

<p>In the first example, we're using INNER JOINS from the coder table to the round_results table, and from the round_list table to the round_results table.  We also have a query condition on coder handle = 'dcp', so only records from the coder and round_results table with that handle will be brought back in our query results.  </p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,l.short_name
  3           ,r.submission_points
  4  from      topcoder.coder         c
  5           ,topcoder.round_list    l
  6           ,topcoder.round_results r
  7  where     c.coder_id = r.coder_id
  8  and       l.round_id = r.round_id
  9  and       c.handle   = 'dcp'
 10  ;

HANDLE  SHORT_NAME  SUBMISSION_POINTS
------- ----------  -----------------
dcp     SRM 344     208.44
dcp     SRM 342     582.04
dcp     SRM 343     561.22
</pre>

 
<p>But now let's add another condition to our where clause.  Let's add the condition 'short_name = 'SRM 345''.  (Remember, I don't have data for SRM 345 loaded into my database yet.)</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,l.short_name
  3           ,r.submission_points
  4  from      topcoder.coder         c
  5           ,topcoder.round_list    l
  6           ,topcoder.round_results r
  7  where     c.coder_id   = r.coder_id
  8  and       l.round_id   = r.round_id
  9  and       c.handle     = 'dcp'
 10  and       l.short_name = 'SRM 345'
 11  ;

no rows selected
</pre>

<p>In this case, there isn't a corresponding record in the round_list table for SRM 345 (at least in my database).  That's the reason we didn't get any query results back.  The thing to realize here is that any time you use INNER JOINs, if any of the join conditions fail to match a row in the target table(s), the query won't bring back a result for that particular row(s). </p>

<p>The second type of join is an OUTER JOIN.  Outer joins are useful when we have two (or more) tables we need information from, but we want to bring the row back from the first table even if it doesn't have a corresponding row in the other tables.  For example, suppose we want a list of all Ukrainian coders and how they placed in SRM 343.  However, even if they didn't compete in SRM 343 we still want to bring back their coder record.  We could use an OUTER JOIN to accomplish this task.</p>

<p>In Oracle's SQL syntax, we can use a (+) beside of each join condition in our where clause to indicate that we are outer joining to that table.  In the example below, we are outer joining to the round_results table using the round_id and coder_id columns as our join conditions.  (Note that 10667 is the round_id for SRM 343.)  One thing to be especially careful about when using outer joins is to ensure that you put the (+) beside <strong>every</strong> join condition of the table to which you are outer joining.  In other words, we need a (+) beside <strong>both</strong> r.round_id and r.coder_id  below, or the outer join won't work properly.</p>

<pre class="code">
SQL&gt; select  c.handle
  2         ,r.division_placed
  3  from    topcoder.coder         c
  4         ,topcoder.round_results r
  5  where   c.country_name  = 'Ukraine'
  6  and     10667           = r.round_id(+)
  7  and     c.coder_id      = r.coder_id(+)
  8  ;

HANDLE               DIVISION_PLACED
-------------------- ---------------
DDrummer                         476
Vas_ua                           476
zulo                               6
-WSM-                            347
johngull                           1
.
. results truncated for brevity
.
Gigz
TSOrest
xOberon
</pre>

<p>In the query results here we can see that some coders, like DDrummer and Vas-ua, competed in SRM 343, but others like Gigz and TSOrest did not.  In either case, though, we are bringing back their coder records.  The other syntax you can use for OUTER JOINs is as follows:</p>

<pre class="code">
SQL&gt; select  c.handle
  2         ,r.division_placed
  3  from    topcoder.coder         c
  4  left outer join topcoder.round_results r
  5  on      10667          = r.round_id
  6  and     c.coder_id     = r.coder_id
  7  where   c.country_name = 'Ukraine'
  8  ;
</pre>

<p>The syntax you use is up to you, but I will mention that the (+)  syntax is specific to Oracle and won't work with databases such as Microsoft SQL Server or DB2.  Personally, I prefer the (+) syntax because it's a little cleaner to write and makes formatting your SQL statement easier.</p>

<p> This brings up the topic of SQL92 compliant syntax. SQL92 is basically a standard for SQL syntax and transaction behavior. Without getting into a lot of details here, the thing to remember is that two databases can be SQL92-compliant, but use different SQL syntax. For example, Microsoft SQL Server supports the &ldquo;inner join&rdquo; syntax on tables, but versions of Oracle prior to 9i did not support this syntax. The &ldquo;inner join&rdquo; syntax is similar to the &ldquo;left outer join&rdquo; syntax shown in the SQL example above, and it&rsquo;s an alternative way to write joins. But don&rsquo;t be afraid to use whatever SQL syntax you&rsquo;re comfortable with, even if it&rsquo;s database specific. If you&rsquo;re worried about being able to write cross-platform compatible SQL, then listen to what Thomas Kyte says in his book, <em>Expert Oracle</em>: </p>
<blockquote>&quot;You should not be afraid to make use of vendor-specific features &ndash; after all, you are paying a lot of money for them. Every database has its own bag of tricks, and we can always find a way to perform the operation in each database. Use what is best for your current database, and re-implement components as you go to other databases. Use good programming techniques to isolate yourself from these changes. The same techniques are employed by people writing OS-portable applications. The goal is to fully utilize the facilities available to you, but ensure you can change the implementation on a case-by-case basis.&quot;</blockquote>
<p>One thing to be particularly careful about when joining tables together is that you want to make certain that you use all the necessary fields to properly join the tables.  In other words, if you have a table that has three fields that compose the primary key, then when you join that table to another table you want to make sure you use all three of those fields in the join.  Failure to join the tables together properly will usually result in undesirable results, because you will get back many more rows than you expect -- worse yet, you will have duplicate rows with the same information.  Let's look at an example , but first we'll need to create a couple more tables and insert some data into them.  You can use the same database you've been using to create these tables.</p>
<pre class="code">
SQL&gt; create table topcoder.person (
  2     last_name  varchar2(100)
  3    ,first_name varchar2(100)
  4    ,ssn        number
  5    ,address    varchar2(100)
  6  );

Table created.

SQL&gt;
SQL&gt; alter table topcoder.person
  2  add primary key (last_name, first_name, ssn);

Table altered.

SQL&gt;
SQL&gt; create table topcoder.person_salary (
  2     last_name  varchar2(100)
  3    ,first_name varchar2(100)
  4    ,ssn        number
  5    ,salary     number
  6  );

Table created.

SQL&gt;

SQL&gt; alter table topcoder.person_salary
  2  add primary key (last_name, first_name, ssn);

Table altered.

SQL&gt;
SQL&gt; insert into topcoder.person
  2  values('Doe','John','123456789','123 Nowhere Street');

1 row created.

SQL&gt;
SQL&gt; insert into topcoder.person
  2  values('Doe','John','987654321','321 Anywhere Drive');

1 row created.

SQL&gt;
SQL&gt; insert into topcoder.person
  2  values('Doe','John','987651234','321 Guessit Lane');

1 row created.

SQL&gt;
SQL&gt; insert into topcoder.person_salary
  2  values('Doe','John','123456789',123);

1 row created.

SQL&gt;

SQL&gt; insert into topcoder.person_salary
  2  values('Doe','John','987654321',456);

1 row created.

SQL&gt;
SQL&gt; insert into topcoder.person_salary
  2  values('Doe','John','987651234',789);

1 row created.

SQL&gt;
SQL&gt; commit;

Commit complete.
</pre>

<p>So we have a person table and a person_salary table and the primary key on each of those tables is last_name, first_name, and ssn (social security number).  So now let's write a query to bring back our person records and lookup the salary for each person using an INNER JOIN:</p>

<pre class="code">

SQL&gt; select    p.last_name
  2           ,p.first_name
  3           ,s.salary
  4  from      topcoder.person        p
  5           ,topcoder.person_salary s
  6  where     p.last_name  = s.last_name
  7  and       p.first_name = s.first_name
  8  and       p.ssn        = s.ssn
  9  ;

LAST_NAME  FIRST_NAME SSN       SALARY
---------- ---------- --------- ------
Doe        John       123456789 123
Doe        John       987654321 456
Doe        John       987651234 789
</pre>

<p>This is the result we would expect, since there are three rows in our person table.  However, watch what happens if we leave the ssn join condition out of our where clause:</p>

<pre class="code">
SQL&gt; select    p.last_name
  2           ,p.first_name
  3           ,p.ssn
  4           ,s.salary
  5  from      topcoder.person        p
  6           ,topcoder.person_salary s
  7  where     p.first_name = s.first_name
  8  and       p.last_name  = s.last_name
  9  ;

LAST_NAME  FIRST_NAME   SSN          SALARY  
---------- ------------ ------------ --------
Doe        John         987654321    123     
Doe        John         987651234    123     
Doe        John         123456789    123     
Doe        John         987654321    456     
Doe        John         987651234    456     
Doe        John         123456789    456     
Doe        John         987654321    789     
Doe        John         987651234    789     
Doe        John         123456789    789     

</pre>

<p>Wow, how'd that happen?  We now have nine rows returned in our query results instead of three.  Well, since we didn't have all the necessary conditions we needed in our where clause, we ended up with duplicate rows.  It's extremely important to make sure you get your joins right.  It sounds simple enough, but it's very easy to make a mistake when you join several tables together, and unfortunately that will cause you to end up with duplicate records in your query results.</p>

<p>Here's a helpful technique I use when my query results contain duplicate records (implying that one of my table joins is incorrect).  First, I eliminate all the tables from my query except for the "main" table.  The "main" table is the driving table in your query; it's the table to which you are joining most of the other tables.  I then add each individual table and its corresponding where clause conditions back into the query one at a time and re-check the query results to ensure I still don't have duplicate rows.  Sooner or later I'm guaranteed to find the join that is causing the duplicates, and then I can determine what conditions I need to add to my where clause to make the join correct.</p>

<p><span class="bodySubtitle">VII. Correlated Subqueries</span><br />
Sometimes you need more than just joining tables together to get the information your query requires.  For example, let's say we want a list of coders and the most recent match they've competed in.  It's clear that if we just join our coder, round_list, and round_results tables together that we are going to get back <strong>all</strong> the matches they've competed in.  But we're interested in the most recent match for each coder.</p>

<p>To get our desired information, we can use a powerful technique known as a correlated subquery.  A correlated subquery allows us to use another select statement in our where clause.  In the correlated subquery below, we're pulling the max(r.round_id) for each coder, which will be the most recent match in which they've competed.  But notice our join condition in the correlated subquery.  We're referring to a table that's in our outer select statement.  The SQL engine "correlates" the results between these two queries into one final result.</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,l.short_name
  3  from      topcoder.coder      c
  4           ,topcoder.round_list l
  5  where     l.round_id = (select    max(r.round_id)
  6                          from      topcoder.round_results r
  7                          where     c.coder_id = r.coder_id)
  8  ;

HANDLE                  SHORT_NAME
--------------------    -------------------------------------
cluster2006             SRM 343
dshaw                   SRM 342
myKitty                 SRM 344
xiangsanzi              SRM 342

</pre>

<p>Correlated subqueries are very handy and you'll find yourself using them often.</p>

<p><span class="bodySubtitle">VIII. UNION and INTERSECT</span><br />
You can also perform set operations between queries, using the UNION and INTERSECT operations.  Let's look at a couple of examples.</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,c.country_name
  3  from      topcoder.coder c
  4  where     c.handle = 'dcp'
  5  union
  6  select    c.handle
  7           ,c.country_name
  8  from      topcoder.coder c
  9  where     c.handle = 'dcp'
 10  ;

HANDLE               COUNTRY_NAME
-------------------- --------------------------------------------
dcp                  United States
</pre>

<p>This example just takes the union of the two queries.  In this case, both queries return the exact same result so only one row is returned.  However, if we change the word 'union' to 'union all', watch what happens:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,c.country_name
  3  from      topcoder.coder c
  4  where     c.handle = 'dcp'
  5  union all
  6  select    c.handle
  7           ,c.country_name
  8  from      topcoder.coder c
  9  where     c.handle = 'dcp'
 10  ;

HANDLE               COUNTRY_NAME
-------------------- ---------------------------------
dcp                  United States
dcp                  United States
</pre>

<p>Here, we get two rows back since we specified 'union all'.  The union all tells the SQL parser to allow duplicate results.</p>

<p>Now let's look at an intersection example.  We'll create a table called fruit and load some records into it for this example.</p>

<pre class="code">
SQL&gt; create table topcoder.fruit (name varchar2(50));

Table created.

SQL&gt;

SQL&gt; insert into topcoder.fruit values ('apple');

1 row created.

SQL&gt; insert into topcoder.fruit values ('orange');

1 row created.

SQL&gt; insert into topcoder.fruit values ('banana');

1 row created.

SQL&gt; insert into topcoder.fruit values ('pear');

1 row created.

SQL&gt; insert into topcoder.fruit values ('raisin');

1 row created.

SQL&gt; insert into topcoder.fruit values ('kiwi');

1 row created.

SQL&gt;
SQL&gt; commit;

Commit complete.

SQL&gt;

SQL&gt; select    f.name
  2  from      topcoder.fruit f
  3  where     f.name in ('apple','orange','banana')
  4  intersect
  5  select    f.name
  6  from      topcoder.fruit f
  7  where     f.name in ('pear','orange','kiwi')
  8  ;

NAME
--------------------------------------------------
orange
</pre>

<p>Since 'orange' is the common fruit between the two queries, it comes back in our result set.  Another thing to note from this example is the use of the 'in' operator, which allows you to specify a list of values to check for equality vs. having to write separate statements for each condition.  You can also use 'not in' followed by a list of values to make sure a column value is not equal to any value in the list.</p>

<p><span class="bodySubtitle">IX. Inline Views</span><br />
One of the most powerful weapons you can add to your SQL toolbox is inline views.  Inline views can be referred to by different names, such as tables within tables, etc., but they essentially allow you to make a pseudo table on the fly in your query.  In the previous article series we discussed views. With inline views, you can actually add a SELECT statement to your where clause, which for all practical purposes works just like a view or table.  This is an extremely useful technique, so let's look at an example:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,x.final_points
  3  from      topcoder.coder c
  4           ,(select    r.coder_id
  5                      ,sum(r.final_points) final_points
  6             from      topcoder.round_results r
  7             group by  r.coder_id
  8             having    sum(r.final_points) &gt; 2000
  9            ) x
 10  where     c.coder_id     = x.coder_id
 11  and       c.country_name = 'China'
 12  ;

HANDLE               FINAL_POINTS
-------------------- ------------
skywendy                  2212.09
liympanda                 3306.34
Ying                       3207.5
ACRush                       3420
ahyangyi                  3555.95

</pre>

<p>In this example, we have an inline view in our query that is pulling all coder_id's where the sum of the round_results final points values are greater than 2000.  You can think of this select statement as a "table".  Then, in our outer select we join to this "table" on coder_id.  In other words, the same rules we already discussed about joins also apply to inline views.  Inline views are very handy when you have a set of data you need to summarize and then query from, but you really need a two-step process to do it.  That is, you need one query to summarize the data into the form you need, and another to query the summarized data.  As we've just seen, inline views allow you to combine those steps into a single query.  (In the example above, we really could have written the query without an inline view, but you get the idea.) </p>

<p><span class="bodySubtitle">X. If/Then logic</span><br />
Many times you will need some if/then logic in your SQL statements.  There are a couple of ways to code if/then logic, and the first is the "decode" statement.   Let's look at some examples:</p>

<pre class="code">
SQL&gt; select decode(1,1,'hello','there') val from dual;

VAL
-----
hello

SQL&gt; select decode(1,0,'hello','there') val from dual;

VAL
-----
there
</pre>

<p>As you can see, the decode statement compares the first two values and, if they're equal, returns the third argument ('hello' in this example); if the two values are not equal it returns the fourth argument ('there').</p>

<p>Besides decode, there's also the case statement, which works similarly to a case statement in high level languages such as JAVA or C++.  I prefer the case statement syntax for more complex conditions because as you start to nest decode statements the code becomes very difficult to read.  The other thing to note about decode is that it's part of Oracle's SQL syntax, but most other database vendors use the case statement syntax.  With Oracle, you have the option of either one.</p>

<p>To see how the case statement works, let's write a query against our coder table that will report a coder's color:</p>

<pre class="code">
SQL&gt; select    c.handle
  2           ,case
  3              when c.alg_rating &lt; 900 then 'gray'
  4              when c.alg_rating between 900  and 1199 then 'green'
  5              when c.alg_rating between 1200 and 1499 then 'blue'
  6              when c.alg_rating between 1500 and 2199 then 'blue'
  7              else 'red'
  8            end color
  9  from      topcoder.coder c
 10  where     rownum &lt;= 10 -- only bring back first 10 rows
 11  ;

HANDLE               COLOR
-------------------- -----
kalakaba             blue
viikiin              blue
meenalblues          blue
natasastev           blue
tigerlin0            blue
ziqing               blue
felixx               blue
bosko                blue
Kentaro              green
tashj                blue

</pre>

<p><span class="bodySubtitle">XI. Conclusion</span><br />
Hopefully you can see the power that's at your fingertips when you have a good understanding of how to use SQL.  We've focused on writing queries in this article; in the next installment, we'll look at the INSERT and UPDATE statements and discuss some best practices for application development.</p>

<p>Writing complex SQL queries is something that takes practice, but once you get the hang of it you can get just about any result you need out of the database (assuming you put the data in it in the first place).  I'd encourage you to practice some with your TopCoder database and put some of the techniques in this article to use.</p>

<p><b>References</b>
<ul><li><i>Expert Oracle</i>, by Thomas Kyte</li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://asktom.oracle.com/pls/asktom/f?p=100:11:0::::P11_QUESTION_ID:27523665852829' refer='feature_041907' />">asktom.oracle.com</a></li>
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

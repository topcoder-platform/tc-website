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
   width: 520;
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
    <tc-webtag:forumLink forumID="514866" message="Discuss this article" />
</div>

<span class="bigTitle">A Crash Course in Relational Databases, Part 2</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21684580" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>With the information in the <a href="/tc?module=Static&d1=features&d2=032607">first part</a> of this article, you should have been able to get your own <a target="_blank" href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://www.oracle.com/technology/xe/index.html&amp;refer=feature_032607">Oracle Express Edition</a> database up and running, and get it updated with TopCoder's active algorithm competitor data. In Part 2, we'll look at some of the key concepts and terms that you will encounter as you try to manage and maintain a database like this.</p>

<p><span class="bodySubtitle">VI.  Indexes</span><br />
The <b>index</b> is one of the key concepts in relational databases.  A database index is just like an index in the back of a book -- if you want to find the section on Dijkstra's algorithm in your computer science textbook, you don't start at the beginning and go page by page, you go to the back of the book and look in the index.  In the same way, rather than searching through thousands or even millions of records to find one we're interested in, the database can use its index to quickly find a record.  Although it's out of scope for our discussion here, there are many interesting algorithms used for database indexing, and it truly is a science in itself.  Many types of indexes are B-tree based.</p>

<p>When deciding what columns we need to index, the obvious question to ask is, "What columns will be queried most often and how will they be queried?"  If we look at our coder table, it's pretty clear that one column we would definitely want an index on is the 'handle' column since that is a column that will be queried very heavily.  When creating an index, we have to make a few decisions ahead of time.  First, we have to decide whether the index can be unique -- which we want to do, in this case, since no two coders can have the same handle.  Let's create our index:

<pre class="code">
SQL&gt; <b>create unique index ndxu1_topcoder on topcoder.coder (handle);</b>

Index created.
</pre>

<p>Not only do we get the performance benefit of this index when looking up records by coder handle, but the index also enforces uniqueness on the coder handle.   In other words, if we try to insert another record with the same coder handle we get an error message.  Note that even though the handle is unique for every record, it is not part of the primary key.  We already have a primary key on coder_id.</p>

<p>We can also have indexes on multiple columns.  For example, someone might ask "How many coders from China have an algorithm rating over 2000?"  In this case, we would want an index that uses country_name and alg_rating.  Note that the order in which you specify the columns when creating the index is important.  If you use country_name first then the database can use that field to eliminate all the records that don't contain the country we want, and it can do so <b>before</b> searching by alg_rating, which saves a tremendous amount of time.</p>

<p>What if we are querying by alg_rating and <b>not</b> by country_name?  In this case, it may or may not make sense for the database to use that index, because if country_name is first in the index then it has to scan through many more index entries to find the coders with the desired alg_rating.  There is a program in the database called the "optimizer," which basically makes a query plan to determine what indexes, etc. will be used to run a query.</p>

<p>The optimizer is a huge subject in itself, but for now just remember that it's the engine that figures out if it's going to use your indexes or not.  Sometimes the optimizer will decide that it is best <b>not</b> to use your index, and most of the time the optimizer is right.  There are a lot of things that the optimizer can do, such as breaking your query up into smaller pieces that can be run in parallel, creating temporary indexes on the fly, and many other powerful techniques that are sometimes much faster than using the index you created.  Most databases have utilities that will allow you to see the optimizer's query plan so you can determine exactly what indexes are going to be used.</p>

<p>In addition, some databases such as Oracle have "hints" you can provide to the optimizer, if you want to override the plan and force the use of an index.  Depending on the database vendor, the optimizer can choose to override your hint.  Typically, you do not want to get in the habit of using hints because they generally mean you have bigger problems, but there are times when hints can come in very handy.</p>

<p>At this point you may ask, "Why not just create a index on every possible column combination?"  That's a bad idea -- for one thing, it can consume a lot of unnecessary space in the database.  More important than the  space, though, is the extra time it will take to insert, update, and delete records from the table.  Every time a record is inserted to the table the indexes have to be updated with the latest information for that record.  If you have 20 indexes, all 20 will need to be updated, which can be a tremendous performance killer.  The same is true for deletes and updates.  There are exceptions to this rule --  when doing mass loads of records you can tell the database not to update indexes -- but it's still a very bad practice to use excessive indexes.</p>

<p><span class="bodySubtitle">VII.  Foreign Key Constraints and Referential Integrity</span><br />
A foreign key is used to enforce a direct relationship between two tables.  In the round_results table, we have a column called round_id, which corresponds to the round_id in our round_list table.  We should never have a round_id value in a round_results record that does not have a corresponding record in the round_list table.  In addition, we should never be able to delete a record from the round_list table for which there are associated round_results records.  If either of those scenarios ever happens we have big problems, because it means the data integrity of our database has been compromised.  The way to ensure these problems never happen is by creating a <b>foreign key</b> on the round_id column of our rating_results table, which will enforce those relationships.</p>

<pre class="code">
SQL&gt; ALTER TABLE topcoder.round_results
  2  ADD CONSTRAINT fk_round_results2 FOREIGN KEY (round_id)
  3  REFERENCES topcoder.round_list (round_id);

Table altered.
</pre>

<p>The other relationship we need to enforce is between the coder_id column in our round_results table and our coder table.  In other words, we shouldn't be able to delete a coder record if there are round_results records associated with that coder.  By the same token, we should not be able to insert round_results record for which there is not a corresponding coder record.  Here's the code to create the foreign key for this relationship:</p>

<pre class="code">
SQL&gt; ALTER TABLE topcoder.round_results
  2  ADD CONSTRAINT fk_round_results1 FOREIGN KEY (coder_id)
  3  REFERENCES topcoder.coder (coder_id);

Table altered.
</pre>

<p>An important topic directly related to foreign keys is <b>referential integrity</b>, which Wikipedia defines as "consistency between coupled tables."  As we have just seen, foreign keys are one of the key components enforcing referential integrity.</p>
<p>If you have worked in different software shops you will discover that there are several schools of thought on referential integrity.  In a typical shop, you will have folks called Database Administrators (more commonly known as DBAs) who are responsible for creating objects in the database, taking backups, tuning the database and many other critical tasks.  While many DBAs are strong proponents of referential integrity, others look at it as a performance bottleneck and they avoid it like the plague.  Their philosophy is that the "applications" should handle ensuring the integrity of the data.  The key thing to remember here is that if you cannot guarantee the integrity of your data, it doesn't matter how fast you can retrieve it from the database! </p>
<p>Using application code to enforce referential integrity is a very dangerous practice -- what if you want to write a new application next year to run against that database?  What if a new programming language comes along (that's never happened, has it?) and you want to port your application to this new language?  If you have built all your referential integrity logic into application code, you have to port it carefully to the new language.  But if all your referential integrity rules are built into the database with foreign keys, then all the logic is in one place.  You can then use that latest new language to re-write your application without any worries about whether the referential integrity rules remain intact.  Moreover, you can write any additional applications to your heart's content and never have to recode any referential integrity rules.</p>
<p>As for me, you can probably guess that I am a strong proponent of putting referential integrity in the database, rather than writing application code to enforce it.  I cannot count the number of times that I have had to write "cleanup" SQL scripts because data in the database has become invalid due to lack of proper foreign key relationships between tables -- and believe me, these scripts can be very difficult to write.</p>

<p>Consider our example above, where a record gets deleted from our coder table accidentally, but there is a round_history record associated with it.  You now have an "orphaned" round_history record and no way to get the coder information back (other than reloading the RSS feed).  But wait, the application code was supposed to prevent that from happening!  Well, apparently there was a bug, and as a result we are now missing a record.  While this may be a trivial example, consider a more extreme example where an invoice record gets deleted from a sales database because the IT group decided that referential integrity was too much trouble.  In my experience,  DBAs who cut corners in the area of referential integrity  will pay for it, sooner or later.  If you have any say in the decision making process of your company's database design, I would strongly encourage you to use referential integrity.  It will pay huge dividends for you, your successors, and your company in ensuring the integrity of your company's data. </p>

<p><span class="bodySubtitle">VIII.  Check Constraints</span><br />
Check constraints provide a nice way to enforce business rules on one or more columns in a table.  They allow you to provide a condition that each row in the table must satisfy.  For example, in our round_results table it is clear that the "advanced" column should be restricted to values of "Y" or "N."  Let's add a check constraint to enforce that rule:</p>

<pre class="code">
SQL&gt; alter table topcoder.round_results
  2  add constraint ck_round_results1 check (advanced in ('Y','N'));

Table altered.
</pre>

<p>Now watch what happens if we try to update the advanced column to a value other than 'Y' or 'N':</p>

<pre class="code">
SQL&gt; update topcoder.round_results set advanced = 'X' where rownum=1;
update topcoder.round_results set advanced = 'X' where rownum=1
*
ERROR at line 1:
ORA-02290: check constraint (TOPCODER.CK_ROUND_RESULTS1) violated
</pre>

<p>So constraints can help make sure your data is valid <b>before</b> it gets put into the database.  That brings up another important point, which we hinted at in the section on referential integrity.  <b>The best way to keep bad data out of your database is to never allow it into the database in the first place.</b>  Foreign keys prevent us from "orphaning" records, and check constraints can help ensure that the data we have in our tables makes sense.  We never have to worry about having an invalid value for our "advanced" column because the constraint will never allow that situation to happen.  Again, we could put that rule into our JAVA or C# code, but then we have put the logic in application code -- meaning there is that much more of a chance to get bad data in the database.  It is best to put the business rules as close to the data as possible, which is why check constraints are so useful.</p>

<p><span class="bodySubtitle">IX.  Views</span><br />

Database views are another extremely useful feature of relational databases.  The best way to think of a view is as a stored SQL statement, which you can select from as if it were a database table.  For example, we now have a coder table, a round_list table, and a round_results table.  What if we wanted to know how many coders from South Africa competed in SRM 342?  Clearly, we are going to need information from all three of our tables to determine the answer to that question.  We will discuss SQL joins in an upcoming article, but it's clear that we need to write some kind of query to 'join' these tables together to get our desired information.  We could write a query like this to do the job:</p>

<pre class="code">
SQL&gt; select   count(*)
  2  from     topcoder.round_results r
  3          ,topcoder.round_list    l
  4          ,topcoder.coder         c
  5  where    r.coder_id     = c.coder_id
  6  and      r.round_id     = l.round_id
  7  and      l.short_name   = 'SRM 342'
  8  and      c.country_name = 'South Africa'
  9  ;

  COUNT(*)
----------
         1 
</pre>

<p>But what if we find ourselves running that query often and don't want to have to type the SQL every time?  We can create a <b>view</b> using that SQL, and then  just select directly from the view.  Instead of creating a view specific to SRM 342 and South African coders, though, let's make it more generic, so that we can use it for other SRM and country queries.  Note that if we want to call the column names in our view something different than the column names in the original table, we can do so by providing a column alias.  In the code below, we are using round_full_name instead of full_name and round_short_name instead of short_name so that we know that these columns represent round information (as opposed to a coder's full name or short name, for example).</p>

<pre class="code">
SQL&gt; create or replace view topcoder.coder_round_results as
  2  select    c.handle
  3           ,c.country_name
  4           ,c.alg_rating
  5           ,c.alg_vol
  6           ,c.alg_num_ratings
  7           ,l.full_name         round_full_name
  8           ,l.short_name        round_short_name
  9           ,l.round_type_desc
 10           ,l.round_date
 11           ,r.*
 12  from     topcoder.round_results r
 13          ,topcoder.round_list    l
 14          ,topcoder.coder         c
 15  where    r.coder_id  = c.coder_id
 16  and      r.round_id  = l.round_id
 17  ;

View created.

</pre>

<p>To find out how many South African coders competed in SRM 342, all we have to do is run this SQL:</p>

<pre class="code">
SQL&gt; select count(*) from topcoder.coder_round_results
  2  where round_short_name = 'SRM 342' and country_name = 'South Africa';

  COUNT(*)
----------
         1
</pre>

<p>The view handles the complexity of joining the different tables together, sparing the end user or SQL developer running the query from having to do all the work.</p>
<p>Another big advantage of views comes into play when you have a table where some information is sensitive but other information is not.  Consider a table maintained by the human resources department at a company.  The table may contain very sensitive information, such as salary data, that not everyone in the company should be allowed to see; but the table may also have data in it, such as employee email addresses, that should be available to everyone.  In this case, we can create a view that only allows the users to see the non-sensitive columns, and we can grant the users select permissions on this view.  In this way, we still allow them to see the data they need to, but prevent them from seeing the sensitive data. </p>

<p><span class="bodySubtitle">X. Transactions</span><br />

One of the most important features of  relational databases is the <b>transaction</b>.  Put simply, a transaction is a unit of work done in the database to accomplish a task.  Thomas Kyte, in his book <em>Expert Oracle</em>, defines a transaction as "taking the database from one consistent state to the next."  A transaction may consist of a single update statement, or hundreds of statements, depending on the complexity.  The key thing to remember about transactions is that either <b>all</b> the work is done in a transaction, or <b>none</b> of the work is done.</p>
<p>For example, consider going to the Automatic Teller Machine at your bank and transferring some money from your checking account to your savings account.  There are clearly multiple steps involved in this process: subtracting the transfer amount from the source account, and adding the amount to the target account.  However, if anything goes wrong in any step, we don't want any of the accounts to be updated.  Imagine what would happen if the amount was subtracted from your source account but something went wrong and the amount didn't get added to your target account.    With a transaction, if anything goes wrong all the changes are "rolled back," meaning the database is put back into the state it was in before the transaction started.  It's as if the transaction never happened.</p>
<p>As we mentioned earlier, the way we tell the database we are finished with our transaction is with the 'commit' command.  This command makes our changes permanent in the database.  If we run into a problem (like insufficient funds in a banking transaction), we can issue a 'rollback' command that will effectively 'undo' the changes we made to the database.</p>

<p><span class="bodySubtitle">XI. Triggers</span><br />

Database <b>triggers</b> provide a mechanism for having a piece of PL/SQL code execute when some action takes place, such as a record insert or update.  One common use of triggers is customized auditing on a table.  Oracle has many auditing capabilities available, though, so it's usually best not to reinvent the wheel.</p>
<p>Let's say we've got  an SKU (short for "stock keeping unit") table where we store product information on the products our company sells.  Assume also that we have an SKU_COST table, which contains the cost for each SKU.  Since the cost for each SKU can change periodically, we would like to keep track of its cost over time.  One way to accomplish this tracking would be to create a database trigger, which would fire each time an SKU record was inserted or updated.  On each insert, the trigger would fire to insert a record into the SKU_COST table, since an insert would represent a new SKU.  However, on updates we would only insert a record into the SKU_COST table if the cost for the SKU changed.  We could also keep effective_date and expiration_date columns in our SKU_COST table so we could determine what things cost at different times.  The trigger could handle updating the dates accordingly.</p>
<p>There are many other different ways to use triggers.  The thing to remember, though, is that triggers involve work for the database since extra SQL code has to be executed during each row insert, update, and so forth (depending of course on which events fire the trigger).  If you have a choice between using a trigger or a check constraint, it's usually better to use a check constraint since that involves less overhead.</p>

<p><span class="bodySubtitle">XII. Conclusion</span><br />
We've covered a lot of ground in these articles.  Hopefully you know a little more about relational databases than you did before you read this article, and you can better appreciate the value  of storing and querying your data in a relational database.  You should also have a better understanding of the importance of enforcing data integrity, through tools like referential integrity, to ensure that your company's data is accurate and reliable. Or, at the least, learning how to store RSS feeds in a database should give you a new way to interact with the Web.</p>
<p>There are many topics on relational databases that we didn't have the time or space to cover.  If you'd like to learn more, I'd encourage you to pick up some of the great books that have been written or explore some of the many resources on the Web.</p>
<p>We'll look at SQL in much more depth in a future article. Until then, I'll probably see you around in the Arena!</p>

<p><b>References</b>
<ul><li><i>Expert Oracle</i>, by Thomas Kyte</li>
<li><a target="_blank" href="<tc-webtag:linkTracking link='http://asktom.oracle.com/pls/asktom/f?p=100:11:0::::P11_QUESTION_ID:27523665852829' refer='feature_032907' />">asktom.oracle.com</a></li>
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

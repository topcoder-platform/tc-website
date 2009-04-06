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

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE; 
}
.indent
{
   padding-left: 30px;
}
</style>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
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

<div style="float: right;"><tc-webtag:forumLink forumID="506099" message="Discuss this article" /></div>
<span class="bigTitle">TopCoder @ Work: Introduction to upselling, Part 2</span>

      <p>
      <img src="/i/m/timmac_mug.gif" alt="" border="0" align="left" class="myStatsPhoto"/>
      <img src="/i/m/rhudson_mug.gif" alt="" border="0" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br>
      <span class="smallText"><em>TopCoder Members</em></span><br clear="all" />
      </p>

Last week we attacked a common problem -- selling new ideas and functionality to clients -- with a clever acronym (UPSELL). Today, we'll demonstrate how to apply that methodology to a realistic situation combining common situations we've encountered into a complete story of upselling. 
<br><br>
Suppose you are initially hired by a client to work a one-month contract, taking some information from an Access database, and displaying some reports on the web.  Creating a few basic HTML reports from database tables proves to be trivial; you quickly finish your work. The techie in you speaks: "This system would be much better in ASP.NET and SQL Server 2005. A few third-party controls and some binary formatters would make this perfect." Yet, how do you reconcile your inner geek desires with what the client actually needs?
<br><br>
First, you've got to <b>understand</b> the client's business. He is an accountant, and has been complaining a lot about reporting.  You hear him almost every day in the hallway outside the break room, chatting with his assistants.  They grumble about the endless hours it takes to create the month-end reports in Excel.  They get 50 different spreadsheets and have to cobble them together. Month-end overtime is a way of life; the five member staff just finished a 36 hour weekend on top of the 60 hour work week.  The future looks grim -- the company just acquired two smaller firms and will have to reconcile their data each month on top of the current workload. Temporary workers seem to hinder rather than help -- most of the work is complex and the business processes are locked in the minds of the full-time staff. Your client breaks a cold sweat when someone asks: "What will you do if people quit?"
<br><br>
Based on this overheard conversation, you <b>plan</b> to assist the client in at least three different areas. To standardize the work and move away from the variety of Excel spreadsheets, you could develop a standard interface that accomplishes the same business goals. You might even consider Ajax or Web 2.0 functionality to provide more responsive client-side behavior for people used to the point-and-click widgets of Excel. Second, you could expand the functionality of your web application to include business objects that provide the essential calculations and operations for the month-end process. This would both make the process explicit, "unlocking" it from the minds of a few employees, and reduce the time required to manually combine the spreadsheets.  Moreover, you could provide a robust reporting system that would generate Excel output for month-end processing. These approaches would address the short-term needs of the company.
<br><br>
In the long-term, however, you know that the Access database won't be able to handle the processing load of the data; the MDB file seems to grow exponentially each month as your client's firm acquires new companies and imports their accounting information. The database won't "explode" today, but will soon become a bottleneck for operations. You know that once your application is online, the user base will grow tremendously. Your plan must include an upgrade to a larger, more scalable database like Oracle or Microsoft SQL Server.
<br><br>
Now, you must convert your ideas into something presentable to the client. In a traditional life cycle, you would create requirements, or use cases, and a few flowcharts. More enlightened methodologies like agile development call for different documents and processes. In this case, however, your best approach, in our humble opinion, is to make it simple: show the client pictures. In other words, provide mock screens that depict how the application will look and function. Usability and information architects call these mockups <b>storyboards</b> or wire-frame prototypes.  The site BoxesAndArrows.com provides both articles and templates for this process.
<br><br>
Use the existing month-end spreadsheets, if you can, to determine the rough requirements for the screens. It doesn't matter whether you've captured the process accurately at this point. You'll have enough to demonstrate to the client that you're listening. What you've heard, then, becomes something tangible for the client. Don't limit your storyboards to screens; also mock-up reports that approximate month-end information.  As you <i>walk through</i> the screens with the client and his staff, elicit <i>business rules</i> and processes that would go with each screen. Listen for phrases like "I need to add more than one of those, " or "where are the associated .." Build a narrative from the client reactions to your screens. You can return later to edit and make the business processes more explicit.
<br><br>
At a surface level, nearly every client's first concern is what they can see in front of them immediately. This makes our second sell, the scalable enterprise database, more difficult. Though critical to operations, the database sits <i>in the background</i> and already appears to work. Yet, this functionality is only short-term. You know that an Access database will not be stable over time, but aren't sure how to present this to the client. How do you storyboard "database scalability"?
<br><br>
We've made an attempt here:
<br><br>
<div align="center"><img src="/i/education/090506_01.gif" border="0" alt="" /></div>
<br><br>
This chart illustrates that SQL Server is stable, and capable of supporting many users. Access, however, is unstable, and is clearly hazardous to clients.  Support this image with documentation and case studies from companies who have made the Access to SQL Server migration. Use white papers, vendor recommendations, and your experience in the field. The client will likely identify with and remember the illustration.
<br><br>
Once you've created and presented your planning documents to the client, ensure that you have enough information to estimate the effort required to actually produce the system that you've pitched. Before you begin, however, be sure to finish gathering and documenting requirements and business processes that support your storyboards. You can do this for the entire scope, or for the first part of the system that you'll build. For estimating tips, see our recent TopCoder article: <A href="/tc?module=Static&d1=features&d2=072406">"How long will this take, anyway?"</A>
<br><br>
Your <b>estimate</b> should be divided into phases, that is, the smallest functional deliveries that add value to the system. You might begin by enhancing the entry screens in your application to accommodate user interface requirements gathered from observing Excel spreadsheets. Next, you might integrate the SQL Server and the reporting infrastructure.  Each subsequent delivery may include more screens, or more reports. Keeping delivery schedules small reduces the risk of cost overruns and failure.
<br><br>
Once you've developed and divided your estimates into deliverables (according to phases), <b>lock</b> the first phase with the client. In other words, ensure that the client agrees, or signs off on the requirements and time frame for the particular deliverable you're completing. Work with the client to develop acceptance criteria, like "In this phase, the system must calculate month-end totals for the debit accounts." Plan a time to demonstrate the completed phase to the client, and a time to discuss subsequent phases.
<br><br>
Six months have passed and you're preparing to finish the final statement of work with your client. As you predicted, the user base has increased from the original five staff members to seventy-five people, including managers and executives. The latter group was so impressed with your work that they've added an online newsletter to the set of requirements. You anticipate an endless stream of content update requests; you'll be busy indefinitely. Yet, as a developer you're bored with the idea of modifying an application for each content tweak. The tedium of redeploying for each minor change is almost unbearable. At the same time, you don't want to turn down work.
<br><br>
Or should you? Why not develop dynamic updating, or wiki, capability for these news-oriented sections of the application? While it might seem that you're losing money by relinquishing the work,  you're actually <b>leveraging</b> your relationship with the client and building trust. Providing real-time, do-it-yourself features communicates that you are not scavenging the client for every scrap of free work. Offloading the work to the client empowers the users and also frees you to develop more advanced applications.
<br><br>
Upselling won't always work, and since you're on your own time, in a sense, at least initially, you might burn hours only to be met with a courteous "No, thanks." Not all of the work is wasted, however. You've probably built a set of templates and boilerplate that you can customize for each client. At the same time, though, be sure not to give away "free work" to the client. Requirements, designs and prototypes are valuable; we consider them to be billable work product. Without an arrangement in place, a client can simply take your designs and either complete the work internally or search for a cheaper vendor. Some clients don't believe that they need the documentation; we commonly hear: "I don't need you to tell me how my business works." Clearly, many of these clients <b>do not</b> have a systematic concept of their own business.
<br><br>
Don't let these warnings dissuade you.  Building relationships and creating future business opportunities with clients can be an exciting process. As a software developer, you gain an understanding of the actual impact of technology on real people. This experience translates directly into better work and a better job experience. Your client also gains familiarity with the abilities and constraints of software to solve problems. Ultimately, you both will grow from the cooperative engagement of creating a solution to a problem; you'll gain experience and cash, and your client will save time and money.
<br><br>
<A href="/tc?module=Static&d1=features&d2=082906"><b>Part 1</b></A>
<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>

<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="employmentOpps"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

		<div align="center">
      <img src="/i/contracting/limegroup_logo.gif" border=0/>
		</div>

		<p>
      <A href="#job1">Lead Developer</A><br>
      <A href="#job2">Software Developer (Hedge Fund)</A>
      <br><br>

      <hr noshade="noshade" size="1" />
      <a name="job1"></a>
      <span class="bodySubtitle">Lead Developer</span>
      <br><br>
      <strong>Job description:</strong><br>
      Skills: C++, Java, Linux, SQL, XML, HTML, Perl, Javascript, Postgres<br>
      Permanent Job<br>
      Full Time
      <br><br>
      The <A href="http://www.limegroup.com" target="_blank">LimeGroup</A> is in the process of starting a new company in the field of electronic finance.  This job offers the opportunity to help found a company and architect and build the core systems from the ground up.  We are looking for a person who has both the technical skills to code the application and business/personal skills to grow the team and company over time.
      <br><br>
      Must have very good programming experience.  Strong technical skills using C++/Java, Linux, SQL, XML, Perl, HTML, Javascript.  Object-oriented analysis, design and development required.  Should have experience with a relational database preferably Postgres or MySQL.  Experience with robust and redundant systems a plus. 
      <br><br>
      <a href="/tc?module=JobHit&jid=276&jt=4">Register for this position here!</a>
		<br/><br/>

      <hr noshade="noshade" size="1" />
      <a name="job2"></a>
      <span class="bodySubtitle">Software Developer (Hedge Fund)</span>
      <br><br>
      <strong>Job description:</strong><br>
      Permanent Job<br>
      Full Time
      <br><br>
      Tower Research Capital LLC, a quantitative hedge fund manager, is looking to hire computer programmer with world class intelligence, good math skills, and very strong programming skills to help work on our trading infrastructure.  The firm successfully trades a number of different strategies in a variety of markets.  We have an extremely high performance network that processes a huge amount of financial information in real time.  The team here is made up of an extremely talented group of quantitative financial analysts and programmers.  Please see <A href="http://www.tower-research.com" target="_blank">www.tower-research.com</A> for more details.
      <br><br>
      Job responsibilities include expanding and maintaining our trading capabilities on various markets around the world.  Duties will include: coding connections to new markets, optimizing the performance of our systems, maintaining and expanding our databases of financial information, performing basic systems administration to keep our trading network running, and building risk management and performance tracking tools.
      <br><br>
      Successful candidates will have a degree in math, engineering, or computer science from a top university.   Very strong computer programming skills are required.  Must have solid C++ experience and some Java knowledge.  Linux knowledge is a must and Solaris a plus.  Should be familiar with PC hardware.  Basic Linux system administration skills required.  Knowledge of Perl, shell-scripts, DNS, NFS a plus.  Must be able to work on multiple tasks in a fast-paced environment.   No finance or economics knowledge required.
      <br><br>
      <a href="/tc?module=JobHit&jid=277&jt=4">Register for this position here!</a>
		<br/><br/>

      <hr noshade="noshade" size="1" />
		<br/><br/>
		</p>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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

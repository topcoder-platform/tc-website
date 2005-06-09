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
      <img src="/i/contracting/jpmorgan_logo.gif" border=0/>
		</div>

		<p>
      <A href="#job1">Distributed Computing</A><br>
      <A href="#job2">QA or Configuration Management Specialist</A><br>
      <A href="#job3">Developer in Analytics for the Library Team</A>
      <br><br>

      <span class="bodySubtitle">Company Description</span><br>
      A global financial powerhouse, J.P. Morgan Chase & Co. is an industry leader. With 100,000 employees in over 50 countries, we draw on a full range of capabilities to provide integrated financial solutions for institutions and individuals worldwide. What does this mean for you, the job seeker? Opportunity! Our broad range of financial services activities, from investment banking to retail banking to e-finance, offer an exceptional range of career options for individuals. If you are interested in working in an environment where leadership, excellence, initiative and diversity are among our core values, then explore the opportunities at J.P.
      <br><br>
      <strong>Morgan Chase & Co.</strong><br>
      The Quantitative Research and Development (QR&D) and Risk Methodology (RM) groups develop and deliver quantitative models to production systems and applications to support the trading businesses. The Infrastructure Team within QR&D/RM develops components and technologies which enable and support the delivery of analytics and risk management functionality. The work requires a high level of expertise in C++, Object Oriented (OO) design, as well as familiarity with other technologies. Exposure to derivative products and analytics is a plus.
      <br><br>
      As an Associate in the QR&D/RM Infrastructure Group, you will join a team of people developing infrastructure to deliver analytics and risk management functionality to production systems and applications. The candidate will typically work on projects lasting from one week to a few months. The candidate will work on projects that may include interface design and implementation between analytics libraries, development of risk management components and frameworks, component technologies, and delivery and testing infrastructure.  The candidate may develop some analytic services and small applications, and may participate in projects where grid computing infrastructure is developed and used. The candidate may be required to assist the Applications Delivery team in integrating the analytics and components.
      <br><br>
      <strong>Qualifications</strong><br>
      The specific qualifications required for this position are:
      <ul>
      <li>Education Level: Bachelors is required, Masters is preferred Superior C++ programming skills Excellent software design skills, including OO design Strong NT, Unix, and Linux skills.</li>
      <li>Good math background.</li>
      <li>Good communication skills.</li>
      <li>Ability to work independently and with a team.</li>
      <li>Knowledge of derivative products and analytics is a plus</li>
      </ul>
      JPMorgan Chase offers an exceptional benefits program and a highly competitive compensation package.
      <br><br>
      JPMorgan Chase is an Equal Opportunity and Affirmative Action Employer, M/F/D/V.

      <br><br>
      <hr noshade="noshade" size="1" />
      <a name="job1"></a>
      <span class="bodySubtitle">Distributed Computing</span>
      <br><br>
      Hands on position writing code, but also needs a firm grasp of higher math, excellent communication skills required. Very good understanding of distributed computing required, with multithreading experience preferred. Some experience with code optimization/performance tuning and algorithms would be great. This person would develop software solutions for distributing analytics as well as optimize the speed of the analytics.
      <br><br>
      <a href="/tc?module=JobHit&jid=274&jt=4">Register for this position here!</a>
		<br/><br/>

      <hr noshade="noshade" size="1" />
      <a name="job2"></a>
      <span class="bodySubtitle">QA or Configuration Management Specialist</span>
      <br><br>
      Individual with development/ build and deployment expertise with some scripting skills, make file and source code control (subversion), some Python or similar experience a plus also. Large software library experience a big plus.
      <br><br>
      <a href="/tc?module=JobHit&jid=274&jt=4">Register for this position here!</a>
		<br/><br/>

      <hr noshade="noshade" size="1" />
      <a name="job3"></a>
      <span class="bodySubtitle">Developer in Analytics for the Library Team</span>
      <br><br>
      Must have very good C++ skills, strong math background and problem solving, finance background would be a plus as well. Experience writing financial analytics software would also be a plus.
      <br><br>
      <a href="/tc?module=JobHit&jid=274&jt=4">Register for this position here!</a>
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

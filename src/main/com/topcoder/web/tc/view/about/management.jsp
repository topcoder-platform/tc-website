<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>About TopCoder - Overview</title>

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
                <jsp:param name="level1" value="management"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%" align="center">

         <div class="aboutTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="management_team"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

Founded by Jack Hughes in April, 2001, TopCoder was established with the purpose of identifying top computer software engineers world-wide. Since then, the company's worldwide membership has grown to over 60,000 developers with an accomplished management team that includes some of the most successful software development professionals in the industry. 
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>Jack Hughes - Founder and Chairman</strong>
<br><br>
In November 2000, Jack Hughes founded TopCoder on the premise that talent and skill are the determinant factors in the quality and utility of software-and software has become central to the global economy.
<br><br>
In both his own programming experience and as co-founder and chairman of Tallan Inc., a provider of web-enabled business solutions, Hughes recognized that while successful projects were driven by superior programming skills, the talent was unqualified and largely unrecognized. TopCoder's mission is to create objective ratings that place high value on the programming industries best and brightest, and build opportunity and community for programmers through ongoing programming tournaments and employer connections.
<br><br>
Under Hughes' tenure as chairman at Tallan, the company was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte & Touche and by Inc. magazine for its outstanding performance. In 2000, CMGI, Inc. acquired a majority ownership of the company. 
<br><br>
Hughes holds a B.S. degree in computer science from Boston College.  He is director and vice chair of the executive committee and chair of the strategy committee for the Christopher Reeve Paralysis Foundation.
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>Robert Hughes - President and Chief Operating Officer</strong>
<br><br>
In June 2001, Robert Hughes was named President and Chief Operating Officer of TopCoder, Inc. of Glastonbury, Connecticut.  He is responsible for overseeing the day-to-day operations of the company.  Prior to his role at TopCoder, Hughes served as the Chief Operating Officer of Tallán Inc. since 1997.  Tallán is an Internet professional services firm that creates fully-integrated, technologically advanced solutions for their clients.  From 1992-1997, he held various management positions in recruiting, sales and operations at Tallán. 
<br><br>
During his tenure with Tallán, the company was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte & Touche and by Inc. magazine for its outstanding performance. In 2000, CMGI, Inc. acquired a majority ownership of the company. 
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>David Tanacea - President, TopCoder Software</strong>
<br><br>
David Tanacea is an exemplary software industry leader with the keen ability to turn technology vision into business value.  Appointed president in 2002, he brings more than 20 years of experience to TopCoder Software.  Driving the technology direction and distribution of TopCoder Software's application development offerings, he is best known for increasing the productivity, and decreasing the cost, of the software development process for global companies across all industries.  Tanacea's passion and expertise in the component based development (CBD), component management consulting and productivity tool arenas are reflected in the proven results delivered by TopCoder Software.  He has spoken at a wide range of technology events, and frequently writes for publications and online outlets.
<br><br>
Prior to joining TopCoder Software, Tanacea spent seven years with Tallán Inc., a custom software development company purchased by CMGI in 1999.  As general manager, he led development efforts for marquee Fortune 1000 companies, including Priceline, Ingram Micro, PepBoys, Mott's, Bloomingdale's, Talbots and Best Buy. Tanacea's legacy includes millions of dollars that he has saved clients through the implementation of specialized software to improve their technology infrastructure.
<br><br>
Other career highlights include vice president of information technology for Zany Brainy, vice president of development for Ann Taylor and director of merchandising systems for WaldenBooks.  Tanacea launched his career in the early 1980's with Eastman Kodak as an application developer.
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>Michael P. Morris - Vice President of Software Development</strong>
<br><br>
Joining TopCoder Software in 2002 as the Vice President of Software Development, Michael P. Morris brings a decade of technology experience, across vertical markets, to drive the company's technology vision, product development and virtual project teams.  Morris' commitment to the proper design and development of software applications has elevated him to "guru" status among programmers, managers and chief technology officers alike.  His specialties - Component Based Development and Web services - have earned him published articles, industry recognition and speaking engagements at acclaimed institutions, such as Java One and Harvard University.
<br><br>
Formerly, Morris was the director of design and development for the northern California region of Tallán, a custom software development and consulting company.  Having successfully managed projects for companies, such as Barnes and Noble, eBay, Bertlesmann and Loudeye, Morris established a reputation for quality software design that was delivered on time and under budget.  He was previously a director of design and development, project manager and consultant with Tallán as well.  
<br><br>
Prior to Tallán, Morris served as software programmer for Invensys, a developer of process automation and resource tracking software.  .
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>Dave O'Brien - Vice President of Sales, TopCoder Software</strong>
<br><br>
Dave O'Brien has over 20 years of sales experience in the computer industry.  Prior to joining TopCoder Software, he spent 11 years at Tallán, Inc. holding the positions of Senior Account Executive and Sales Director. O'Brien holds an MBA with a concentration in Computer Science from the University of New Haven and a Bachelor of Science in Business Administration from Quinnipiac University. 
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>Mike Lydon - Chief Technology Officer</strong>
<br><br>
Mike Lydon joined TopCoder in April of 2001 as the Chief Technology Officer.  Lydon brought to TopCoder his 10 years of experience designing and managing large-scale distributed web-based and data-warehousing systems. Prior to joining TopCoder, Lydon worked as Vice President of Technology Services at Tallán, Inc. a custom software development and consulting company. Lydon holds a business degree from the University of Connecticut where his focus was on Information Systems. 
<br><br>
<hr noshade="noshade" size="1" width="100%">
<strong>George Tsipolitis - Vice President of TopCoder Employment Services</strong>
<br><br>
George Tsipolitis manages TopCoder's Employment Services division which uses competition to matches the brightest software engineers in the world with technology companies looking for top talent.    
<br><br> 
Tsipolitis joined TopCoder in September 2001 as Vice President of Development.  As VP of Development, he architected and managed the development of TopCoder's patented algorithm competition software.  He also managed the distributed process of software development projects through the use of the TopCoder member base.  
<br><br> 
Prior to joining TopCoder, Tsipolitis was Senior Project Manager with Tallán, Inc., an Internet professional services firm that creates technically advanced Internet and e-Business solutions for clients.  
            <p><br></p>

         </div>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
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

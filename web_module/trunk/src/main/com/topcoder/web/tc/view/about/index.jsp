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

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

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
                <jsp:param name="node" value="tc_overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="about_tc"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Overview"/>
        </jsp:include>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/><br />

                    <p>TopCoder is fast becoming the major league for programming competitions. TopCoder brings members together once a week to compete online
                    &#40;Single Round Match&#41; and twice a year both online and on location &#40;Tournaments&#41;.</p>

                    <p><span class="bodySubtitle">Why Online Competitions</span><br />
                    Competitions provide an understanding of a person's capabilities through a demonstration of skill. What was lacking in the world of programming
                    competitions was a format that offered immediate and objective scoring. The solution was the creation of a "Single Round Match".</p>

                    <p>In addition to regular Single Round Matches, TopCoder holds two major multiple-round, elimination tournaments each year.  These tournaments span many weeks and include significant prize purses along three independent tracks of competition: algorithm, component design, and component development.</p>

                    <p><span class="bodySubtitle">How Members Benefit</span></p>

                    <ul>
                        <li><A href="/tc?module=Static&d1=about&d2=whyjoin"><strong>Competition</strong></A><br />
                        Each Single Round Match offers a fun, time-based, and challenging set of problems that put a developer's skills to the test. This, coupled
                        with Divisions,</A> offer a more level
                        field of competition for newer members in order to build ratings and move into potential
                        <A href="/tc?module=Static&d1=tournaments&d2=home">Tournament</A> opportunities.</li><br />

                        <li><A href="/tc?module=ViewActiveContests&ph=112"><strong>Design</strong></A> and <A href="/tc?module=ViewActiveContests&ph=113"><strong>Development</strong></A><br />
                        Rated TopCoder members are eligible to participate in TopCoder Component Development. Members submit design and development solutions
                        for these challenging and potentially lucrative projects. Winning solutions are rewarded with cash payouts and royalties. For every
                        commercial sale, TopCoder will pay the members who designed and developed the component a percentage of the sale. </li><br />

                    </ul>

                    <p><span class="bodySubtitle">How Companies Benefit</span></p>

                    <ul>
                        <li><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=tces_home"><strong>Employment Services</strong></A><br />
                        The market for developers is either feast or famine. Regardless of how many developers there are or how many are available,
                        the issue remains the same&#151;how to determine which candidate is best suited to the needs of your organization. While
                        certification has offered some credibility, competitions that test a developer's skills in real-world challenges goes much
                        further to differentiating one candidate from another.</li>

                        <li><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp"><strong>Software</strong></A><br />
                        The best way to drive down the cost of software development is through re-use. The <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/index.jsp">Component Catalog</A>
                        is a tool for increasing re-use and developer productivity within an organization. The component catalog continues to grow on a weekly basis as component
                        requirements are generated through requests from catalog customers, research from TopCoder Product Managers and from application development.</li><br />

                        <li><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=index"><strong>Sponsorship</strong></A><br />
                        Reaching the developer community is a difficult task at best. Marketing budgets are limited and with the advent of the Internet,
                        the expectation for measuring results has only grown. TopCoder offers companies a means of targeting this desired community
                        through the targeted sponsorship of Single Round Matches
                        and <A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournaments.</A></li><br />
                    </ul>

                    </td>
                </tr>
            </table>

            <p><br></p>
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

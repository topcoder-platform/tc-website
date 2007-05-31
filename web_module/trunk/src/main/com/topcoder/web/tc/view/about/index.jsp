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

                    <p>TopCoder is the major league for programming competitions. With more than 100,000 registered members from all over the world, TopCoder brings people together to compete in a range of programming challenges both online and in live, on-site tournaments.</p>

                    <p><span class="bodySubtitle">Why Online Competitions</span><br />
                    How do you tell the difference between a good programmer and a great programmer? Through competition, you can determine a person's capabilities -- before TopCoder, though, the world of programming competitions lacked a format that offered immediate and objective scoring. The solution was the "Single Round Match," an intense online competition in which competitors code solutions, and review and test each other's work, in less than two hours.</p>

                    <p>In addition to regular online matches, TopCoder holds three major multiple-round, elimination tournaments each year -- one for high-school students, one for college students, and our TopCoder Open, which is open to all. These tournaments span many weeks and include significant prize purses along multiple tracks of competition.</p>
                    
                    <p>Of course, TopCoder recognizes that there's more to software than code; how software looks, and how easy it is to use, can make a big difference. Accordingly, the company launched TopCoder Studio, to give designers a chance to bring their creative skills to the table and compete.</p>

                    <p><span class="bodySubtitle">How Members Benefit</span></p>

                    <ul>
                        <li><A href="/tc?module=Static&d1=about&d2=whyjoin"><strong>Algorithm Competitions</strong></A><br />
                        Each Single Round Match offers a fun, time-based, and challenging set of problems that put a developer's skills to the test. By sorting developers into divisions - and providing dedicated matches for high school students - these matches offer a more level field of competition for newer members in order to build ratings and move into potential <a href="/tc?module=Static&d1=tournaments&d2=home">Tournament</a> opportunities.</li><br />
                        
                        <li><A href="/longcontest/?module=Static&d1=instructions"><strong>Marathon Matches</strong></A><br />
                        For members who like the intellectual challenge of algorithms, but prefer to work over a longer timeline, TopCoder offers Marathon Matches. The problems in these matches are generally more complex than those in Single Round Matches, and reward competitors who are focused on testing and refining their code.</li><br />

                        <li><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/tc?module=ViewActiveContests&ph=112"><strong>Design</strong></A> and <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/tc?module=ViewActiveContests&ph=113"><strong>Development</strong></A><br />
                        For members looking for real-world experience, and more lucrative prizes, TopCoder offers competitions to design and development software components. Winning solutions are rewarded with cash payouts and royalties. For every commercial sale, TopCoder will pay the members who designed and developed the component a percentage.</li><br />

                        <li><A href="/tc?module=Static&d1=dev&d2=assembly&d3=overview"><strong>Software Assembly</strong></A><br />
                        TopCoder's first team-based competition, Assembly competitions offer members the ultimate real-world challenge: assembling, deploying, and testing a fully functional software application.</li><br />
                        
                        <li><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>"><strong>TopCoder Studio</strong></A><br />
                        With contest ranging from icon and logo design to Web application "mashup" concepts, TopCoder Studio offers a host of creative challenges for designers and programmers.</li><br />
                    </ul>

                    <p><span class="bodySubtitle">How Companies Benefit</span></p>

                    <ul>
                        <li><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp"><strong>Software</strong></A><br />
                        The best way to drive down the cost of software development is through re-use. The <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/index.jsp">Component Catalog</A>
                        is a tool for increasing re-use and developer productivity within an organization. The component catalog continues to grow on a weekly basis as TopCoder members design and develop components to meet the needs of application development clients and catalog customers.</li><br />
                        
                        <li><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=index"><strong>Sponsorship</strong></A><br />
                        Reaching the developer community is a difficult task at best. Marketing budgets are limited and, with the advent of the Internet, the expectation for measuring results has only grown. TopCoder offers companies a means of targeting this desired community through the targeted sponsorship of Single Round Matches and <A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournaments.</A></li><br />
                        
                        <li><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=tces_home"><strong>Employment Services</strong></A><br />
                        Regardless of how many developers there are in the job market, the issue remains the same -- how to determine which candidate is best suited to the needs of your organization. While certification has offered some credibility, competitions that test a developer's skills in real-world challenges goes much further to differentiating one candidate from another.</li>
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

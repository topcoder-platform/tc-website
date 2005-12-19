<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Computer Programming Tournament</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="tournament"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <h1 class="testHead">Tournament Sponsorship</h1>

                        <p>TopCoder is the X-Games of software development. Our tournaments are known worldwide as the
                        most grueling, comprehensive sport in programming.  The events allow competitors to solve complex
                        algorithmic problems and design and develop working pieces of reusable software.  All current
                        technologies are incorporated, including Java, C++, C#, VB.Net, UML, J2EE and .NET.</p>

                        <p><strong>The TopCoder Open (TCO)</strong>, our fall event, is host to professional and collegiate
                        developers.  This event is dominated by the highest rated members in the TopCoder community, but
                        enjoys heavy participation and spectatorship from developers of all levels.  Our flagship event,
                        the TCO routinely draws substantial press in the US and abroad.</p>

                        <p><img src="/i/corp/TCCC04.jpg" width="200" height="200" alt="" border="0" align="right" ><strong>The TopCoder Collegiate Challenge (TCCC)</strong>, our spring event, involves thousands
                        of university-level students majoring in everything from computer science to mathematics to
                        applied physics.  The students compete head-to-head over several online elimination rounds until
                        the best are flown in to compete in person at the onsite finals.  As with the TCO, the destination
                        of the finals varies from year to year.</p>

                        <ul>
                            <li>TopCoder develops all aspects of each event including rules, regulations, eligibility,
                            registration, event website, competition manual, practice rooms, problem writing, testing
                            and coordination.</li>

                            <li>TopCoder provides flexible competition platforms such as algorithm, software component
                            design, and software component development.</li>

                            <li>TopCoder's global member base of over 38,000 developers generates significant word-of-mouth
                            momentum as registration spikes around the tournaments.  Over 30% of new members sign on due
                            to referral from a TopCoder member.</li>
                        </ul>



                        <p>TopCoder tournaments draw a global participation base from among the top collegiate and professional
                        developers.  All participants are ranked and rated based on their performance.  TopCoder also gathers
                        a wealth of data for each participant in order to demonstrate their ability to comprehend complex
                        problems, form a logical solution to the problem and use a relevant programming language to solve
                        the problem.  We also capture details on design and development skills in the form of code samples
                        and working software the candidates build.  If you have ever thought that there must be a better way
                        to recruit programmers, you were right.  TopCoder is the answer.</p>

                        <p><strong>Past TopCoder Tournaments</strong></p>

                        <table width="530" border="0" cellpadding="5" cellspacing="0" align="center">
                        	<tr>
                        		<td align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=about"><img src="/i/corp/tourny_tco05.gif" width="182" height="88" alt="" border="0"></a></td>
                        		<td align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/corp/tourny_tccc05.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                        	<tr>
                        		<td align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/corp/tourny_tco04.gif" width="182" height="88" alt="" border="0"></a></td>
                        		<td align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_about"><img src="/i/corp/tourny_tccc04.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                        	<tr>
                        		<td align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final"><img src="/i/corp/tourny_tco03.gif" width="182" height="88" alt="" border="0"></a></td>
                        		<td align="center"><a href="/index?t=tournaments&c=tccc03_champ"><img src="/i/corp/tourny_tccc03.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                        	<tr>
                        		<td colspan="2" align="center"><a href="/index?t=tournaments&c=2002tccc_champ"><img src="/i/corp/tourny_tccc02.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                       </table>

                       <p>For more information, contact Paul Moriarty at <a href="mailto:tces@topcoder.com?subject=Request For Information - Tournament Sponsorship">tces@topcoder.com</a> or 866.TOP.CODE</p>

                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="tces_home"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Why Join TopCoder?</title>

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
                <jsp:param name="level1" value="about"/>
                <jsp:param name="level2" value="whyjoin"/>
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
           <jsp:param name="title" value="Why Join TopCoder?"/>
        </jsp:include>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/><br />
<span class="bodySubtitle">Algorithm Competitions</span><br>
TopCoder algorithm competitions offer a unique perspective on problem solving.  It's one thing to program a working solution, but it's a whole different level, the TopCoder level, when you're competing with other programmers to get that solution.  TopCoder algorithm competitions give members a chance to test their knowledge, their speed, and their efficiency in an arena with <i>thousands</i> of other programmers.  Care to find out just how good of a programmer you are?  TopCoder is the place to do it.<br><A href="/tc">Learn more...</A>
<br><br>
<span class="bodySubtitle">Component Competitions</span><br>
TopCoder component competitions involve designing and developing software components, not just for recognition, but for some serious prize money.  Aside from whatever earnings you get from the competition itself, members also get royalties for winning components they design or develop.<br><A href="/?t=development&c=index">Learn more...</A>
<br><br>
<span class="bodySubtitle">Ratings and Statistics</span><br>
What good is a competition without the proper statistics to quantify the results?  As an active TopCoder member, programmers receive a rating in up to 3 different types of competition: algorithm, component design, and component development.  In addition to ratings, each active member has a wealth of statistics that track their progress in the world of competitive programming.<br><A href="/stat?&c=round_overview">Learn more...</A>
<br><br>
<span class="bodySubtitle">Educational Content</span><br>
The TopCoder member base includes some of the best programmers in the world.  That's a pretty serious knowledge base.  Want some new tips and strategies?  Check out the TopCoder Educational Content section, where other members offer great info on how to make yourself not just a better TopCoder competitor, but a better programmer in general.  Got a question?  Check out our <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>">Forums</A>.  Other competitors are always willing to help you out.<br><A href="/tc?module=Static&d1=tutorials&d2=alg_index">Learn more...</A>
<br><br>
<span class="bodySubtitle">Employment Opportunities</span><br>
We are aggressively seeking out companies that have a strong need for the level of talent that only TopCoder members can provide. TopCoder does all of the leg work for you - we find the companies, look for the right positions and when we find a match, we present you with the opportunity. Only after you confirm your interest in a particular position will TopCoder pass on your information to the appropriate hiring manager. Before you even talk to the company's representative, TopCoder will make sure your salary requirements, job requirements, and relocation requests are met. Best of all, TopCoder provides this service for full time and contract work at no cost to you.<br><A href="/">Learn more...</A>
                    <br><br>
                    <div align="center"><strong>- There is no cost to <a class="bodyText" href="/Registration"><strong>register</strong></a> or participate in any match or tournament -</strong></div>
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

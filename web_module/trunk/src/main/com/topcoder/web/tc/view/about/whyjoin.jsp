<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Student Representatives</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
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

                    <p><span class="bodySubtitle">Competition</span><br/>
                    TopCoder's competitions are designed for technologists and are unique in several ways. The key to TopCoder's competition process 
                    is the immediacy and objectivity of each and every Single Round Match. With TopCoder, competitors do not await results and the 
                    announcement of winners from a panel of judges that take days or even weeks to arrive at a decision.</p>
                    
                    <p>The process is simple. There are three problem statements (per match) with ascending point value. The coder to submit the 
                    most accurate solution in the shortest amount of time is awarded the most potential points. The key is that a coder's submission 
                    is challenged not only by the TopCoder system, but first by the other participating coders in the match. A coder's entire potential 
                    point base (and possible win) can be altered should another coder find a means of "breaking" the submission.</p>
                    
                    <p><span class="bodySubtitle">Learning</span><br/>
                    TopCoder attracts the best programmers in the US and soon, the world. While you may not be able to beat the best programmers 
                    (welcome to the club - neither can we!), many of our members learn a great deal from the top developers. There is nothing like 
                    honing one's skill in the heat of competition. Since TopCoder is split by division, you won't be in problems over your head. As 
                    you compete more and more, you will be able to draw from some of the best talent out there. Also, every problem we create goes 
                    into our practice rooms. Competitor solutions are available to every participating member. What better way to learn, than from 
                    the masters!</p>
                    
                    <p><span class="bodySubtitle">Points and Ratings</span><br/>
                    The more a coder competes, the better their rating can become. Ratings are the key determining factor for establishing the initial 
                    elimination field for either the Invitational Tournament or Collegiate Challenge. A coder's rating is based on several factors 
                    (detailed ratings overview), but the basic idea is that ratings are based upon the points gained in a given match, the number of 
                    matches competed in, and how that stacks up against other coders with similar points and matches.</p>
                    
                    <p>As you look through the site, you will see color coding with member's handles. These colors indicate the rating level of that 
                    member. Participating members (those who compete versus spectate) are able to view each other's profiles, past code 
                    submissions, stats and more.</p>
                    
                    <p><span class="bodySubtitle">Prizes</span><br/>
                    Although there are no prizes awarded for the Single Round Matches, major TopCoder tournaments offer a substantial total purse. 
                    The purse for these tournaments ranges anywhere from $100,000 to $250,000.  TopCoder holds two major tournaments per year: 
                    the Collegiate Challenge, open for full-time students, and the Invitational, open to all eligible members.</p>
                    
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
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>

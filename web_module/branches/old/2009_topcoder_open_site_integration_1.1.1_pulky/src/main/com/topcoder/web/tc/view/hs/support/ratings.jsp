<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="hs_rating_system"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
         <jsp:include page="../../page_title.jsp" >
         <jsp:param name="image" value="hs_support_faqs"/>
         <jsp:param name="title" value="High School Rating System"/>
         </jsp:include>

<span class="bigTitle">High School Rating System</span>
<br><br>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
<TR>
<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD HEIGHT="1" VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="2" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD VALIGN="top"><br>
<TABLE WIDTH="104" BORDER="0" CELLSPACING="0" CELLPADDING="1" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR><TD COLSPAN="4" ALIGN="left" VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;&#160; Rating Key</TD></TR>
<TR>
<TD ROWSPAN="7" WIDTH="5"><IMG SRC="/i/clear.gif" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
<TD WIDTH="100%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD ROWSPAN="7" WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
</TR>                     
<TR><TD CLASS="coderTextRed" ALIGN="left" NOWRAP="">2200+</TD></TR>                   
<TR><TD CLASS="coderTextYellow" ALIGN="left">1500 - 2199</TD></TR>
<TR><TD CLASS="coderTextBlue" ALIGN="left">1200 - 1499</TD></TR>
<TR><TD CLASS="coderTextGreen" ALIGN="left">900 - 1199</TD></TR>
<TR><TD CLASS="coderTextGray" ALIGN="left">0 - 899</TD></TR>
<TR><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>
<TR BGCOLOR="#FFFFFF"><TD COLSPAN="3" CLASS="smallText" VALIGN="top">A coder's handle is color-coded depending on their rating within the Competition Arena.</TD></TR>
</TABLE>

<!-- <TABLE WIDTH="104" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD COLSPAN="2"><IMG ALT="" HEIGHT="128" WIDTH="104" src="/i/ranks_2.gif"></TD>
</TR>
<TR>
<TD><IMG ALT="" HEIGHT="2" WIDTH="14" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="2" WIDTH="90" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD CLASS="smallText" VALIGN="top">&gt;&gt;</TD>
<TD CLASS="bodyText" VALIGN="top"><B>Rating Key</B></TD>
</TR>
<TR>
<TD><IMG ALT="" HEIGHT="1" WIDTH="14" SRC="/i/clear.gif" BORDER="0"/></TD><TD><IMG ALT="" HEIGHT="1" WIDTH="90" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top"></TD>
<TD CLASS="smallText" VALIGN="top">A coder's handle is color-coded depending on their rating within the Competition Arena.</TD>
</TR>
</TABLE> -->
</TD><TD VALIGN="top"><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="top">
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD COLSPAN="2"><IMG ALT="" HEIGHT="5" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD><IMG ALT="" HEIGHT="1" WIDTH="10" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD CLASS="bodyText"><br><br>
<B>How the TopCoder Rating System Works:</B><br><br>
The following statistics are kept about each coder:
<UL>
<LI>Rating</LI>
<LI>Volatility</LI>
<LI>Number of times previously rated</LI>
</UL>
Before competing, new members ratings are provisional.<br><br> 
After a competition the algorithm below is applied to the competitors. First, the ratings of members who have previously competed are calculated, with new members' performances not considered. Second, new members are given a rating based on their performance relative to everyone in the competition. Please note that only individuals and individual team members will be rated for High School matches. Teams will not have a collective rating.
</TD>
</TR>
</TABLE>
</TD>
</TR>
</TABLE> 
<P><br></P>
</TD>
</TR>
<TR>
<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>
<span class="bodySubtitle">How algorithm ratings are calculated</span>
<br><br>
<B>New ratings are calculated as follows:</B>
<br>
<br>
After each competition, each coder who attended the competition is re-rated according to
the following algorithm.  Keep in mind that only coders who shared the same problem set are rated against one another.  The average rating of everyone in the competition is calculated:
<br>
<br>
<IMG ALT="average rating" HEIGHT="58" WIDTH="167" SRC="/i/rating/avg.gif" ALIGN="center" BORDER="0"/><br>
<br>
Where NumCoders is the number of coders in the competition and Rating is the 
rating without the volatility of the coder in the competition before the competition.
<br>
<br>
<B>The competition factor is calculated:</B>
<br>
<br>
<IMG ALT="competition factor" HEIGHT="62" WIDTH="356" SRC="/i/rating/cf.gif" ALIGN="center" BORDER="0"/><br>
<br>
Where Volatility is the volatility of the coder in the competition before the competition.
<br>
<br>
<b>Win Probability Estimation Algorithm:</b>
<br>
<IMG ALT="win probability" SRC="/i/rating/wp.gif" ALIGN="center" BORDER="0"/><br>
<br>
Where Rating1 &amp; Vol1 are the rating and volatility of the coder being compared to, and Rating2 &amp; Vol2 are the rating and volatility of the coder whose win probability is being calculated.  Erf is the "<A href="http://mathworld.wolfram.com/Erf.html" target="_blank">error function</A>".  
<br>
<br>
The probability of the coder getting a higher score than another coder in the 
competition (WPi for i from 1 to NumCoders) is estimated.  
The expected rank of the coder is calculated:
<br>
<br>
<IMG ALT="expected rank" SRC="/i/rating/er.gif" ALIGN="center" BORDER="0"/><br>
<br>
<B>The expected performance of the coder is calculated:</B>
<br>
<br>
<IMG ALT="expected performance" HEIGHT="34" WIDTH="170" SRC="/i/rating/ep.gif" ALIGN="center" BORDER="0"/><br>
<br>
Where <IMG ALT="inverse standard normal" HEIGHT="11" WIDTH="11" SRC="/i/rating/phi.gif" BORDER="0"/>
is the inverse of the standard normal function.
<br>
<br>
<B>The actual performance of each coder is calculated:</B>
<br>
<br>
<IMG ALT="expected performance" HEIGHT="34" WIDTH="170" SRC="/i/rating/ap.gif" ALIGN="center" BORDER="0"/><br>
<br>
Where ARank is the actual rank of the coder in the competition based on score 
(1 for first place, NumCoders forlast).  If the coder tied with another coder, 
the rank is the average of the positions covered by the tied coders.
<br>
<br>
<B>The performed as rating of the coder is calculated:</B>
<br>
<br>
<IMG ALT="performed as" HEIGHT="14" WIDTH="286" SRC="/i/rating/pa.gif" ALIGN="center" BORDER="0"/><br>
<br>
<B>The weight of the competition for the coder is calculated:</B>
<br>
<br>
<IMG ALT="weight of the competition" SRC="/i/rating/wt.gif" ALIGN="center" BORDER="0"/><br>
<br>
Where TimesPlayed is the number of times the coder has been rated before.
<br>
<br>
To stabilize the higher rated members, the Weight of members whose rating is 
between 2000 and 2500 is decreased 10% and the Weight of members whose rating 
is over 2500 is decreased 20%.
<br>
<br>
<B>A cap is calculated:</B>
<br>
<br>
<IMG ALT="cap" HEIGHT="37" WIDTH="186" SRC="/i/rating/cap.gif" ALIGN="center" BORDER="0"/><br>
<br>
<B>The new volatility of the coder is calculated:</B>
<br>
<br>
<IMG ALT="new volatility" SRC="/i/rating/nv.gif" ALIGN="center" BORDER="0"/><br>
<br>
<B>The new rating of the coder is calculated:</B>
<br>
<br>
<IMG ALT="new rating" HEIGHT="37" WIDTH="253" SRC="/i/rating/nr.gif" ALIGN="center" BORDER="0"/><br>
<br>
If |NewRating - Rating| &#62; Cap the NewRating is adjusted so it is at most Cap different than Rating.
<br>
<br>

<br>
<P><br></P>
</TD>
<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>      
<TR>
<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>   
<TR>
<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
</TABLE>

         <p><br></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="tchs"/>
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

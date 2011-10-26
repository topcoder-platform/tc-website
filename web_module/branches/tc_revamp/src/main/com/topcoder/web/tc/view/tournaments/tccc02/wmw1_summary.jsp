<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;The next TopCoder competition:</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="40%">&#160;Match</TD>
<TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="40%">&#160;Date</TD>
<TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="20%">&#160;Time</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/tc?module=MatchDetails&amp;rd=4070" CLASS="statText">Single Round Match 68<!-- 2002 TCCC First Round W/MW --></A></TD>
<TD VALIGN="middle" CLASS="statText">Thursday, February 27</TD>
<TD VALIGN="middle" CLASS="statText">9:00pm EST</TD>
</TR>
                    <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: <!-- Single Round Match 67 - Feb 20, 2002 -->TCCC First Round W/MW- February 21, 2002</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-I -->West Region</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" COLSPAN="3" CLASS="statText">

<P>
<A HREF="/tc?module=MemberProfile&cr=129672" CLASS="coderTextRed">doeth</A>, the third seed in the region, was the top point-getter and winner of Room 19.  <A HREF="/tc?module=MemberProfile&cr=129672" CLASS="coderTextRed">doeth</A> completed all three problems in the "Coding Phase" for 1419.02 points, and added an additional 150 in the "Challenge Phase", for a total of 1569.02.  <A HREF="/tc?module=MemberProfile&cr=129672" CLASS="coderTextRed">doeth</A> made it to the Third Round of the 2001 TopCoder Invitational last fall, and is currently ranked third overall among all TopCoder members.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=114443" CLASS="coderTextRed">jonmac</A>, runner-up in the 2001 Collegiate Challenge, champion of the 2001 Invitational, and top-seed in the region, advanced to the second round by winning Room 17.  <A HREF="/tc?module=MemberProfile&cr=114443" CLASS="coderTextRed">jonmac</A> finished with 1320.58 final points after completing all three problems for 1220.58 in the "Coding Phase", and earning 100 points for two successful challenges in the "Challenge Phase".
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=264462" CLASS="coderTextGreen">shengbo2k</A>, the 52nd ranked coder in the region, was the lowest seed to win a room.  <A HREF="/tc?module=MemberProfile&cr=264462" CLASS="coderTextGreen">shengbo2k</A> won Room 13 by completing the 250-point problem for 171.04 points in the "Coding Phase", and adding 50 points to that total with a successful challenge of the 500-point submission of nave in the "Challenge Phase", to finish with 221.04 final points.
</P>



</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-II -->Midwest Region</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<P>
<A HREF="/tc?module=MemberProfile&cr=109965" CLASS="coderTextYellow">vulture</A> was the top-scorer in the MidWest region.  <A HREF="/tc?module=MemberProfile&cr=109965" CLASS="coderTextYellow">vulture</A> earned 1196.99 final points by correctly coding all three problems.  <A HREF="/tc?module=MemberProfile&cr=109965" CLASS="coderTextYellow">vulture</A>, the region's sixth seed, is no stranger to the Collegiate Challenge, having finished third overall in the 2001 TopCoder Collegiate Challenge in June of 2001, and winning $25,000.  
</P>

<P>
The top-seed in the MidWest is <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A>, who finished second in Room 4 behind <A HREF="/tc?module=MemberProfile&cr=251561" CLASS="coderTextBlue">Wolfgang</A>, the 47th seed.  <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> actually had more points than <A HREF="/tc?module=MemberProfile&cr=251561" CLASS="coderTextBlue">Wolfgang</A> (1046.55 to 997.68) after both completed all three problems in the "Coding Phase".  During the "Challenge Phase", however, <A HREF="/tc?module=MemberProfile&cr=251561" CLASS="coderTextBlue">Wolfgang</A> was successful in challenging the 1000-point submission of pozdol for 50 points, giving <A HREF="/tc?module=MemberProfile&cr=251561" CLASS="coderTextBlue">Wolfgang</A> the room win over <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> by a very slim 1.13 points (1047.68 to 1046.55).
</P>

<P>
Another close battle took place in Room 2, as <A HREF="/tc?module=MemberProfile&cr=157578" CLASS="coderTextGray">Radgast</A>, the region's 126th seed, nipped 49th ranked <A HREF="/tc?module=MemberProfile&cr=260272" CLASS="coderTextBlue">rfu</A>, 253.45 to 245.16.  Since both coders gained 50 points in the "Challenge Phase", the difference in points occurred in the "Coding Phase", where <A HREF="/tc?module=MemberProfile&cr=157578" CLASS="coderTextGray">Radgast</A> was just one minute and 24 seconds quicker coding the 250-point problem.
</P>

<P>
View the Top-10 Winners:<BR/>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_ne" CLASS="statText">Northeast Top-10</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_se" CLASS="statText">Southeast Top-10</A><BR/>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_w" CLASS="statText">West Top-10</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_mw" CLASS="statText">Midwest Top-10</A><BR/>
</P>
</TD>
</TR>

</TABLE>




   </TD>
  </TR>
</TABLE>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>

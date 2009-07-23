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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
</TR>
                    <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: 2002 TCCC First Round NE/SE - February 19, 2002</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-I -->Northeast Region</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<P>
<A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A> was the top scorer in the first round of the 2002 Sun and TopCoder Collegiate Challenge.  <A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A>, who is the fifth seed in the Northeast region, was the winner in Room 11 after answering all three problems for 1294.76 points in the "Coding Phase".  <A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A> then gained 100 additional points with two successful challenges in the "Challenge Phase", to finish with 1394.76 final points.  <A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A> was successful in his challenges of the 500 and 1000-point submissions of langer.  This is the first major tournament <A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A> has entered, having become a member on January 3, 2002.  
</P>

<P>
The top-seed in the Northeast, <A HREF="/tc?module=MemberProfile&cr=147102" CLASS="coderTextRed">pl31415</A>, had the second highest point total.  <A HREF="/tc?module=MemberProfile&cr=147102" CLASS="coderTextRed">pl31415</A> won Room 7 with 1342.69 final points after submitting the correct code for all three problems.  <A HREF="/tc?module=MemberProfile&cr=147102" CLASS="coderTextRed">pl31415</A> made it to the third round of the 2001 TopCoder Invitational.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=252281" CLASS="coderTextYellow">turian</A>, ranked 26th in the region, was the winner of Room 4 with 1184.17 points.  <A HREF="/tc?module=MemberProfile&cr=252281" CLASS="coderTextYellow">turian</A> submitted the correct code for all three problems for 1134.17 points in the "Coding Phase", and added 50 points to that total in the "Challenge Phase" by successfully challenging the 500-point submission of <A HREF="/tc?module=MemberProfile&cr=265960" CLASS="coderTextGreen">m-doggg</A>.  This is the first major tournament for <A HREF="/tc?module=MemberProfile&cr=252281" CLASS="coderTextYellow">turian</A>.
</P>


</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-II -->Southeast Region</TD>
</TR>
<TR>
<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<P>
<A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A>, the 2nd seed in the region, was the top point-getter and winner of Room 19.  <A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A>, the current Coder of the Week, earned all 1340.76 points in the "Coding Phase".  This is the first major tournament for <A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A>, a member since January 23, 2002.  The third highest score in the region belonged to the second place finisher behind <A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A> in Room 19, <A HREF="/tc?module=MemberProfile&cr=111057" CLASS="coderTextYellow">bm999</A>.  <A HREF="/tc?module=MemberProfile&cr=111057" CLASS="coderTextYellow">bm999</A> earned 1183.52 by submitting code for all three problems in the "Challenge Phase".
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=251289" CLASS="coderTextGreen">EtherMage</A>, the 99th seed, was the big surprise of the first round.  <A HREF="/tc?module=MemberProfile&cr=251289" CLASS="coderTextGreen">EtherMage</A> answered all three problems in the "Coding Phase" for 987.68 points, but was in fourth place.  <A HREF="/tc?module=MemberProfile&cr=251289" CLASS="coderTextGreen">EtherMage</A> then earned 200 additional points in the "Challenge Phase" with four successful challenges to win Room 20.  <A HREF="/tc?module=MemberProfile&cr=251289" CLASS="coderTextGreen">EtherMage</A> gained an impressive 400 rating points for this performance.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A>, the region's top seed, finished in second place in Room 18 with 710.50 points.  <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> earned 1134.54 points in the "Coding Phase" to lead the room.  The 500-point submission of <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> failed the system test, however, dropping <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> to second place, and giving the room win to <A HREF="/tc?module=MemberProfile&cr=251989" CLASS="coderTextYellow">AdamSelene</A>.  <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> was a finalist in the 2001 TopCoder Invitational.
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

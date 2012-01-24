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
<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR><TD WIDTH="100%" ALIGN="left" VALIGN="top" CLASS="statText">
<BR/><DIV CLASS="statTextBig">2001 TopCoder Invitational Recap</DIV><BR/>
<P>On November 2-3, 2001, 16 of the top computer programmers in the country descended upon the Foxwoods Resort Casino in Mashantucket, Connecticut for the semifinals and final of the 2001 TopCoder Invitational.  The tournaments purse was $250,000, with the winner receiving $100,000.</P>
<P>The tournament began in September with 256 of TopCoder's top-rated members competing in three online elimination rounds, which reduced the field to the final 16.</P>
<B>8:00am - SEMIFINAL A</B>
<P><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108262" CLASS="coderTextYellow">mathgodleo</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=138663" CLASS="coderTextYellow">Sord</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A> got the semifinal rounds started at 8:00 am on Friday morning.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>, the top-rated coder for the Invitational, had a 1187.32 to 1138.80 lead over <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=138663" CLASS="coderTextYellow">Sord</A> after the "Coding Phase", in which they both coded all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108262" CLASS="coderTextYellow">mathgodleo</A>, who completed two of the three problems, were third and fourth, respectively.  In the "Challenge Phase", <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> successfully challenged the 250-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A> for 50 points to secure the round win and advance to the finals with 1237.32 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108262" CLASS="coderTextYellow">mathgodleo</A> successfully challenged the 1000-pointer of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A> for 50 points, and moved into second place when <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A> successfully challenged the 250-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=138663" CLASS="coderTextYellow">Sord</A>, and the 500-pointer from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=138663" CLASS="coderTextYellow">Sord</A> failed the system test.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=138663" CLASS="coderTextYellow">Sord</A> finished third in the room, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A> came in fourth.</P>
<B>11:00am - SEMIFINAL B</B>
<P>In the second morning session, three of the four coders finished all three problems during the "Coding Phase", with only 64.61 points separating them.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115147" CLASS="coderTextYellow">kyotov</A> (1169.90) was in first, followed by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> (1154.56) and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150852" CLASS="coderTextYellow">sundberg</A> (1105.29).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153091" CLASS="coderTextYellow">dziegler</A> was in fourth with 447.62 points.  In the "Challenge Phase", <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> successfully challenged the 1000-point code of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115147" CLASS="coderTextYellow">kyotov</A> causing him to lose the 731.36 points he earned from that problem.  Those 50 points were all <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> needed to win the room and advance to the finals.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=150852" CLASS="coderTextYellow">sundberg</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153091" CLASS="coderTextYellow">dziegler</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115147" CLASS="coderTextYellow">kyotov</A> finished second, third and fourth, respectively.</P>
<B>3:00pm - SEMIFINAL C</B>
<P>In the first round of the afternoon, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A> put on an impressive display as the only member in his round to complete all three problems in the "Coding Phase", earning 1144.79 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> submitted code for two of the problems, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> submitted code for one.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A> was 1-for-2 in the "Challenge Phase", and watched all three of his codes pass the system test to win the round and advance to the finals.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A> finished second in the round, as both of his submissions passed the system test, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> finished third and fourth, respectively.</P>
<B>6:00pm - SEMIFINAL D</B>
<P>The final afternoon round produced the biggest surprise of the day, as <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A>, the 2001 TopCoder Collegiate Challenge champion was upset.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A>, who successfully coded the 250-point problem, but had his 500-pointer fail the system test, was the round winner.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A>, the leader after the "Coding Phase", finished second, with <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> finishing third and fourth, respectively.  A failed challenge and the failure of his 500-point submission, caused <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> to fall short in his bid for his second major TopCoder championship.</P>
<B>FINALS</B>
<P>With the top-two seeds of the tournament, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>, the top-rated coder at the time, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>, and a Collegiate Challenge finalist, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A>, all in the finals, a close, suspenseful match is what was expected, and a close, suspenseful match is what took place.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> had the lead at the conclusion of the "Coding Phase" with 1298.32 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A> (1277.43) and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> (1143.22), who like <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> submitted code for all three problems were a close second and third, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A> was fourth with 498.59 points, having completed two of the three problems.  As the "Challenge Phase" began, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>, who had lost in the finals of the Collegiate Challenge to <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> by 7.64 points, went on the offensive.  He first challenged the 1000-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>, but failed and lost 50 points.  Not losing his composure, he regrouped and successfully challenged the 1000-pointer of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>, regaining the 50 points he lost, and most importantly causing <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A> to lose 627.83 points and fall to third.  In an even more dramatic event, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A> successfully challenged the 250-point code of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>.  This resulted in <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> losing the 225.97 points he earned on that problem, and falling to second place, 70.87 points (1143.22 to 1072.35) behind the 2001 TopCoder Invitational champion <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>.</P>
</TD></TR>
</TABLE>
<P><BR/></P>
</TD>
<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>   
<TR>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

<jsp:include page="links_summary.jsp" />

<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 1 - Upset City!</B></FONT><BR/>
<I>Well rested derkuci advances to finals.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#" CLASS="bodyGeneric"></A> -->

<P>
While they yawned and wiped the sleep out from their eyes, the four coders in the 8am round of the 2002 Sun 
Microsystems and TopCoder Collegiate Challenge performed before a crowd reminiscent <IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>of a Montreal Expos home 
game, although the tension filled atmosphere provided as much passion as Game Seven of The World Series.
</P>

<P>
At about 9:50 am, everyone's eyes had cleared enough to see that Cal Tech's <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> had pulled off a huge 

upset and advanced to Saturday's final with 600.27 final points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A>, who began the competition as 
the 13th Seed in the West region, defeated <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 (466.07 final points), who was the top-seed in the 
MidWest region and the Regional Champion, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> (180.11), the top-seed in Southeast region, and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> 
(93.30), the MidWest's second seed.
</P>

<P>
The competition started with all four coders opening the Level One problem.  After compiling and testing 
for over 20 minutes, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
, followed minutes after by <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, stopped coding the Level One problem 
and opened the Level Two problem.  "It was just too tedious," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>.  "I had already spent plenty 
of time on it, and needed to move on."  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> was the first to submit code for the Level One problem, 
and earned 180.11 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> stuck with the problem for a long time and ended up earning 140.90.
</P>

<P>
Following suit, everyone next opened, compiled and submitted the Level Two problem.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> was the 
quickest to submit and earned 476.36 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> was the fourth to open the problem, but earned 
the second highest point total, 459.37.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 earned 416.07 and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> earned 407.77.
</P>

<P>
All four coders had enough time to open the Level Three problem, but only <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A>, 491.61 points, 
and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, 483.41, were able to submit their codes before the "Coding Phase" ended.  As a matter 
of fact, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> submitted his Level Three code with just seconds remaining.
</P>

<P>
At the end of the "Coding Phase", <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> led with 1148.08 points.  He was followed by <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> 
(984.48), <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> (600.27), and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 (416.07).  
</P>

<P>
Although there was a lot of activity during the "Challenge Phase", the <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 challenge of 
the Level Two submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> was the only success of the phase.  That challenge cost 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> the 466.07 points he earned on that problem, and caused him to drop to second place.  
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> was the leader heading to the "System Test Phase".
</P>

<P>
The Level One submissions of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A>, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A>, and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> all passed the system test.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> 
also had his Level Two submission pass, as did <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
, but <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> failed.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ambrose" CLASS="bodyGeneric">ambrose</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, 
the only two to submit code for the Level Three problem, saw their codes fail.  "I thought my Level 
Two submission was right, but it ended up timing out," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>.  "I knew my Level Three submission was wrong."
</P>

<P>
"I feel great," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A>.  "I brought my lap-top with me and last night went to the library 
and practiced two problems in the TopCoder practice rooms.  I then got a good nights rest to sleep 
off the jet lag.  I usually go to bed at 3 or 4am, but last night was in bed at 11pm."
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR101.jpg"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR102.jpg"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR103.jpg"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR104.jpg"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR105.jpg"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR106.jpg"><IMG SRC="/i/2002tccc/SFR106_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR107.jpg"><IMG SRC="/i/2002tccc/SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR108.jpg"><IMG SRC="/i/2002tccc/SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR109.jpg"><IMG SRC="/i/2002tccc/SFR109_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR110.jpg"><IMG SRC="/i/2002tccc/SFR110_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR111.jpg"><IMG SRC="/i/2002tccc/SFR111_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
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

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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">

<P><IMG SRC="/i/2002tccc/tourney_photo5.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 4 - Go Joe!</B></FONT><BR/>
<I>3 from the West and 1 from the Midwest Advance to the Finals.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->


<P>
Three is a very popular number in the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  
It was easy to determine that out of the 16 semifinalists, there were three competitors each 
<IMG SRC="/i/2002tccc/coder_quote5.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
from Stanford University and the California Institute of Technology.  Through the first three 
rounds, one student each from those schools, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> from Cal Tech and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> from Stanford, 
has advanced to the finals.  What wasn't common knowledge, however, was that there was another 
group of three involved in the tournament, the contingent from the state of Michigan.  
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A> is a student at the University of Michigan, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> is a Michigan resident, 
and the 6pm round winner, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>, is a student at Michigan Tech.  Following the pattern 
set by <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, who were the one member of their groups of three to advance 
to the finals, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> seemed destined to make the finals, after <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> were 
eliminated earlier in the day.
</P>

<P>
The 6pm round turned out to be the closest match of the day, with <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> surviving the 
failure of his Level One and Two problems to advance to the finals with 510.29 final 
points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>, who was the second seed in the MidWest at the beginning of the Collegiate 
Challenge, is the only finalist who is not from the West Region.
</P>

<P>
"Surprised and ecstatic" were the first words <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> used when asked to describe how he felt 
about advancing to the finals.  "However, I am a little nervous about the finals," added <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>.  
"Matching up against the likes of TopCoder veterans <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> will be quite a challenge."
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>, 
the Northeast Regional Champion, actually would have won the match 
had he not attempted an ill-fated challenge.  Entering the "Challenge Phase" with 
525.69 points from his Level One and Two submissions, which would eventually pass the 
system test, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> 
attempted to challenge the Level One submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>, which he 
noticed had been submitted with only seconds left in the "Coding Phase".  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> 
ended up being unsuccessful in his challenge, thereby losing 50 points.  That one move 
has cost <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> anywhere from $4,000 to $99,000 he could have additionally won in the 
finals, since the Level One and Two submissions of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> ended up failing the system test, 
leaving him with just the 510.29 points he earned on the Level Three problem.  Had 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> not challenged the Level One submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>, he would have won the room 
by 15.40 points, 525.69 to 510.29.  Instead of advancing to the finals, 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> 
finished third with 475.60 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Wasteland" CLASS="bodyGeneric">Wasteland</A> successfully coded the Level One and 
Two problems for 489.35 points and a second place finish, while evd earned 449.66 
points, also from successfully coding the Level One and Two problems. 
</P>

<P>
"I thought there was a bug and thought it was a good idea at the time," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>, 
when asked about his unsuccessful challenge.   "Looking at it now, I see that I didn't 
need to do anything."
</P>
          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR401.jpg"><IMG SRC="/i/2002tccc/SFR401_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR402.jpg"><IMG SRC="/i/2002tccc/SFR402_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR403.jpg"><IMG SRC="/i/2002tccc/SFR403_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR404.jpg"><IMG SRC="/i/2002tccc/SFR404_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR405.jpg"><IMG SRC="/i/2002tccc/SFR405_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR406.jpg"><IMG SRC="/i/2002tccc/SFR406_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR407.jpg"><IMG SRC="/i/2002tccc/SFR407_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR408.jpg"><IMG SRC="/i/2002tccc/SFR408_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR409.jpg"><IMG SRC="/i/2002tccc/SFR409_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR410.jpg"><IMG SRC="/i/2002tccc/SFR410_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR411.jpg"><IMG SRC="/i/2002tccc/SFR411_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR412.jpg"><IMG SRC="/i/2002tccc/SFR412_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR413.jpg"><IMG SRC="/i/2002tccc/SFR413_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
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

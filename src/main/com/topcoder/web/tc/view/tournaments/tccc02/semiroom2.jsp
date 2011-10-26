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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_photo3.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 2 - dmwright...dominates!</B></FONT><BR/>
<I>Stanford junior makes 2nd consecutive finals appearance.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->


<P>
A late arriving Los Angeles-esque crowd gathered to witness the 11am 
round of the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  
<IMG SRC="/i/2002tccc/coder_quote3.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
Perhaps it was the smell of the lunch that was being set up that brought 
the spectators, but more likely it was to watch TopCoder tournament veteran 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> strut his stuff.  
The junior from Stanford University, who is 
TopCoder's only member to make it to the semifinals of their first three 
major tournaments, didn't disappoint those who attended, as he advanced 
to his second consecutive final by submitting code for all three problems 
and 1114.91 final points.
</P>

<P>
"I'm not nervous at all," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, 
when asked about returning for 
his second consecutive appearance in a TopCoder major tournament final.  
"I'll just treat it like a Single Round Match, and block everyone else around me out."
</P>

<P>
2001 TopCoder Invitational semifinalists <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> finished 
second and third with 566.59 and 260.51 final points, respectively, while 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> had a rough time in his first semifinals appearance, and finished with -50.
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A> threw the first curve into the match, as he attacked the hard Level 
Three problem, while everyone else chose the easier Level One problem.  
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> 
finished the problem first and earned 214.73 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> 
finished minutes later, and earned 207.89 points.  Meanwhile, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> 
and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A> were struggling, losing time and valuable points as they pressed 
to complete their respective codes, but it just wasn't meant to be.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A> 
ended up leaving the Level Three problem, and opened the Level One problem, 
which he submitted for 222.34 points.  "I figured if I could submit the 
Level Three problem in a decent amount of time, I might have enough points 
to beat out the guys who went after the Level One problem first," remarked 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A>.  "I just couldn't figure it out, and had to move on."  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> 
stopped compiling code for the Level One problem, and went after the Level 
Two problem, for which he ended up earning 310.51 points.  "I didn't think I 
could code a solution that would run in the allotted amount of time 
(under eight second)," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, when asked about why he decided to move on.
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> ended up earning 397.86 points on his Level Two submission, 
and was the only coder in the room to finish the Level Three problem, gaining 502.32.
</P>

<P>
After the "Coding Phase", <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> led the way with 1114.91 points, 
far ahead of second place <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A> (566.59), third place <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> (475.61), 
and fourth place <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> (310.51).
</P>

<P>
While the 548.32-point lead for <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> may have seemed insurmountable 
to onlookers, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A>, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A>, and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> all knew that there was a 
"Challenge Phase" ahead, and that they would have their opportunity to prove 
if the high point total of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> was warranted.  To their disappointment, 
however, all three guys were unable to break any of the code 
submitted by <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, and he remained far ahead entering the "System Test
 Phase".  The only action in the "Challenge Phase" was unsuccessful 
 challenges by <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> on each other's Level Two 
 submissions.  Those ill fated attempts cost each coder 50 points.
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, all three submissions, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#Logan" CLASS="bodyGeneric">Logan</A>, his Level One and Two, and 
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, his Level Two, all passed through the system test unscathed.  
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A>, however, wasn't as fortunate, as his Level One and Two submissions both failed.
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR201.jpg"><IMG SRC="/i/2002tccc/SFR201_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR202.jpg"><IMG SRC="/i/2002tccc/SFR202_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR203.jpg"><IMG SRC="/i/2002tccc/SFR203_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR204.jpg"><IMG SRC="/i/2002tccc/SFR204_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR205.jpg"><IMG SRC="/i/2002tccc/SFR205_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR206.jpg"><IMG SRC="/i/2002tccc/SFR206_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR207.jpg"><IMG SRC="/i/2002tccc/SFR207_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR208.jpg"><IMG SRC="/i/2002tccc/SFR208_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR209.jpg"><IMG SRC="/i/2002tccc/SFR209_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR210.jpg"><IMG SRC="/i/2002tccc/SFR210_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR211.jpg"><IMG SRC="/i/2002tccc/SFR211_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR212.jpg"><IMG SRC="/i/2002tccc/SFR212_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR213.jpg"><IMG SRC="/i/2002tccc/SFR213_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR214.jpg"><IMG SRC="/i/2002tccc/SFR214_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR215.jpg"><IMG SRC="/i/2002tccc/SFR215_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR216.jpg"><IMG SRC="/i/2002tccc/SFR216_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
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

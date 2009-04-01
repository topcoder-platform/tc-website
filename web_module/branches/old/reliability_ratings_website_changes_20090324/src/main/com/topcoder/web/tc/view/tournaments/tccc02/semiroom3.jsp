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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">

<P><IMG SRC="/i/2002tccc/tourney_photo4.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 3 - malpt Continues West Coast Supremacy!</B></FONT><BR/><BR/>
<!-- <I>subhead goes here</I><BR/><BR/> -->
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->


<P>
As the music of The Pretenders played to open the 3pm round of the 2002 Sun Microsystems and 
TopCoder Collegiate Challenge, all four coders hoped they would end the match known as a 
<IMG SRC="/i/2002tccc/coder_quote4.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
"contender", rather than a "pretender".
</P>

<P>
Even though local favorite <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A>, an MIT graduate student, recovered from his food 
poisoning experience and had a larger cheering section, Cal-Berkeley's <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A>, who 
attended MIT as an undergraduate, and whose girlfriend still attends MIT and was in 
attendance, earned 845.81 final points and a spot in Saturday's final.
</P>

<P>
"I'm relieved," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A>, when asked about he felt after the match, and who 
showed the most emotion of any winner so far today by raising his hands in victory.  
When asked about his competition in the finals, which includes perennial TopCoder 
tournament finalist <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> remarked, "I beat him in the Regional Finals, 
so I'm not scared."
</P>

<P>
All four coders opened the Level One problem first.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> was the first competitor to 
complete it and gained 230.04 points.  The three others, almost sensing that <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> had 
just submitted, all finished their codes in the next few minutes.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> earned 228.66 
points, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> gained 221.02, while <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> was awarded 218.60.  
</P>

<P>
Coding by degree of difficulty, all four next opened the Level Two problem.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A>, 
who as just mentioned earned the lowest point total on the Level One problem, was 
the quickest to code the Level Two problem, earning 326.39 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A>, with 
317.48 points, once again had the second highest point total for a problem.  
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> was the third quickest with 298.75, while <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> gained 238.07.  When asked 
about being the slowest to code the Level Two problem, after being the quickest to 
code the Level One problem, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> simply replied, "I just w<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A>d to be careful."
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> were the only two coders to submit code for the Level Three problem.  
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> earned 612.34 points on that problem, for a total of 1157.34 overall, and the 
room lead after the "Coding Phase".  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> was second with 1074.47 points, after 
gaining 528.33 points on the Level Three problem.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> were third and 
fourth, with 519.77 and 468.11 points, respectively.
</P>

<P>
During the "Challenge Phase", <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> lost 50 points when his challenge of the 
Level Two submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> failed.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> then changed the entire complexion of 
the match, when his successful challenge of the Level Three submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A>, 
cost <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> the 612.34 points he earned on the problem, and dropped him from first 
to second place overall.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> then tried to put himself back in contention, by 
trying to challenge the Level Three submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A>, who was now the room leader.  
That challenge failed, however, and cost <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> an additional 50 points.   
</P>

<P>
After the "Challenge Phase", the point totals were as follows: <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> (1074.47), <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#po" CLASS="bodyGeneric">po</A> 
(518.11), <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> (495.00), and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> (469.77). 
</P>

<P>
The Level One submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> and the Level Two submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#ante" CLASS="bodyGeneric">ante</A> were the 
only submissions to fail the system test.
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR301.jpg"><IMG SRC="/i/2002tccc/SFR301_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR302.jpg"><IMG SRC="/i/2002tccc/SFR302_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR303.jpg"><IMG SRC="/i/2002tccc/SFR303_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR304.jpg"><IMG SRC="/i/2002tccc/SFR304_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR305.jpg"><IMG SRC="/i/2002tccc/SFR305_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR306.jpg"><IMG SRC="/i/2002tccc/SFR306_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR307.jpg"><IMG SRC="/i/2002tccc/SFR307_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/SFR308.jpg"><IMG SRC="/i/2002tccc/SFR308_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR309.jpg"><IMG SRC="/i/2002tccc/SFR309_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR310.jpg"><IMG SRC="/i/2002tccc/SFR310_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR311.jpg"><IMG SRC="/i/2002tccc/SFR311_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR312.jpg"><IMG SRC="/i/2002tccc/SFR312_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="/i/2002tccc/SFR313.jpg"><IMG SRC="/i/2002tccc/SFR313_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/SFR314.jpg"><IMG SRC="/i/2002tccc/SFR314_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
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

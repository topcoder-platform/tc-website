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
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<!-- TC top special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">          
  <TR>  
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
  <TR>  
    <!-- <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
    <TD VALIGN="middle" WIDTH="100%" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="50" CLASS="bodyText">
    <FONT SIZE="5" COLOR="#000000" FACE="tahoma,verdana,arial"><B>The&#160;Sun/TopCoder&#160;Collegiate&#160;Challenge</B></FONT><br>
    Stanford Junior Daniel Wright wins in 3rd tournament appearance</TD>   
    <!-- <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
  </TR>
  <TR>  
    <TD VALIGN="top" BGCOLOR="#FFFFFF" ALIGN="center"><IMG SRC="/i/2002tccc/tourney_photo6.jpg" ALT="" WIDTH="450" HEIGHT="155" HSPACE="2" VSPACE="3" BORDER="0"/></TD>   
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText">

<P>
<!-- <FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 4 - Go <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>!</B></FONT><br> 
<I>3 from the West and 1 from the Midwest Advance to the Finals.</I><br><br> -->
<br>
Saturday, April 20, 2002<br>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><br>
</P>
<!-- <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#" CLASS="bodyGeneric"></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A>" CLASS="bodyGeneric"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>" CLASS="bodyGeneric"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>" CLASS="bodyGeneric"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A></A>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A>
 -->


<P>
Three times happened to be the charm for <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  After advancing to the semifinals in the 2001 
Collegiate Challenge and the 2001 Invitational, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> finally came out on top and won the 2002 
<IMG SRC="/i/2002tccc/coder_quote6.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
Sun Microsystems and TopCoder Collegiate Challenge on Saturday, April 20, at the University Park Hotel @ MIT.
</P>

<P>
Perhaps Stanford University should rename itself "TopCoder West".  That's because Stanford's 
jonmac was the champion of the 2001 TopCoder Invitational, giving the school two of the first 
three TopCoder major tournament champions.
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, the number two-ranked TopCoder member, started the championship match off by opening
 the Level Two problem, while <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A>, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>, and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> all tackled the Level One problem. <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> 
 
 was the first to submit his code and earned 228.56 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> finished shortly 
 thereafter, gaining 227.96 and 223.09, respectively.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A>, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> and <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> all headed for 
 the Level Two problem next.
</P>

<P>
Meanwhile, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> took a good amount of time on the Level Two problem, shocking most
 spectators, who were expecting a top score.  "The Level Two problem was very technical," 
 said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  "I had to be careful because it was easy to make an error."  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> 
 finally submitted the Level Two problem for 274.20 points, and opened the Level 
 Three problem.  When asked about his strategy for opening the Level Two problem 
 first, and then going for the Level Three problem, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> responded, "Even if 
 it took a little longer to code, the Level Two and Three problems are worth more
  points, so I figured I could outscore the coders who attempted to code the Level
   One and Two problems in succession." 
</P>

<P>
As the minutes passed the room became more animated as spectators watching soon
 realized the difficulty of the problems that the competitors had been presented 
 
 with. Twenty-seven minutes into the match, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> abandoned his attempt at the 
 Level Two problem and moved on to the Level Three problem.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> did exactly the same soon after. 
</P>

<P>
Eighteen minutes into his effort on Level Three problem, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> made the decision 
to move on to the Level One problem in an effort to secure points, as none of the other
 coders had yet to submit on either the Level Two or Three.
</P>

<P>
After a brief effort, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> submitted on the Level One problem for 219.05 points. 
 As the "Coding Phase" ended, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> lead with 493.25 points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> was second 
 with 228.56, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> was third with 227.95, while <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> was fourth with 223.09.
</P>

<P>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> kicked off the "Challenge Phase" with a successful challenge of the Level 
One submission of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A>.  Those additional 50 points gave <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> a total of 278.56 
points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> then tried to break the Level One and Two codes of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  If 
he has been successful with either challenge, he would have won the championship. 
 To his dismay and the delight of <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>, however, he was unable to, and after 
 everyone's remaining code passed the system test, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A> was declared the winner
  with 493.25 final points.  <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind#derkuci" CLASS="bodyGeneric">derkuci</A> finished second with 278.56 points, <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#malpt" CLASS="bodyGeneric">malpt</A> was 
  third with 227.96, while <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon#Joe" CLASS="bodyGeneric">Joe</A> finished fourth.  
</P>

<P>
"It's really nice to win after making the semifinals in last year's Collegiate 
Challenge and Invitational," said <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  "My adrenaline was flowing, and I
 really got absorbed in the problems.  I was able to block out all of the spectator 
 activity, and finally submit code without any bugs in it.  Bugs in my code have cost
  me in past major tournaments."
</P>


    </TD>
  </TR>

  <TR>  
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
</TABLE> 
          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><br>
<A HREF="/i/2002tccc/CHMP01.jpg"><IMG SRC="/i/2002tccc/CHMP01_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP02.jpg"><IMG SRC="/i/2002tccc/CHMP02_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP03.jpg"><IMG SRC="/i/2002tccc/CHMP03_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/CHMP04.jpg"><IMG SRC="/i/2002tccc/CHMP04_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><br>
<A HREF="/i/2002tccc/CHMP05.jpg"><IMG SRC="/i/2002tccc/CHMP05_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP06.jpg"><IMG SRC="/i/2002tccc/CHMP06_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP07.jpg"><IMG SRC="/i/2002tccc/CHMP07_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="/i/2002tccc/CHMP08.jpg"><IMG SRC="/i/2002tccc/CHMP08_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><br>
<A HREF="/i/2002tccc/CHMP09.jpg"><IMG SRC="/i/2002tccc/CHMP09_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP10.jpg"><IMG SRC="/i/2002tccc/CHMP10_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP11.jpg"><IMG SRC="/i/2002tccc/CHMP11_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="/i/2002tccc/CHMP12.jpg"><IMG SRC="/i/2002tccc/CHMP12_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><br>
<A HREF="/i/2002tccc/CHMP13.jpg"><IMG SRC="/i/2002tccc/CHMP13_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
<A HREF="/i/2002tccc/CHMP14.jpg"><IMG SRC="/i/2002tccc/CHMP14_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>              
<A HREF="/i/2002tccc/CHMP15.jpg"><IMG SRC="/i/2002tccc/CHMP15_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
<A HREF="/i/2002tccc/CHMP16.jpg"><IMG SRC="/i/2002tccc/CHMP16_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><br>
<A HREF="/i/2002tccc/CHMP17.jpg"><IMG SRC="/i/2002tccc/CHMP17_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
<A HREF="/i/2002tccc/CHMP18.jpg"><IMG SRC="/i/2002tccc/CHMP18_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
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

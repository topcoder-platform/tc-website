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
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>           
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: <!-- Single Round Match 69 - Feb 28, 2002 -->2002 TCCC Regional Semifinals - March 6</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                        
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-I --> Northeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<P>
Top-seeded <A HREF="/tc?module=MemberProfile&cr=147102" CLASS="coderTextRed">pl31415</A> won Room 5 by coding the 250 and 1000-point problems and finishing with 847.55 final points.  <A HREF="/tc?module=MemberProfile&cr=159052" CLASS="coderTextYellow">lbackstrom</A>, the 13th seed, earned a place as a wildcard in the regional championships by finishing second in the room with 786.10 points.  
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A>, the second seed, earned 1223.49 final points by coding all three problems to win Room 6.  That point total was the highest of the round.  
</P>
<P>
<A HREF="/tc?module=MemberProfile&cr=263580" CLASS="coderTextYellow">enderx</A>, who is ranked 30th and is the long shot of the region, was the only other coder in the room to code all three problems.  <A HREF="/tc?module=MemberProfile&cr=263580" CLASS="coderTextYellow">enderx</A> finished with 977.58 final points to finish second in the room and advance to the regional championships as a wildcard.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A> was the top-seed in Room 8 and ended up winning that room with 925.52 final points.  <A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A> coded the 250 and 1000-point problems.
</P>

                 </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>        
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-II --> Southeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            
<P>
Top-seeded <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A>
 was the winner in Room 9.  <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A>
 coded the 250 and 1000-pointers and finished with 773.90 final points.  <A HREF="/tc?module=MemberProfile&cr=251289" CLASS="coderTextBlue">EtherMage</A>, who is ranked 99th and is the lowest ranked coder in the region and tournament, garnered a spot in the regional championships with a second place finish in the room. 
</P>

<P>
The second seed, <A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A>, who had a region-high 1039.49 final points, won room 10.  <A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A> was the only coder in the room to code all three problems.  2001 Invitational finalist <A HREF="/tc?module=MemberProfile&cr=111202" CLASS="coderTextYellow">ColinMacLeod</A> finished second in the room and is headed to the regional championships. 
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=135178" CLASS="coderTextYellow">Firewind</A>, the top-seed in the room and fourth ranked coder in the region, was the winner in Room 11. <A HREF="/tc?module=MemberProfile&cr=135178" CLASS="coderTextYellow">Firewind</A> earned 726.85 final points by coding the 250 and 1000-point problems.  <A HREF="/tc?module=MemberProfile&cr=265334" CLASS="coderTextYellow">levantri</A>, the seventh seed, coded the same problems as <A HREF="/tc?module=MemberProfile&cr=135178" CLASS="coderTextYellow">Firewind</A> and added a successful challenge to finish a close second in the room with 708.95 final points.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=157628" CLASS="coderTextYellow">ShakeSpace</A>, the sixth seed, pulled off a minor upset by winning Room 12 with 809.80 final points.  <A HREF="/tc?module=MemberProfile&cr=157628" CLASS="coderTextYellow">ShakeSpace</A> coded the 250 and 1000-pointers.  The top seed in the room was the fifth seed, <A HREF="/tc?module=MemberProfile&cr=156848" CLASS="coderTextYellow">TPcoder</A>, who finished second with 417.28 final points, but didn't make the regional championships.
</P>



          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-I --> West Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<P>
<A HREF="/tc?module=MemberProfile&cr=114443" CLASS="coderTextRed">jonmac</A>, the top seed in the region and in the tournament, earned a region-high 1107.87 final points by coding all three problems and having one successful challenge, to win Room 13.  <A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A> was the only other coder to code all three problems in the room.  <A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A>
 earned 931.86 points and finished second.
</P>

<P>
Room 14 was won by <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> the region's second seed.  <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> coded the 250 and 1000-point problems and had one successful challenge to finish with 794.29 final points.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A>, the second seeded coder in Room 15 and sixth seed in the region, was the upset winner.  <A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A> coded the 250 and 1000-pointers and had two successful challenges, finishing with 918.50 final points.  The top seed in the room was <A HREF="/tc?module=MemberProfile&cr=129672" CLASS="coderTextRed">doeth</A>, who was ranked third in the region.  <A HREF="/tc?module=MemberProfile&cr=129672" CLASS="coderTextRed">doeth</A> finished with 290.87 final points, which wasn't enough to advance to the regional championships as a wildcard.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A>, the third seed in Room 16 and 13th seed in the region, was the winner with 1029.63 final points.  <A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> was the only coder in the room to code all three problems.  <A HREF="/tc?module=MemberProfile&cr=120816" CLASS="coderTextRed">malpt</A>, the top seed in the room and fourth in the region, will be a wildcard after finishing third in the room with 706.21 final points.
</P>

                 </TD>
            </TR>
        <!-- <TR>
          <TD COLSPAN="3" CLASS="statTextBig" WIDTH="1">There were no Division-I coders in this round.</TD>    
        </TR> -->             
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>        
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-II --> Midwest Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            
<P>
Four of the top-six seeded coders won the four rooms in the MidWest region.  Top-seeded <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> won Room 1 with 938.69 final points, the highest total for the region. <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> was the only coder in the room to code all three problems.  <A HREF="/tc?module=MemberProfile&cr=112441" CLASS="coderTextYellow">seacow</A>, the eighth seed and a 2001 Collegiate Challenge finalist, finished second in the room with 619.81 points to advance to the regional championships as a wildcard.
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=142795" CLASS="coderTextRed">Joe</A>, the second seed, won Room 2 with 935.55 final points.  Like <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> in Room 1, <A HREF="/tc?module=MemberProfile&cr=142795" CLASS="coderTextRed">Joe</A> was the only coder in the room to code all three problems.  <A HREF="/tc?module=MemberProfile&cr=154619" CLASS="coderTextBlue">hilfiger</A>, the 56th seed and Cinderella story of the region, will be a wildcard by finishing second with 684.05 points.  
</P>

<P>
<A HREF="/tc?module=MemberProfile&cr=109965" CLASS="coderTextYellow">vulture</A>, the sixth seed, was the upset winner in Room 3.  <A HREF="/tc?module=MemberProfile&cr=109965" CLASS="coderTextYellow">vulture</A> coded the 250 and 1000-point problems and earned 798.47 final points.  <A HREF="/tc?module=MemberProfile&cr=112939" CLASS="coderTextYellow">zoidal</A>, the number three seed in the region and top seed in the room, finished third in the room with 687.58 final points. <A HREF="/tc?module=MemberProfile&cr=112939" CLASS="coderTextYellow">zoidal</A> coded the 250 and 1000-pointers, enough to advance to the regional championships as a wildcard.
</P>

<P>
Room 4 was won by the number four seed, <A HREF="/tc?module=MemberProfile&cr=252076" CLASS="coderTextYellow">Wasteland</A>.  <A HREF="/tc?module=MemberProfile&cr=252076" CLASS="coderTextYellow">Wasteland</A> was the only coder in the room to code more than one problem.  <A HREF="/tc?module=MemberProfile&cr=252076" CLASS="coderTextYellow">Wasteland</A> coded the 250 and 1000-point problems and finished with 765.11 final points.  The big surprise in the MidWest was that the number five seed <A HREF="/tc?module=MemberProfile&cr=151418" CLASS="coderTextYellow">ChaiBot</A> was eliminated.
</P>



<P>
View the Top-10 room winners:<BR/>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_regions" CLASS="statText">All Regions</A> 
<!-- | <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_4_wins_se" CLASS="statText">Southeast</A><BR/>
<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_4_wins_w" CLASS="statText">West</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_4_wins_mw" CLASS="statText">Midwest</A><BR/>
 --></P>
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

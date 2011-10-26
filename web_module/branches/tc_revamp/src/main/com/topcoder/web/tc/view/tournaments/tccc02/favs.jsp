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
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="4" CLASS="statText">Tournament Breakdown:<BR/>
              <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind" CLASS="statText">The Cinderellas</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs" CLASS="statText">The Favorites</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon" CLASS="statText">Keep Your Eye On...</A>
              </TD>
            </TR>          
            <TR>
              <TD COLSPAN="4" ALIGN="center"><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR>           
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;The Favorites</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
The big cheese.  The head honcho.  The top gun.  The dictionary defines a favorite as "a competitor judged most likely to win."  And win is exactly what the favorites have done so far in their TopCoder careers, as all of the favorites are among the top-25 in all-time room wins.  Let's take a deeper look at the four coders who have earned the distinction of favorites:
                 </TD>
            </TR> 
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="ZorbaTHut"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Northeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;2</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2794</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Oberlin College</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" ALIGN="center" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Comments:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/ZorbaTHut_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
With top-seeded pl31415 being eliminated in the Regional Finals, <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> is now the favorite in the Northeast region.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> won the Regional Championship by triumphing in Room 2 with 1035.12 final points, and is now the top-rated collegiate member.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> is a perfect 9-for-9 in submissions during the Collegiate Challenge.  In the Regional Quarterfinals, <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> won Room 8 by successfully coding all three problems and finishing with 1060.69 final points.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> had the highest score (1223.49) in the Regional Semifinals, en route to winning Room 6.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> was the long shot of the 16 semifinalists in the 2001 TopCoder Invitational, after beginning the tournament as the 92nd seed.  Can this former long shot complete an amazing ascension up the TopCoder rankings and win the Collegiate Challenge?
</P>
                 </TD>
            </TR>
            <!-- end fav -->  
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="ambrose"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Southeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="10%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="40%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;1</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2431</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;University of Central Florida</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" ALIGN="center" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Comments:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/ambrose_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> used four successful challenges in the Regional Finals to finish second in Room 3 and gain the 15th spot for the semifinals.  In the Regional Quarterfinals, <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> finished second in Room 18 with 710.50 final points, the 10th highest total in the region.  <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> easily won Room 9 in the Regional Semifinals with 773.90 final points.  The 2002 Collegiate Challenge is the second major tournament appearance for <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A>, who was a semifinalist in the 2001 TopCoder Invitational.  After a close call in the Regional Finals, can <A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A> rebound for a championship?
</P>
                 </TD>
            </TR>
            <!-- end fav -->   
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="DjinnKahn"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Midwest Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;1</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2588</TD>
              <TD VALIGN="middle" CLASS="statText" NOWRAP="0">&#160;University of Michigan-Ann Arbor</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" ALIGN="center" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Comments:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/DjinnKahn_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> cruised to the Midwest region championship by winning Room 1 with 1032.29 final points.  In the Regional Quarterfinals, <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> finished second in Room 4 with 1046.55 final points, the fifth highest total in the region.  <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> had the fifth highest point total in the Regional Semifinals (938.69), en route to easily winning Room 1.  <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A> has had a perfect Collegiate Challenge so far, going 9-for-9 in submissions and 1-for-1 in challenges.  This is the first major tournament for <A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A>.  Can this first time tournament participant continue to post high scores and make the semifinals and finals look so easy?
</P>
                 </TD>
            </TR>
            <!-- end fav -->  
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="dmwright"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;West Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;2</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2585</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Stanford University</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" ALIGN="center" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Comments:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/dmwright_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
Even though <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> finished third in Room 4 in the Regional Finals, <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> should still be considered the favorite in the West based on past tournament success.  <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> was a semifinalist in the 2001 TopCoder Collegiate Challenge and finished second overall in the 2001 TopCoder Invitational.  <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> has the most TopCoder experience, having competed in 65 of the 71 Single Round Matches, and has 43 <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=srm_wins" CLASS="statText">Overall Room Wins</A>, far and away the most of any member.  <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> finished third in Room 18 with 893.80 final points in the Regional Quarterfinals.  <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> followed that up by winning Room 14 in the Regional Semifinals with 794.29 final points.  Three of the top-25 <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=high_total_div1" CLASS="statText">Highest Point Totals</A> have been earned by <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A>, including the fourth highest (1814.93). <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> is ranked first in <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sub_acc" CLASS="statText">Submission Accuracy</A> (84.54%) and second in <A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=chall_success" CLASS="statText">Challenge Success</A> (83.56%).  Is <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> due for a championship? 
</P>
                 </TD>
            </TR>
            <!-- end fav --> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                                      
          </TABLE>
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">          
             <TR>
              <TD VALIGN="middle" COLSPAN="7" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Favorites Comparison</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Region</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Overall Room Wins</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;SRM Submission Accuracy</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;SRM Challenge Success</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Overall TCCC Submission Accuracy</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Overall TCCC Challenge Success</TD>              
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Northeast</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;16</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;77.55% </TD>
              <TD VALIGN="middle" CLASS="statText">&#160;57.14%</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;100.00% (9-for-9)</TD> 
              <TD VALIGN="middle" CLASS="statText">&#160;33.33% (1-for-3)</TD>                            
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Southeast</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed">ambrose</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;21</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;81.98%</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;74.07%</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;62.50% (5-for-8)</TD> 
              <TD VALIGN="middle" CLASS="statText">&#160;83.33% (5-for-6)</TD>                              
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Midwest</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;11</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;66.67%</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;76.92%</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;100.00% (9-for-9)</TD> 
              <TD VALIGN="middle" CLASS="statText">&#160;100.00% (1-for-1)</TD>                             
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;West</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;43</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;84.54% </TD>
              <TD VALIGN="middle" CLASS="statText">&#160;83.56% </TD>
              <TD VALIGN="middle" CLASS="statText">&#160;66.67% (12-for-18)</TD> 
              <TD VALIGN="middle" CLASS="statText">&#160;100.00% (3-for-3)</TD>                             
            </TR>                                    
            <TR>
              <TD VALIGN="middle" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                                          
          </TABLE>          
          <P><br/></P>
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

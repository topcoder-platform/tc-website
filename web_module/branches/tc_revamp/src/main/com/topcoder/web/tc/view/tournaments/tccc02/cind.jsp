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
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;The Cinderellas</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
Every competition has them.  The 1980 "Miracle on Ice" US Men's Ice Hockey Team, Buster Douglas, Rocky Balboa, the New England Patriots, and most recently, Sarah Hughes.  They're what make tournaments fun, interesting and compelling. They also provide a ton of emotional drama.  It's the American way; everyone loves the underdog.  The 2001 TopCoder Invitational had one.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A>, this tournament's number two seed in the Northeast region, was ranked 92nd at the start of the Invitational, but ended up as one of the 16 finalists.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> parlayed his success in the Invitational into an impressive climb up the TopCoder rankings.  <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> is currently rated second overall, and is the top-rated collegiate member.  Although none of these coders are as far a long shot as <A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A> was in the Invitational, perhaps we will see one of them steer a similar path of future success:
                 </TD>
            </TR> 
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="Logan"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
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
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;9</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2186</TD>
              <TD VALIGN="middle" CLASS="statText" NOWRAP="0">&#160;Virginia Polytechnic Institute and State University</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why they could shock the world:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/Logan_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A> is the lowest ranked competitor from the Northeast still alive.  <A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A> finished second in Room 2 of the Regional Finals to gain the eighth spot in the semifinals.  In the Regional Quarterfinals, <A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A> earned 1024.77 final points and finished second to milhouse in Room 12.  <A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A> won Room 7 in the Regional Semifinals with 732.71 final points.  <A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A> is a TopCoder veteran, having competed in 61 of TopCoder's 71 Single Round Matches, and was one of the 16 semifinalists in the 2001 TopCoder Invitational.  <A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A> ranks ninth in Overall Room Wins with 15, has the 14th highest Division-I point total (1656.86), and is 23rd in Challenge Success (68.00%).  Is this consistent performer ready for a championship?
</P>
                 </TD>
            </TR>
            <!-- end fav --> 
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="evd"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
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
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;5</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2478</TD>
              <TD VALIGN="middle" CLASS="statText" NOWRAP="0">&#160;Stanford University</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why they could shock the world:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/evd_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A> earned the 10th spot in the semifinals by finishing in fourth place in Room 4 of the Regional Finals.  <A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A> won Room 21 in the Regional Quarterfinals with 1509.99 final points, which was the second highest total in the region.  In the Regional Semifinals, <A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A> finished second in Room 16 with 834.67 final points.  <A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A> advanced as far as the third round in the 2001 Invitational.  Can <A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A> become another TopCoder champion from Stanford?
</P>
                 </TD>
            </TR>
            <!-- end fav --> 
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="bigg_nate"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
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
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;6</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2542</TD>
              <TD VALIGN="middle" CLASS="statText" NOWRAP="0">&#160;California Institute of Technology</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why they could shock the world:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/bigg_nate_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A> has been one of the most impressive coders in the 2002 Collegiate Challenge, earning a top-10 point total in each of the first three rounds.  In the Regional Finals, <A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A> finished second in Room 4 with 1032.24 final points.  That point total was the fourth highest of the Regional Finals, and earned <A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A> the top wildcard spot in the semifinals. <A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A> won Room 22 in the Regional Quarterfinals with 1119.55 final points, the sixth highest point total in the region, and followed that up by triumphing in Room 15 in the Regional Semifinals with the eighth highest point total in the region, 868.50.  This is the first major tournament for <A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A>.  Can <A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A> continue to put up high point totals, and will they lead to a championship?
</P>
                 </TD>
            </TR>
            <!-- end fav -->                        
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="po"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;West Region</TD>
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
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;8</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2283</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;California Institute of Technology</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why they could shock the world:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/po_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
By finishing in sixth place of Room 4 with 427.01 final points during the Regional Finals, <A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A>
 gained the 14th spot in the semifinals.  <A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A>
 began the Collegiate Challenge by winning Room 24 in the Regional Quarterfinals with 1055.60 final points, and followed that up with a second place finish (931.86 final points) in Room 13 of the Regional Semifinals.  <A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A>
 participated in the 2001 Invitational, but was eliminated in the first round.  Can <A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A>
 become Cal Tech's first TopCoder champion?
</P>
                 </TD>
            </TR>
            <!-- end fav -->   
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="derkuci"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
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
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;13</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2369</TD>
              <TD VALIGN="middle" CLASS="statText" NOWRAP="0">&#160;California Institute of Technology</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why they could shock the world:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/derkuci_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> earned the 11th spot in the semifinals by finishing fifth in Room 4 of the Regional Finals with 473.46 final points.  In the Regional Quarterfinals, <A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> earned 996.17 points and finished second in Room 21.  The most impressive performance by <A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> occurred in the Regional Semifinals, when <A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> won Room 16 with 1029.63 points, the fourth highest total in the region.  <A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> is a TopCoder up-and-comer, having increased his debut rating of 1405 by 964 points in just 15 events.  Can the continued improvement of <A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A> result in a championship?
</P>
                 </TD>
            </TR>
            <!-- end fav -->  
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="ante"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
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
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;16</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2047</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Stanford University</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why they could shock the world:</TD>
            </TR>                        
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/ante_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A>, the lowest overall seed still remaining, became the ultimate survivor and Cinderella story by gaining the 16th and final spot in the semifinals.  In the Regional Finals, <A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A> finished seventh in Room 4 with 424.30 final points.  <A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A> placed second in Room 18 of the Regional Quarterfinals with 948.26 final points, and second in Room 14 in the Regional Semifinals with 696.36 final points.  <A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A> was in the same room as tournament favorite <A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A> in both the Regional Quarterfinals and Semifinals, finishing just ahead in the Quarters and just behind in the Semis.  Can this long shot complete this improbable journey with a championship?
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
              <TD VALIGN="middle" COLSPAN="6" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Cinderella Comparison</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Region</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Regional Quarterfinal Point Total</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Regional Semifinal Point Total</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Regional Final Point Total</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Average Point Total</TD>              
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Northeast</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow">Logan</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1024.77</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;732.71</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;491.24</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;749.57</TD>              
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;West</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed">evd</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1509.99</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;834.67</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;477.53</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;940.73</TD>              
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1119.55</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;868.50</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1032.24</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1006.76</TD>              
            </TR>                         
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed">po</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1055.60</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;931.86</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;427.01</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;804.82</TD>              
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;996.17</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1029.63</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;473.46</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;833.09</TD>              
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;948.26</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;696.36</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;424.30</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;689.64</TD>              
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

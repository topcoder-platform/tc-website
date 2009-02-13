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

<jsp:include page="links.jsp" />

<BR CLEAR="all"/>         
          
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">   
  <TR>
    <TD VALIGN="top" align="center"><!-- <DIV><IMG SRC="/i/semifinals_rooms.gif" ALT="" WIDTH="300" HEIGHT="36" BORDER="0"/>
    </DIV> --><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/semi02_rooms.gif" ALT="" WIDTH="507" HEIGHT="312" BORDER="0" USEMAP="#semi02_rooms_Map" VSPACE="5"/></A></TD>
    <!-- <TD VALIGN="top" COLSPAN="2" ALIGN="left" BGCOLOR="#FFFFFF"></TD> -->
  </TR> 
</TABLE>
<MAP NAME="semi02_rooms_Map">
<AREA SHAPE="rect" ALT="" COORDS="392,262,498,282" HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,235,498,256" HREF="/tc?module=MemberProfile&cr=252076" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="393,208,498,228" HREF="/tc?module=MemberProfile&cr=142795" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,181,498,201" HREF="/tc?module=MemberProfile&cr=153902" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="391,108,499,126" HREF="/tc?module=MemberProfile&cr=112902" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,81,499,102" HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,52,498,75" HREF="/tc?module=MemberProfile&cr=111202" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,27,500,46" HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="10,261,116,282" HREF="/tc?module=MemberProfile&cr=113178" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,235,116,257" HREF="/tc?module=MemberProfile&cr=154089" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,208,117,229" HREF="/tc?module=MemberProfile&cr=120816" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,182,117,201" HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,107,116,128" HREF="/tc?module=MemberProfile&cr=112939" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="9,80,115,101" HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,53,117,74" HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,25,117,48" HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed"/>
</MAP>

<!-- Semifinal breakdown by regions --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">   
  <TR>
    <TD VALIGN="top" align="center"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/sunsemi1_sm.gif" ALT="" WIDTH="267" HEIGHT="161" BORDER="0" VSPACE="5"/><IMG SRC="/i/sunsemi2_sm.gif" ALT="" WIDTH="217" HEIGHT="161" BORDER="0" VSPACE="5"/></A></TD>
    <!-- <TD VALIGN="top" COLSPAN="2" ALIGN="left" BGCOLOR="#FFFFFF"></TD> -->
  </TR> 
</TABLE>


<!-- Favs, Cinder, Who to Watch --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">  
  <TR>  
    <TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="6" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="9" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="6" BORDER="0"/></TD>    
  </TR>   
  <TR>  
    <TD VALIGN="top" WIDTH="33%" ALIGN="left" CLASS="statText"><DIV><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs"><IMG SRC="/i/tourny_badge_favs.gif" ALT="" WIDTH="150" HEIGHT="41" BORDER="0" VSPACE="4"/></A></DIV>
    <IMG SRC="/i/m/dmwright_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="8" VSPACE="1" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextRed">dmwright</A><BR/>
The big cheese.  The head honcho.  The top gun.  The dictionary defines a favorite as "a competitor judged most likely to win".  And win is exactly what the favorites have done so far in their TopCoder careers, as all of the favorites are among the top-25 in all-time room wins.  Let's take a deeper look at the four coders who have earned the distinction as favorites...<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=favs" CLASS="statText">full&#160;story</A>
</TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="1" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="33%"  ALIGN="left" CLASS="statText"><DIV><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind"><IMG SRC="/i/tourny_badge_cind.gif" ALT="" WIDTH="150" HEIGHT="41" BORDER="0" VSPACE="4"/></A></DIV>
    <IMG SRC="/i/m/ante_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="8" VSPACE="1" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=264869" CLASS="coderTextYellow">ante</A><BR/>
Every competition has them.  The 1980 "Miracle on Ice" US Mens Ice Hockey Team, Buster Douglas, Rocky Balboa, the New England Patriots, and most recently Sarah Hughes.  They're what make tournaments fun, interesting and compelling. They also provide a ton of emotional drama.  It's the American way; everyone loves the underdog...<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=cind" CLASS="statText">full&#160;story</A>
</TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="1" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="33%" ALIGN="left" CLASS="statText"><DIV><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon"><IMG SRC="/i/tourny_badge_eyeon.gif" ALT="" WIDTH="150" HEIGHT="41" BORDER="0" VSPACE="4"/></A></DIV>
    <IMG SRC="/i/m/milhouse_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="8" VSPACE="1" ALIGN="left"/>
<A HREF="/tc?module=MemberProfile&cr=154089" CLASS="coderTextRed">milhouse</A><BR/>    
These are the coders that the top-seeds fear the most.  They are either TopCoder veterans, TopCoder tournament tested, those who had outstanding performances with top scores in the Regional Quarterfinals and/or Regional Semifinals, or all of the above...<A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=eyeon" CLASS="statText">full&#160;story</A></TD>   
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="15" BORDER="0"/></TD>    
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

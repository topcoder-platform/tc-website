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


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <jsp:include page="links.jsp" />

  <BR/><BR/>
  <CENTER><P CLASS="statText">Tournament Advancement Board. <A HREF="/index?t=schedule&c=tourney_advancers&rds=4355" CLASS="statText">Back to Advancers</A></P></CENTER>
 <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" ALIGN="center">
    <TR>
        <TD VALIGN="top"><IMG SRC="/i/tournament/invit02/invit02_rooms.gif" WIDTH="507" HEIGHT="312" USEMAP="#invit02_rooms" BORDER="0"/></TD>
    </TR>
   </TABLE>
<MAP NAME="invit02_rooms">
<AREA SHAPE="rect" ALT="" COORDS="392,262,498,282" HREF="/tc?module=MemberProfile&cr=287266" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,235,498,256" HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="393,208,498,228" HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,181,498,201" HREF="/tc?module=MemberProfile&cr=270505" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="391,108,499,126" HREF="/tc?module=MemberProfile&cr=287105" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,81,499,102" HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,52,498,75" HREF="/tc?module=MemberProfile&cr=114853" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,27,500,46" HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="10,261,116,282" HREF="/tc?module=MemberProfile&cr=264949" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,235,116,257" HREF="/tc?module=MemberProfile&cr=157972" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,208,117,229" HREF="/tc?module=MemberProfile&cr=277659" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,182,117,201" HREF="/tc?module=MemberProfile&cr=152073" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,107,116,128" HREF="/tc?module=MemberProfile&cr=152342" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="9,80,115,101" HREF="/tc?module=MemberProfile&cr=153505" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,53,117,74" HREF="/tc?module=MemberProfile&cr=120816" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,25,117,48" HREF="/tc?module=MemberProfile&cr=272072" CLASS="coderTextRed"/>
</MAP>   
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

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
<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<jsp:include page="links.jsp" />
<BR/><BR/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                    <TR>
                      <TD COLSPAN="2" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Regional Championship Seeding</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne32" CLASS="statTextBig">View Semifinal Seeding</A><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne128" CLASS="statTextBig">View Quarter-Final Seeding</A></TD>
                    </TR>
<TR>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Northeast</TD>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statTextBig">Southeast</A></TD>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w" CLASS="statTextBig">West</A></TD>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw" CLASS="statTextBig">Midwest</A></TD>
</TR>
                    </TABLE>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" ALIGN="center">
<TR>
<TD WIDTH="60%" ALIGN="left" VALIGN="middle" HEIGHT="18" CLASS="statText" BGCOLOR="#000000">School</TD>
<TD WIDTH="20%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Member</TD>
<TD WIDTH="10%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Seed</TD>
<TD WIDTH="10%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Rating</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=147102" CLASS="coderTextRed">pl31415</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2609</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Oberlin College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2701</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260835" CLASS="coderTextRed">reid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2643</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=154089" CLASS="coderTextRed">milhouse</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2354</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=112902" CLASS="coderTextYellow">Logan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2120</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251457" CLASS="coderTextYellow">etolson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2131</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159052" CLASS="coderTextYellow">lbackstrom</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2125</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263580" CLASS="coderTextYellow">enderx</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1814</TD>
</TR>
</TABLE><BR/>
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                        <TR><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<A HREF="#top" CLASS="statText">Back to top</A></TD></TR>
                    </TABLE>
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

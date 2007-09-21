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


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                    <TR>
                      <TD COLSPAN="5" ALIGN="center"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=sched"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>
<TR>
<TD CLASS="statText" COLSPAN="5">Here is a view of the Top-10 room winners (All Regions) in the Regional Semifinals of the 2002 Sun & TopCoder Collegiate Challenge.</TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR BGCOLOR="#000033" BACKGROUND="/i/steel_bluebv_bg.gif">
<TD WIDTH="48" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="18"><IMG HEIGHT="1" WIDTH="48" SRC="/i/clear.gif"/></TD>
<TD WIDTH="40%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">Handle</TD>
<TD WIDTH="20%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="right" WIDTH="40%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statText">&#160;Final Points</TD>
<TD WIDTH="10" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 6</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=260835" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">1223.49</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 13</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=114443" CLASS="coderTextRed">jonmac</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=147102" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">1107.87</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 10</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=262936" CLASS="coderTextRed">dgarthur</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=133846" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">1039.49</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 16</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=262935" CLASS="coderTextRed">derkuci</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=252281" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">1029.63</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 1</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=155275" CLASS="coderTextRed">DjinnKahn</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=146723" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">938.69</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 2</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=142795" CLASS="coderTextRed">Joe</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=154089" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">935.55</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 8</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=260835" CLASS="coderTextRed">reid</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=156768" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">925.52</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 15</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=157974" CLASS="coderTextRed">bigg_nate</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=153479" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">918.50</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 5</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=147102" CLASS="coderTextRed">pl31415</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=159052" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">847.55</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="statText"><b>&#160;Room 12</b></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
</TR>
<TR>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
<TD align="left" CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=157628" CLASS="coderTextYellow">ShakeSpace</A></TD>
<TD VALIGN="middle" CLASS="statText">&#160;<!-- <A HREF="/stat?c=coder_room_stats&rd=60&cr=158837" CLASS="statText">View Code</A> --></TD>
<TD ALIGN="right" CLASS="statText">809.80</TD>
<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="10" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
</TR>
</TABLE>  
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

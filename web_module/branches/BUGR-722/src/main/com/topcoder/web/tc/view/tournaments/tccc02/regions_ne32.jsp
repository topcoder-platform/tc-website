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
                      <TD COLSPAN="2" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Regional Semifinal Seeding</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne" CLASS="statTextBig">View Championship Seeding</A><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne128" CLASS="statTextBig">View Quarter-Final Seeding</A></TD>
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
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=147102" CLASS="coderTextRed">pl31415</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2663</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Oberlin College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2541</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rutgers University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156592" CLASS="coderTextRed">benetin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2363</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260835" CLASS="coderTextRed">reid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2489</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=154089" CLASS="coderTextRed">milhouse</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2309</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=112902" CLASS="coderTextYellow">Logan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2178</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251457" CLASS="coderTextYellow">etolson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2107</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=133846" CLASS="coderTextRed">stanf</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">11</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2216</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159052" CLASS="coderTextYellow">lbackstrom</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2103</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265031" CLASS="coderTextYellow">Gyrefalcon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">16</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1951</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=154135" CLASS="coderTextYellow">tck</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">19</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1953</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156603" CLASS="coderTextYellow">LinkII</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">20</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1880</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157972" CLASS="coderTextYellow">obfuscator</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">21</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1919</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Pennsylvania State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156768" CLASS="coderTextYellow">Nok</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">22</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1938</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Case Western Reserve University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265736" CLASS="coderTextYellow">Ken Alverson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">24</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1827</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">New York University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=252281" CLASS="coderTextYellow">turian</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">26</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1915</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Northeastern University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158137" CLASS="coderTextYellow">olted</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">28</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1777</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263580" CLASS="coderTextYellow">enderx</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1771</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264961" CLASS="coderTextYellow">henchq</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">32</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1752</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=128971" CLASS="coderTextYellow">seanmac02</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">37</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1631</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">College of William and Mary</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156990" CLASS="coderTextYellow">lanenal</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">41</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1651</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=153479" CLASS="coderTextYellow">petch</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">43</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1702</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Connecticut</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=113433" CLASS="coderTextYellow">ConleyVI</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">47</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1596</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158837" CLASS="coderTextYellow">axch</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">48</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1671</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Brown University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260572" CLASS="coderTextYellow">jcl</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">53</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1622</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=150796" CLASS="coderTextYellow">paisa</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">58</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1617</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264949" CLASS="coderTextYellow">moira</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">60</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1584</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Boston University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=139153" CLASS="coderTextYellow">johnm4</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">62</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1552</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=138158" CLASS="coderTextYellow">leelin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">63</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1540</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rensselaer Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=141330" CLASS="coderTextBlue">mSWAE</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">86</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1403</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Pace University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=146723" CLASS="coderTextBlue">Demolisher</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">101</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1435</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Case Western Reserve University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156804" CLASS="coderTextBlue">Zaen</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">125</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1306</TD>
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

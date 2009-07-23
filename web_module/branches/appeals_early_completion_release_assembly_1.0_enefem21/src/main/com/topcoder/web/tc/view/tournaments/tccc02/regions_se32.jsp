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
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statTextBig">View Championship Seeding</A><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se128" CLASS="statTextBig">View Quarter-Final Seeding</A></TD>
                    </TR>
<TR>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne" CLASS="statTextBig">Northeast</A></TD>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Southeast</TD>
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
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=153505" CLASS="coderTextRed">ambrose</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2438</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262936" CLASS="coderTextRed">dgarthur</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2449</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=135178" CLASS="coderTextYellow">Firewind</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1812</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156848" CLASS="coderTextYellow">TPcoder</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1670</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157628" CLASS="coderTextYellow">ShakeSpace</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1666</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265334" CLASS="coderTextYellow">levantri</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">7</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1669</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111202" CLASS="coderTextYellow">ColinMacLeod</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">8</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1661</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261705" CLASS="coderTextYellow">Fizgig</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1564</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111057" CLASS="coderTextYellow">bm999</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">11</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1629</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251989" CLASS="coderTextYellow">AdamSelene</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">12</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1531</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264079" CLASS="coderTextBlue">unformed</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1360</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111435" CLASS="coderTextBlue">overflow</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">14</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1352</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Vanderbilt University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264031" CLASS="coderTextBlue">huazai</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">16</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1357</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262265" CLASS="coderTextBlue">Lacker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">17</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1371</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157483" CLASS="coderTextBlue">drnull</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">19</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1300</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=138655" CLASS="coderTextBlue">jap4524</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">24</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1277</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111365" CLASS="coderTextBlue">huntergt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">28</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1298</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=267260" CLASS="coderTextBlue">arpit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1232</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266091" CLASS="coderTextBlue">Escorpius</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">32</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1377</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">East Tennessee State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=113176" CLASS="coderTextGreen">Holgrave</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">38</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1120</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Northern Kentucky University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152610" CLASS="coderTextGreen">puzzlehacker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">40</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1135</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159995" CLASS="coderTextGreen">tommyv</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">41</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1162</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261068" CLASS="coderTextGreen">BigBen79</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">48</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1125</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160049" CLASS="coderTextGreen">FogleBird</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">50</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1064</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Agricultural & Mechanical University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264205" CLASS="coderTextGreen">aybee77</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">51</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1041</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260752" CLASS="coderTextGreen">TubaDave</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">64</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1035</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264959" CLASS="coderTextGreen">xviper</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">65</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1032</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251541" CLASS="coderTextGreen">AdamMB</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">72</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">996</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of North Carolina Chapel Hill</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=155276" CLASS="coderTextGreen">FragLegs</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">78</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1048</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=155740" CLASS="coderTextGreen">wino</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">84</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">951</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262602" CLASS="coderTextGreen">infrared</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">89</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">952</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251289" CLASS="coderTextGreen">EtherMage</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">99</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1090</TD>
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

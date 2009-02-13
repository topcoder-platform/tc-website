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
                      <TD COLSPAN="2" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Regional Quarter-Final Seeding</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statTextBig">View Championship Seeding</A><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statTextBig">View Semifinal Seeding</A></TD>
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
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2544</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262936" CLASS="coderTextRed">dgarthur</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2305</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111302" CLASS="coderTextYellow">dminn</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">3</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2042</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=135178" CLASS="coderTextYellow">Firewind</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1788</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156848" CLASS="coderTextYellow">TPcoder</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1715</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157628" CLASS="coderTextYellow">ShakeSpace</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1667</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265334" CLASS="coderTextYellow">levantri</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">7</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1613</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111202" CLASS="coderTextYellow">ColinMacLeod</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">8</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1593</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158306" CLASS="coderTextYellow">SlayerK</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1557</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261705" CLASS="coderTextYellow">Fizgig</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1542</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111057" CLASS="coderTextBlue">bm999</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">11</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1454</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251989" CLASS="coderTextBlue">AdamSelene</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">12</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1429</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264079" CLASS="coderTextBlue">unformed</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1428</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111435" CLASS="coderTextBlue">overflow</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">14</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1377</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157016" CLASS="coderTextBlue">richter</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">15</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1365</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Vanderbilt University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264031" CLASS="coderTextBlue">huazai</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">16</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1350</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262265" CLASS="coderTextBlue">Lacker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">17</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1337</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Atlantic University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264678" CLASS="coderTextBlue">mza</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">18</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1330</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157483" CLASS="coderTextBlue">drnull</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">19</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1322</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156485" CLASS="coderTextBlue">Smiley=)</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">20</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1305</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260404" CLASS="coderTextBlue">wernsing</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">21</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1302</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Southern Polytechnic State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=110079" CLASS="coderTextBlue">tyrithe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">22</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1299</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158452" CLASS="coderTextBlue">[UCF]Pawn</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">23</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1299</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=138655" CLASS="coderTextBlue">jap4524</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">24</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1245</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Atlantic University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265450" CLASS="coderTextBlue">dai2050</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">25</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1227</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Full Sail Real World Education</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263143" CLASS="coderTextBlue">Splat</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">26</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1226</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Auburn University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266080" CLASS="coderTextBlue">Robem</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">27</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1211</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111365" CLASS="coderTextBlue">huntergt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">28</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1207</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262033" CLASS="coderTextBlue">somaniram</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">29</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1202</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=267260" CLASS="coderTextBlue">arpit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1202</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251146" CLASS="coderTextGreen">zeromus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">31</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1196</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266091" CLASS="coderTextGreen">Escorpius</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">32</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1193</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262090" CLASS="coderTextGreen">eljobe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">33</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1164</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263621" CLASS="coderTextGreen">jmcpher</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">34</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1146</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Atlantic University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261291" CLASS="coderTextGreen">kgao</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">35</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1142</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266087" CLASS="coderTextGreen">athomas</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">36</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1122</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of North Carolina Chapel Hill</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266761" CLASS="coderTextGreen">Isaacbeast</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">37</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1103</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">East Tennessee State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=113176" CLASS="coderTextGreen">Holgrave</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">38</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1094</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157808" CLASS="coderTextGreen">jitspoe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">39</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1065</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Northern Kentucky University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152610" CLASS="coderTextGreen">puzzlehacker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">40</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1062</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159995" CLASS="coderTextGreen">tommyv</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">41</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1048</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Middle Tennessee State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251391" CLASS="coderTextGreen">GOETHE</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">42</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1030</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160039" CLASS="coderTextGreen">deads</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">43</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1027</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265221" CLASS="coderTextGreen">DaddyE</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">44</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1018</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Vanderbilt University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264728" CLASS="coderTextGreen">Liguo</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">45</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1012</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264745" CLASS="coderTextGreen">nleseul</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">46</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1009</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Kennesaw State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156329" CLASS="coderTextGreen">LlamaDolittle</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">47</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1005</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261068" CLASS="coderTextGreen">BigBen79</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">48</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1000</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261233" CLASS="coderTextGreen">CaseWorker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">49</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">998</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160049" CLASS="coderTextGreen">FogleBird</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">50</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">987</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Agricultural & Mechanical University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264205" CLASS="coderTextGreen">aybee77</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">51</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">986</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262467" CLASS="coderTextGreen">billyf19</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">52</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">969</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160013" CLASS="coderTextGreen">fkthomps</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">53</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Mississippi State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264972" CLASS="coderTextGreen">SpaceCracker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">54</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=153732" CLASS="coderTextGreen">cgb8176</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">55</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264180" CLASS="coderTextGreen">collegenate</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">56</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">East Carolina University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=267134" CLASS="coderTextGreen">ecupirates</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">57</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Barry University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263999" CLASS="coderTextGreen">mdcg</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">58</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of South Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266485" CLASS="coderTextGreen">meragrin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">59</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Mississippi State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263068" CLASS="coderTextGreen">msubulldog</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">60</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of North Carolina Chapel Hill</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160099" CLASS="coderTextGreen">bdwest</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">61</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">966</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Wake Forest University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264622" CLASS="coderTextGreen">Kmeleon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">62</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">963</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264748" CLASS="coderTextGreen">cclark</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">63</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">963</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260752" CLASS="coderTextGreen">TubaDave</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">64</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">955</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264959" CLASS="coderTextGreen">xviper</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">65</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">952</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Tennessee Chattanooga</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263162" CLASS="coderTextGreen">JavaGrinder</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">66</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">952</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159758" CLASS="coderTextGreen">[ucf]entity</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">67</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">947</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158268" CLASS="coderTextGreen">tikimon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">68</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">943</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of South Carolina Columbia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266766" CLASS="coderTextGreen">[-Bluewolf-]</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">69</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">943</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265997" CLASS="coderTextGreen">typhatix</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">70</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">943</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159798" CLASS="coderTextGreen">godman</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">71</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">936</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Alabama Tuscaloosa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251541" CLASS="coderTextGreen">AdamMB</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">72</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">928</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Valencia Community College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159932" CLASS="coderTextGreen">Tommstein</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">73</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">926</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159639" CLASS="coderTextGreen">tigersolaris</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">74</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">916</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of North Carolina Charlotte</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262115" CLASS="coderTextGreen">kuttam</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">75</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">907</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265447" CLASS="coderTextGreen">s_navdeep</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">76</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">904</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=112285" CLASS="coderTextGray">buddhad</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">77</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">892</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of North Carolina Chapel Hill</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=155276" CLASS="coderTextGray">FragLegs</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">78</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">879</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156906" CLASS="coderTextGray">kinnukpk</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">79</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">865</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=113617" CLASS="coderTextGray">codemonkey</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">80</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">864</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=151650" CLASS="coderTextGray">JKiller</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">81</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">853</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=136163" CLASS="coderTextGray">Enki</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">82</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">844</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida Atlantic University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160120" CLASS="coderTextGray">Amit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">83</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">841</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=155740" CLASS="coderTextGray">wino</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">84</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">840</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157465" CLASS="coderTextGray">rockfreak</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">85</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">835</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262961" CLASS="coderTextGray">aerosoul</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">86</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">818</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=133670" CLASS="coderTextGray">inthepit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">87</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">804</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265421" CLASS="coderTextGray">kaoruAngel</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">88</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">804</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262602" CLASS="coderTextGray">infrared</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">89</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">795</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=115130" CLASS="coderTextGray">stoneruls</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">90</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">792</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260521" CLASS="coderTextGray">Murcielago</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">91</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">787</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263802" CLASS="coderTextGray">DHAvatar</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">92</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">771</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263207" CLASS="coderTextGray">CephasL</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">93</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">768</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Mercer University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159064" CLASS="coderTextGray">311Bud</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">94</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">748</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262486" CLASS="coderTextGray">ziploc1010</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">95</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">742</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida International University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261822" CLASS="coderTextGray">bodrius</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">96</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">739</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160329" CLASS="coderTextGray">arobinator</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">97</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">727</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152593" CLASS="coderTextGray">Alapapa</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">98</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">692</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251289" CLASS="coderTextGray">EtherMage</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">99</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">690</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=155619" CLASS="coderTextGray">roop</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">100</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">679</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Valdosta State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262456" CLASS="coderTextGray">Shadowfax</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">101</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">657</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156822" CLASS="coderTextGray">m_chen</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">102</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">657</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">North Carolina State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262272" CLASS="coderTextGray">rb79</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">103</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">633</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Northern Kentucky University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266008" CLASS="coderTextGray">Boxcar</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">104</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">622</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of South Carolina Columbia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266011" CLASS="coderTextGray">emokpae1</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">105</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">622</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of North Carolina Charlotte</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251243" CLASS="coderTextGray">PianoWow</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">106</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">606</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262254" CLASS="coderTextGray">Mikaus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">107</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">580</TD>
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

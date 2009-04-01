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
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w" CLASS="statTextBig">View Championship Seeding</A><BR/><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w32" CLASS="statTextBig">View Semifinal Seeding</A></TD>
                    </TR>
<TR>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne" CLASS="statTextBig">Northeast</A></TD>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statTextBig">Southeast</A></TD>
<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">West</TD>
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
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=114443" CLASS="coderTextRed">jonmac</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2764</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=114853" CLASS="coderTextRed">dmwright</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2683</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=129672" CLASS="coderTextRed">doeth</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">3</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2634</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Berkeley</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=120816" CLASS="coderTextRed">malpt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2590</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=153902" CLASS="coderTextRed">evd</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2314</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157974" CLASS="coderTextRed">bigg_nate</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2203</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158333" CLASS="coderTextYellow">dvickrey</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">7</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2124</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=113178" CLASS="coderTextYellow">po</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">8</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2110</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160378" CLASS="coderTextYellow">pieffe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2085</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=108262" CLASS="coderTextYellow">mathgodleo</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2034</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262902" CLASS="coderTextYellow">ZandMaster</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">11</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1896</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Utah</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251276" CLASS="coderTextYellow">duongsaa</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">12</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1894</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262935" CLASS="coderTextYellow">derkuci</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1881</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159594" CLASS="coderTextYellow">Koroibos</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">14</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1788</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Berkeley</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156445" CLASS="coderTextYellow">eventually</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">15</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1683</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264869" CLASS="coderTextYellow">ante</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">16</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1680</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Cruz</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251042" CLASS="coderTextYellow">cakoose</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">17</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1648</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=107835" CLASS="coderTextYellow">sjelkjd</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">18</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1631</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California State University Chico</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265047" CLASS="coderTextYellow">H2Odysee</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">19</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1597</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Eastern Washington University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156859" CLASS="coderTextYellow">ivern</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">20</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1582</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264682" CLASS="coderTextYellow">nave</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">21</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1566</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251109" CLASS="coderTextYellow">valeria</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">22</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1528</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264782" CLASS="coderTextYellow">sliu</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">23</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1523</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Southern California</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158258" CLASS="coderTextYellow">jerm</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">24</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1522</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Cruz</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266021" CLASS="coderTextYellow">GGB</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">25</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1515</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Riverside</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159605" CLASS="coderTextYellow">donghui</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">26</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1504</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265045" CLASS="coderTextBlue">vladim</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">27</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1484</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157638" CLASS="coderTextBlue">Porgery</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">28</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1459</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas A&M University College Station</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260142" CLASS="coderTextBlue">dharding</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">29</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1433</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156478" CLASS="coderTextBlue">jazzer4000</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1433</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Alaska Fairbanks</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152499" CLASS="coderTextBlue">Tammuz</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">31</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1406</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266215" CLASS="coderTextBlue">ashot</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">32</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1387</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Washington</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=143456" CLASS="coderTextBlue">khaladan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">33</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1385</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Trinity University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=111487" CLASS="coderTextBlue">tbanksto</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">34</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1378</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=132948" CLASS="coderTextBlue">sdyoung</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">35</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1359</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Berkeley</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159178" CLASS="coderTextBlue">brainscience69</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">36</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1344</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Pasadena City College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266319" CLASS="coderTextBlue">androm</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">37</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1342</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=129063" CLASS="coderTextBlue">mktong</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">38</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1337</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Houston Main Campus</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265558" CLASS="coderTextBlue">LehooZeher</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">39</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1309</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159838" CLASS="coderTextBlue">gaul</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">40</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1307</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Utah</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156824" CLASS="coderTextBlue">addaon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">41</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1307</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Southern California</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157418" CLASS="coderTextBlue">jlstair</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">42</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1291</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of North Texas</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266440" CLASS="coderTextBlue">ramprasad_a</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">43</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1286</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas Tech University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158433" CLASS="coderTextBlue">Godot</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">44</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1282</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152383" CLASS="coderTextBlue">ice9</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">45</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1262</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of North Texas</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=106771" CLASS="coderTextBlue">eattrig</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">46</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1261</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Riverside</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160126" CLASS="coderTextBlue">villarre</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">47</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1256</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=142797" CLASS="coderTextBlue">art2k</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">48</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1256</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156454" CLASS="coderTextBlue">odilatinam</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">49</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1254</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260492" CLASS="coderTextBlue">jcarlson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">50</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1237</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Digipen Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261501" CLASS="coderTextBlue">Screndib</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">51</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1234</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Portland State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264462" CLASS="coderTextBlue">shengbo2k</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">52</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1226</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263840" CLASS="coderTextBlue">bluejay</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">53</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1225</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266714" CLASS="coderTextBlue">bearkat100</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">54</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1215</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158450" CLASS="coderTextBlue">sid6581</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">55</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1211</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Washington</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=156495" CLASS="coderTextBlue">valthon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">56</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1207</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159168" CLASS="coderTextBlue">Virtual</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">57</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1204</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262957" CLASS="coderTextBlue">matrix0040</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">58</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1203</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264781" CLASS="coderTextGreen">Mackin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">59</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1195</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas Tech University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=154517" CLASS="coderTextGreen">gaw</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">60</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1187</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Southern California</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160129" CLASS="coderTextGreen">blaster</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">61</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1178</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Barbara</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158788" CLASS="coderTextGreen">johnny</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">62</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1168</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Riverside</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266351" CLASS="coderTextGreen">gstitt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">63</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1135</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262762" CLASS="coderTextGreen">bcp</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">64</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1134</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California State University Chico</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265817" CLASS="coderTextGreen">ChickenHelper</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">65</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1116</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Oregon State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=154882" CLASS="coderTextGreen">newellm</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">66</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1113</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Colorado Boulder</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251162" CLASS="coderTextGreen">SamBob</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">67</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1112</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas A&M University College Station</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265010" CLASS="coderTextGreen">BubbaJo</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">68</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1109</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157165" CLASS="coderTextGreen">tinter</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">69</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1101</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Berkeley</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=266018" CLASS="coderTextGreen">bluesky5</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">70</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1100</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Eastern Washington University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152617" CLASS="coderTextGreen">flip_da_bits</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">71</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1097</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California San Diego</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=108078" CLASS="coderTextGreen">Phantom Coder</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">72</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1094</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Pacific Lutheran University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158082" CLASS="coderTextGreen">rowenc</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">73</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1091</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Riverside</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159553" CLASS="coderTextGreen">pomah</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">74</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1087</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157900" CLASS="coderTextGreen">mthreat</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">75</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1084</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">New Mexico State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159055" CLASS="coderTextGreen">abacus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">76</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1079</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California San Diego</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=108594" CLASS="coderTextGreen">freshStart</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">77</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1076</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=113204" CLASS="coderTextGreen">wickamos</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">78</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1069</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159825" CLASS="coderTextGreen">redblue</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">79</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1064</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Eastern Washington University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159466" CLASS="coderTextGreen">moshecristel</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">80</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1062</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262951" CLASS="coderTextGreen">db</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">81</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1056</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas A&M University College Station</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=157896" CLASS="coderTextGreen">nerd2004</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">82</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1054</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Brigham Young University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263196" CLASS="coderTextGreen">rsklingler</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">83</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1040</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Southern Colorado</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=107041" CLASS="coderTextGreen">zonebit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">84</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1040</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=160359" CLASS="coderTextGreen">juntao</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">85</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1034</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Davis</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251410" CLASS="coderTextGreen">Sigrid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">86</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1033</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Eastern New Mexico University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=108287" CLASS="coderTextGreen">ergundee</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">87</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1032</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California San Diego</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=108273" CLASS="coderTextGreen">paradox</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">88</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1032</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Trinity University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262078" CLASS="coderTextGreen">sweetshooter</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">89</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1007</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Barbara</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=252114" CLASS="coderTextGreen">Levendis</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">90</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1000</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=260302" CLASS="coderTextGreen">EnderJon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">91</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">997</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California San Diego</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159904" CLASS="coderTextGreen">jgrau</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">92</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">997</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251799" CLASS="coderTextGreen">mikeburek</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">93</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">997</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas A&M University College Station</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262927" CLASS="coderTextGreen">tmt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">94</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">995</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Cruz</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158852" CLASS="coderTextGreen">lothar314</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">95</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">994</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251086" CLASS="coderTextGreen">elint</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">96</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">993</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=155737" CLASS="coderTextGreen">forgothowtocode</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">97</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">985</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=159495" CLASS="coderTextGreen">DrewHudson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">98</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">968</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Berkeley</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265220" CLASS="coderTextGreen">Tonster</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">99</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Cruz</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=267081" CLASS="coderTextGreen">UCPHBoy1</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">100</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Colorado State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264181" CLASS="coderTextGreen">atulg</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">101</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Southern Colorado</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265451" CLASS="coderTextGreen">big_papa_79</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">102</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251431" CLASS="coderTextGreen">gguion</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">103</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">San Jose State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=262939" CLASS="coderTextGreen">rafcrash</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">104</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">California Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263202" CLASS="coderTextGreen">shang</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">105</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">967</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158644" CLASS="coderTextGreen">Ace</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">106</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">964</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Barbara</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158631" CLASS="coderTextGreen">cyrus10101</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">107</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">964</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Colorado State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264174" CLASS="coderTextGreen">vipin2</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">108</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">953</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Arlington</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265034" CLASS="coderTextGreen">paragmhashilkar</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">109</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">951</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of North Texas</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263684" CLASS="coderTextGreen">itsrajendra</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">110</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">943</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of San Diego</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265380" CLASS="coderTextGreen">theDude</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">111</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">943</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Barbara</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158609" CLASS="coderTextGreen">anshulkothari</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">112</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">934</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=114309" CLASS="coderTextGreen">antialias</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">113</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">928</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Los Angeles</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251130" CLASS="coderTextGreen">wyatt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">114</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">924</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Austin</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=265024" CLASS="coderTextGreen">danb</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">115</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">922</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Utah</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264176" CLASS="coderTextGreen">ithil</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">116</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">917</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Berkeley</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158851" CLASS="coderTextGreen">nemo_d</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">117</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">914</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264920" CLASS="coderTextGreen">sam_khavari</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">118</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">904</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Stanford University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=251986" CLASS="coderTextGreen">billj</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">119</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">901</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Boise State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=261922" CLASS="coderTextGray">cd21</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">120</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">876</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of North Texas</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=152938" CLASS="coderTextGray">amadeus082</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">121</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">846</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Texas Arlington</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264199" CLASS="coderTextGray">kamaljeetmaini</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">122</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">842</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas A&M University College Station</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=146864" CLASS="coderTextGray">ned</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">123</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">825</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Southern Colorado</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263780" CLASS="coderTextGray">actarus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">124</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">824</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">San Jose State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=263103" CLASS="coderTextGray">groman</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">125</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">824</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Santa Cruz</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=158769" CLASS="coderTextGray">gwong</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">126</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">822</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of California Riverside</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264169" CLASS="coderTextGray">Ninjak</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">127</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">822</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Texas Tech University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&c=member_profile&cr=264099" CLASS="coderTextGray">summaD</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">128</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">818</TD>
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

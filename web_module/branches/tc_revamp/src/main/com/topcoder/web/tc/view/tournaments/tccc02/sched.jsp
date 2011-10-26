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
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR>
<TD COLSPAN="5" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Schedule</TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR> 
<TR>
<TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
&#160;&#160;Regional Quarter-Finals<BR/>
</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne128" CLASS="statTextBig">Seed Update</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se128" CLASS="statTextBig">Seed Update</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w128" CLASS="statTextBig">Seed Update</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw128" CLASS="statTextBig">Seed Update</A></TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne128" CLASS="statTextBig">NE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se128" CLASS="statTextBig">SE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w128" CLASS="statTextBig">W</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw128" CLASS="statTextBig">MW</A></TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">512</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
</TR>                  
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Top-10 Winners&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_ne" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_se" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_w" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_mw" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
<TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=tccc02_nese1_summary" CLASS="statTextBig">NE/SE</A></TD>
<TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=tccc02_wmw1_summary" CLASS="statTextBig">W/MW</A></TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                                         
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD COLSPAN="2" VALIGN="middle" CLASS="statText">Northeast & Southeast Regions:<BR/>Tues. Feb. 19 @ 8pm EST<BR/>(raindate: Tues. Feb. 26 @ 8pm EST)</TD>
<TD COLSPAN="3" VALIGN="middle" CLASS="statText">West & Midwest Regions:<BR/>Thurs. Feb. 21 @ 10pm EST<BR/>(raindate: Thurs. Feb. 28 @ 10pm EST)</TD>
</TR>
          
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>                    
<TR>
<TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Regional Semifinals</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne32" CLASS="statTextBig">Seed Update</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se32" CLASS="statTextBig">Seed Update</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w32" CLASS="statTextBig">Seed Update</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw32" CLASS="statTextBig">Seed Update</A></TD> 
</TR>                    
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne32" CLASS="statTextBig">NE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se32" CLASS="statTextBig">SE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w32" CLASS="statTextBig">W</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw32" CLASS="statTextBig">MW</A></TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
</TR>                 
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Room Winners&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
<TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=tccc02_regional_semi" CLASS="statTextBig">All Regions</A></TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD COLSPAN="5" VALIGN="middle" CLASS="statText">All Regions: Wed. Mar. 6 @ 8pm EST (raindate: Thurs. Mar. 7 @ 8pm EST)</TD>
</TR>                    
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>                    
<TR>
<TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Regional Championships</TD>
<TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
</TR>                    
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne" CLASS="statTextBig">NE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statTextBig">SE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w" CLASS="statTextBig">W</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw" CLASS="statTextBig">MW</A></TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
</TR>                  
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
</TR>
<TR>
<TD HEIGHT="13" ALIGN="right" CLASS="statText">Wildcards</TD>
<TD COLSPAN="4" HEIGHT="13" ALIGN="center" CLASS="statText">12 &#40;total&#41; Wildcards pulled from all regions</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD COLSPAN="5" VALIGN="middle" CLASS="statText">All Regions: Wed. Mar. 13 @ 8pm EST (raindate: Thurs. Mar. 14 @ 8pm EST)<BR/><BR/>
Note: The 12 Wildcards represent all regions and are based on highest points from this round.</TD>
</TR>                    
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>                    
<TR>
<TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Semifinals</TD>
<TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
</TR>                    
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">16</TD>
<TD COLSPAN="4" ALIGN="center" CLASS="statText">4 Coders in 4 Rooms</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
</TR>                  
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">All matches occur on Friday, April 19th</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">8:00am (EST)</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">11:00am (EST)</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">3:00pm (EST)</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">6:00pm (EST)</TD>
</TR>                    
<!-- <TR>
<TD COLSPAN="5" VALIGN="middle" HEIGHT="13" CLASS="statText">Friday, April 19th</TD>
</TR>                    
<TR>
<TD COLSPAN="2" VALIGN="middle" CLASS="statText">Room 1 - 8am EST<BR/>Room 2 - 11am EST</TD>
<TD COLSPAN="3" VALIGN="middle" CLASS="statText">Room 3 - 3pm EST<BR/>Room 4 - 6pm EST</TD>
</TR> -->                  
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>                    
<TR>
<TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Championship</TD>
<TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
</TR>                                         
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">4</TD>
<TD COLSPAN="4" ALIGN="center" CLASS="statText">4 Coders in 1 Round</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>
<TR>
<TD COLSPAN="5" VALIGN="middle" HEIGHT="13" CLASS="statText">Saturday, April 20th, @ 1pm EST</TD>
</TR> 
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>                                       
<TR>
<TD ALIGN="right" WIDTH="26%" HEIGHT="18" CLASS="statText" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>                      
<TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif"><B>Tournament Champion</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>
</TR>
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

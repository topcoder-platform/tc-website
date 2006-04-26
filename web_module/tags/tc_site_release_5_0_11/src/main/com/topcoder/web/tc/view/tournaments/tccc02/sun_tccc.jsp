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
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR>
<TD COLSPAN="5" HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
&#160;&#160;Regional Quarter-Finals<BR/>
</TD>
</TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_ne" CLASS="statText">NE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_se" CLASS="statText">SE</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_mw" CLASS="statText">MW</A></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tccc02&d3=regions_w" CLASS="statText">W</A></TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">512</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">128</TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Advancing</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>                  

<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">16<BR/>16</TD>
</TR>
<TR><TD COLSPAN="5" HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;Regional Finals</TD></TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>NE</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>SE</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>MW</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>W</B></TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">128</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">32</TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Advancing</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>                  
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">4<BR/>4</TD>
</TR>
<TR><TD COLSPAN="5" HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;Regional Championships</TD></TR>
<TR>
<TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>                    
<TR>
<TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>NE</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>SE</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>MW</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>W</B></TD>
</TR>
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">32</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
<TD ALIGN="center" CLASS="statText">8</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Advancing</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
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
<TR><TD COLSPAN="5" HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;Semifinals</TD></TR>
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
<TD COLSPAN="4" ALIGN="center" CLASS="statText">4 Coders in 4 Rounds</TD>
</TR>
<TR>
<TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Advancing</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
</TR>                  
<TR>
<TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
<TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
</TR>
<TR><TD COLSPAN="5" HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;Championship</TD></TR>
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
<TD ALIGN="right" WIDTH="26%" HEIGHT="18" CLASS="statText" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>                      
<TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif"><B>Tournament Champion</B></TD>
<TD ALIGN="center" VALIGN="middle" WIDTH="11%" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;</TD>
</TR>
</TABLE>




   </TD>
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

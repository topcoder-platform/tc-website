<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
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
                <jsp:param name="node" value="pbtc_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<!-- <DIV ALIGN="center"><A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/sun_network_logo.gif" ALT="" WIDTH="284" HEIGHT="80" BORDER="0"/></A></DIV> -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
      <TR>
        <TD><DIV ALIGN="center"><A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/sun_network_logo.gif" ALT="" WIDTH="284" HEIGHT="80" BORDER="0"/><!-- </A><A HREF="/?&t=authentication&c=login&errorMsg=You%20must%20log%20in%20to%20view%20this%20portion%20of%20the%20site.&errorURL=/Registration" TARGET="_blank"> --><IMG SRC="/i/tournament/sun_challenge_logo.gif" ALT="" WIDTH="174" HEIGHT="65" BORDER="0"/></A></DIV></TD>
      </TR>      
      
      <!-- <TR>
         <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      </TR>
      <TR>
         <TD COLSPAN="2" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
      </TR> -->            
      <TR>
      <TD VALIGN="top" CLASS="statText">
<P>
<!-- <FONT SIZE="5" COLOR="#FFFFFF" FACE="tahoma, verdana">Welcome!</FONT><BR/> -->Thanks for your interest in the 2002 SunNetwork<SUP>sm</SUP> Coding
Challenge powered by TopCoder. This is <B>NOT</B> a rated event. </P>

<P>
<B>Date:</B> Sept. 18-20<BR/>
<B>Prize Purse:</B> $80,000<BR/>
<B>Place:</B> Moscone Center, San Francisco, CA<BR/>
</P>      
      </TD>  
       <!--  <TD VALIGN="middle"><DIV ALIGN="center"><A HREF="/?&t=authentication&c=login&errorMsg=You must log in to view this portion of the site.&errorURL=/Registration" TARGET="_blank"><IMG SRC="/i/tournament/sun_challenge_logo.gif" ALT="" WIDTH="174" HEIGHT="65" BORDER="0"/></A></DIV></TD> -->
      </TR>                    
</TABLE>
<BR/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">      
      <TR>
        <TD COLSPAN="2" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;SunNetwork Coding Challenge Features</TD>
      </TR>                    
  <TR>
<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
<FONT COLOR="#666666">Round Updates</FONT></TD>
<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
<A HREF="/pl/?module=Static&d1=javaone02&d2=rules" CLASS="statTextBig"><FONT COLOR="#FFCC00">Rules & Regulations</FONT></A></TD>

  </TR>
    </TABLE>
    <BR/>
<P CLASS="statText">
For more information, please read the 
<A HREF="/pl/?module=Static&d1=javaone02&d2=rules" CLASS="statText"><FONT COLOR="#FFCC00">Official Rules & Regulations</FONT></A> prior to registration.
</P>
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

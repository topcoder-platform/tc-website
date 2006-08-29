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


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <jsp:include page="links_summary.jsp" />
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" WIDTH="30%" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Title/Description</TD>
              <TD VALIGN="middle" WIDTH="20%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Media Type</TD>            
              <TD VALIGN="middle" WIDTH="20%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Media Size</TD>             
              <TD VALIGN="middle" WIDTH="15%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Download</TD>              
              <TD VALIGN="middle" WIDTH="15%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Play</TD>            
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;<A HREF="/i/tournament/invit02/invit02_cnn.mov" CLASS="bodyText">CNN HeadlineNews</A></TD>
              <TD VALIGN="middle" CLASS="bodyText">&#160;&#160;QuickTime</TD>            
              <TD VALIGN="middle" CLASS="bodyText">&#160;&#160;12.2 MB</TD>
              <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;<A HREF="/i/tournament/invit02/invit02_cnn.mov" CLASS="bodyText">click here</A></TD>                           
              <TD VALIGN="middle" CLASS="bodyText">&#160;&#160;<A HREF="/?&t=tournaments&c=invit02_cnn_mov" CLASS="bodyText"></A>click here</TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
          </TABLE>            
          <TABLE BORDER="0" BGCOLOR="#000000" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" ALIGN="center" COLSPAN="5" CLASS="bodyText">
<P><BR/></P>
<P><BR/></P>               
              <EMBED TARGET="MYSELF" SRC="/i/tournament/invit02/invit02_cnn.mov" WIDTH="320" HEIGHT="255" ALT="" CONTROLLER="true" CACHE="true" BORDER="0"/>
<P><BR/></P>
<P><BR/></P>               
              </TD>
            </TR>                                                      
          </TABLE>       
<P><BR/></P>          
<P><BR/></P>       
<table cellpadding="5" cellspacing="0" border="0" width="90%">
<tr>
<td colspan="3" class="bodyText"><B>Additional Resources</B><br/>
Use the buttons below to download a media player.</td>
</tr>
<tr>
<td nowrap=""><a href="http://www.apple.com/quicktime/download/" target="_new"><img src="/i//button_qt.gif" width="90" height="33" border="0" alt="CLICK HERE TO GO TO THE APPLE QUICKTIME DOWNLOAD PAGE"/></a>&#160; <a href="http://scopes.real.com/real/player/player.html?src=010709realhome_1,010613rpchoice_h1&dc=717716715" target="_new"><img src="/i//button_real.gif" width="90" height="33" border="0" alt="CLICK HERE TO GO TO THE REAL PLAYER DOWNLOAD PAGE"/></a>&#160; <a href="http://windowsmedia.com/download/download.asp" target="_new"><img src="/i//button_wmp.gif" width="120" height="33" border="0" alt="CLICK HERE TO GO TO THE MICROSOFT WINDOWS MEDIA PLAYER DOWNLOAD PAGE"/></a>
</td></tr>
</table><br/>



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

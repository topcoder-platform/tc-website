<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Recruiting provides employers with innovative programs designed to attract, identify, and evaluate candidates</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

<SCRIPT LANGUAGE="JavaScript">
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes 
              && navigator.mimeTypes["application/x-shockwave-flash"]) 
            ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
  var words = navigator.plugins["Shockwave Flash"].description.split(" ");
  for (var i = 0; i < words.length; ++i) {
    if (isNaN(parseInt(words[i])))
      continue;
    var MM_PluginVersion = words[i];
  }
  MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
} else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
           && (navigator.appVersion.indexOf("Win") != -1)) {
  document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');
  document.write('on error resume next \n');
  document.write('MM_FlashCanPlay = ( IsObject(CreateObject');
  document.write('("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
  document.write('</SCR' + 'IPT\> \n');
}
//-->
</SCRIPT>


</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>

<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="recruiting"/>
                <jsp:param name="level2" value=""/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_topcoder_recruiting.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h3><strong>Candidate Identification</strong></h3>

<div align="center">
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
document.write(' <object ');
document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.write(' codebase="http://fpdownload.macromedia.com" ');
document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
document.write(' width="400" ');
document.write(' height="400" ');
document.write(' id="tc_card" ');
document.write(' align="middle">');
document.write(' <param name="allowScriptAccess" value="sameDomain" />');
document.write(' <param name="movie" ');
document.write(' value="/i/card/tc_card.swf?memberID=144400"/>');
document.write(' <param name="menu" value="false" />');
document.write(' <param name="quality" value="high" />');
document.write(' <param name="bgcolor" value="#ffffff" />');
document.write(' <embed ');
document.write(' src="/i/card/tc_card.swf?memberID=144400" ');
document.write(' menu="false" ');
document.write(' quality="high" ');
document.write(' bgcolor="#ffffff" ');
document.write(' width="400" ');
document.write(' height="400" ');
document.write(' name="tc_card" ');
document.write(' align="middle" ');
document.write(' allowScriptAccess="sameDomain" ');
document.write(' type="application/x-shockwave-flash" ');
document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
document.write(' </object> ');
}
// -->
</SCRIPT>

<SCRIPT language="JavaScript">
<!--
if (!MM_FlashCanPlay){
document.write('<A href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank"> ');
document.write('<img src="/i/card/noFlash.gif" width="400" height="400" border="0"></A> ');
}
// -->
</SCRIPT>
                        
                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="recruiting"/>
                        <jsp:param name="level2" value="overview"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

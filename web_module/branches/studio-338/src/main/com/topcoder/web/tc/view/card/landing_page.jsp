<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Card</title>

<jsp:include page="/script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" width="100%" align="center">

         <div class="cardBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="cards"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

<p>
The TopCoder member base is an international community of computer programmers brought together through competition.  Our Algorithm competitions showcase developers' skills in solving complex mathematical and algorithmic problems.  Design and Development competitions give members an opportunity to build software components and applications that are sold to TopCoder clients.
<br/><br/>
TopCoder Cards are a snapshot of each member's performance to date.
</p>

<br/>

<div align="center">
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
document.write(' <object ');
document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.write(' codebase="http://fpdownload.macromedia.com" ');
document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
document.write(' width="400" ');
document.write(' height="410" ');
document.write(' id="tc_card" ');
document.write(' align="middle">');
document.write(' <param name="allowScriptAccess" value="sameDomain" />');
document.write(' <param name="movie" value="/i/card/tc_card.swf?postButton=false&memberID=<%=request.getAttribute("cr")%>"');
document.write(' <param name="menu" value="false" />');
document.write(' <param name="quality" value="high" />');
document.write(' <param name="bgcolor" value="#ffffff" />');
document.write(' <embed ');
document.write(' src="/i/card/tc_card.swf?postButton=false&memberID=<%=request.getAttribute("cr")%>" ');
document.write(' menu="false" ');
document.write(' quality="high" ');
document.write(' bgcolor="#ffffff" ');
document.write(' width="400" ');
document.write(' height="410" ');
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
document.write('<img src="/i/card/noFlash.gif" width="400" height="410" border="0"></A> ');
}
// -->
</SCRIPT>
</div>

<p align=center><A href="/tc?module=Static&d1=card&d2=help">What am I looking at?</a></p>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="card"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

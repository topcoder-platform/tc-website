<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>
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

</HEAD>
<body>

<!-- Header begins -->
<%--<jsp:include page="../includes/top.jsp" />--%>
<jsp:include page="../includes/topTemp.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="200" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText"> 
                        <p><span class=testHead>Position Results</span><br/>
                        Company Name: Brooks<br/>
                        Campaign Name: Operation FindCandidate<br/>
                        Position Name: Architect<br/>
                        </p>
                    </td>
                </tr>
            </table>

            <br/>
            
            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText">Total Candidates: <b>73</b></td>
                    <td class="bodyText" align=right>Showing 1-20:&#160;&#160;&#160;<A href="/">Prev 20</A> | <A href="/">Next 20</a></td>
                </tr>
            </table>
            
            <br/>
            
            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="10%"><A class=screeningHeader href="/">Name</A></td>
                    <td class="screeningHeader" width="10%"><A class=screeningHeader href="/">State/<br/>Province</A></td>
                    <td class="screeningHeader" width="10%"><A class=screeningHeader href="/">Country</A></td>
                    <td class="screeningHeader" width="10%" align=center><A class=screeningHeader href="/">Type</A></td>
                    <td class="screeningHeader" width="10%"><A class=screeningHeader href="/">Problem</A></td>
                    <td class="screeningHeader" width="10%" align=center><A class=screeningHeader href="/">Time</A></td>
                    <td class="screeningHeader" width="10%" align=center><A class=screeningHeader href="/">Problem<br/>Results</A></td>
                    <td class="screeningHeader" width="10%" align=center><A class=screeningHeader href="/">Preference<br/>Level</A></td>
                    <td class="screeningHeader" width="10%" align=center><A class=screeningHeader href="/">Notes</A></td>
                </tr>

<script type="text/javascript">
for (i = 1; i <= 20; i++)
{
    document.write("<tr>")
    if(i%2==1)
    {
                    document.write("<td class='screeningCellOdd' nowrap=nowrap><A href='/corp/testing/candidate/profile.jsp'>Johnny Doe"+i+"</A></td> ")
                    document.write("<td class='screeningCellOdd'>CT</td>")
                    document.write("<td class='screeningCellOdd' nowrap=nowrap>United States</td>")
                    document.write("<td class='screeningCellOdd' align=center>student</td>")
                    document.write("<td class='screeningCellOdd'><A href='/'>Rain</A></td>")
                    document.write("<td class='screeningCellOdd' align=center>00:40.20</td>")
                    document.write("<td class='screeningCellOdd' align=center><A href='/'>view</A></td>")
                    document.write("<td class='screeningCellOdd' align=center>")

                    document.write(' <object ');
                    document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
                    document.write(' codebase="http://fpdownload.macromedia.com" ');
                    document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' id="tc_card" ');
                    document.write(' align="middle">');
                    document.write(' <param name="allowScriptAccess" value="sameDomain" />');
                    document.write(' <param name="movie" ');
                    document.write(' value="/i/corp/screeningRatingOdd.swf"/>');
                    document.write(' <param name="menu" value="false" />');
                    document.write(' <param name="quality" value="high" />');
                    document.write(' <param name="bgcolor" value="#ffffff" />');
                    document.write(' <embed ');
                    document.write(' src="/i/corp/screeningRatingOdd.swf" ');
                    document.write(' menu="false" ');
                    document.write(' quality="high" ');
                    document.write(' bgcolor="#ffffff" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' name="tc_card" ');
                    document.write(' align="middle" ');
                    document.write(' allowScriptAccess="sameDomain" ');
                    document.write(' type="application/x-shockwave-flash" ');
                    document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
                    document.write(' </object> ');

                    document.write("</td>")
                    document.write("<td class='screeningCellOdd' align=center><A href='/corp/testing/candidate/profile.jsp'>view</A></td>")
    } else {
                    document.write("<td class='screeningCellEven' nowrap=nowrap><A href='/corp/testing/candidate/profile.jsp'>Johnny Doe"+i+"</A></td> ")
                    document.write("<td class='screeningCellEven'>CT</td>")
                    document.write("<td class='screeningCellEven' nowrap=nowrap>United States</td>")
                    document.write("<td class='screeningCellEven' align=center>student</td>")
                    document.write("<td class='screeningCellEven'><A href='/'>Rain</A></td>")
                    document.write("<td class='screeningCellEven' align=center>00:40.20</td>")
                    document.write("<td class='screeningCellEven' align=center><A href='/'>view</A></td>")
                    document.write("<td class='screeningCellEven' align=center>")

                    document.write(' <object ');
                    document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
                    document.write(' codebase="http://fpdownload.macromedia.com" ');
                    document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' id="tc_card" ');
                    document.write(' align="middle">');
                    document.write(' <param name="allowScriptAccess" value="sameDomain" />');
                    document.write(' <param name="movie" ');
                    document.write(' value="/i/corp/screeningRatingEven.swf"/>');
                    document.write(' <param name="menu" value="false" />');
                    document.write(' <param name="quality" value="high" />');
                    document.write(' <param name="bgcolor" value="#ffffff" />');
                    document.write(' <embed ');
                    document.write(' src="/i/corp/screeningRatingEven.swf" ');
                    document.write(' menu="false" ');
                    document.write(' quality="high" ');
                    document.write(' bgcolor="#ffffff" ');
                    document.write(' width="80" ');
                    document.write(' height="12" ');
                    document.write(' name="tc_card" ');
                    document.write(' align="middle" ');
                    document.write(' allowScriptAccess="sameDomain" ');
                    document.write(' type="application/x-shockwave-flash" ');
                    document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
                    document.write(' </object> ');

                    document.write("</td>")
                    document.write("<td class='screeningCellEven' align=center><A href='/corp/testing/candidate/profile.jsp'>view</A></td>")
    }
    document.write("</tr>")
}
</script>

            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText" align=right>Showing 1-20:&#160;&#160;&#160;<A href="/">Prev 20</A> | <A href="/">Next 20</a></td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>

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
                        
                        <p class=testHead>Candidate Info</p>

                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrameNB">
                <tr>
                    <td valign=top class=screeningCellBG>
                
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningHeader" colspan=2>Personal Info</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right nowrap=nowrap>First Name:</td>
                            <td class="screeningCellOdd" width="100%">John</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right nowrap=nowrap>Middle Initial:</td>
                            <td class="screeningCellEven">Q</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right nowrap=nowrap>Last Name:</td>
                            <td class="screeningCellOdd">Doe</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right nowrap=nowrap>Email Address:</td>
                            <td class="screeningCellEven">jdoe@topcoder.com</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>Address 1:</td>
                            <td class="screeningCellOdd">123 This St.</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>Address 2:</td>
                            <td class="screeningCellEven"></td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>Address 3:</td>
                            <td class="screeningCellOdd"></td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>City:</td>
                            <td class="screeningCellEven">Capital City</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>State:</td>
                            <td class="screeningCellOdd">CT</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>Zip Code:</td>
                            <td class="screeningCellEven">012345</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd" align=right>Country:</td>
                            <td class="screeningCellOdd">United States</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" align=right>Preference Level:</td>
                            <td class="screeningCellEven" valign=middle>
<SCRIPT language="JavaScript">
<!--
if ( MM_FlashCanPlay ) {
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
}
// -->
</SCRIPT>
                            </td>
                        </tr>
                    </table>
                    </td>

                    <td><img src="/i/clear.gif" border=0 width=10 height=1/></td>

                    <td valign=top class=screeningCellBG>
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningHeader" colspan=2>Demographic Info</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd">Student or Professional?</td>
                            <td class="screeningCellOdd">Professional</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven" width="60%">Are you currently seeking employment?</td>
                            <td class="screeningCellEven">Yes</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd">Are you currently employed?</td>
                            <td class="screeningCellOdd">David Lee Roth</td>
                        </tr>
                        <tr>
                            <td class="screeningCellEven">This is an example of a long question that will test how the table handles questions that need to wrap?</td>
                            <td class="screeningCellEven">Yes</td>
                        </tr>
                        <tr>
                            <td class="screeningCellOdd">Are you willing to relocate?</td>
                            <td class="screeningCellOdd">Yes</td>
                        </tr>
                    </table>

                    </td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrame">
                <tr>
                    <td width="70%" class="screeningHeader">Notes</td>
                    <td width="15%" align="center" class="screeningHeader">Author</td>
                    <td width="15%" align="center" class="screeningHeader">Date Created</td>
                </tr>
                <tr>
                    <td valign=top width="70%"class=screeningCellOdd><strong>This is an example of a very long note.  This note should check the spacing of the this table and how it will react to a message that wraps and extends the cell.</strong></td>
                    <td valign=top width="15%"class=screeningCellOdd align=center>PGriffin</td>
                    <td valign=top width="15%"class=screeningCellOdd align=center>06/20/2004</td>
                </tr>
                <tr>
                    <td valign=top width="70%"class=screeningCellEven><strong>Impressive work</strong></td>
                    <td valign=top width="15%"class=screeningCellEven align=center>D9S</td>
                    <td valign=top width="15%"class=screeningCellEven align=center>06/01/2004</td>
                </tr>
                <tr>
                    <td valign=top width="70%"class=screeningCellOdd><strong>Good timing but code could be a little cleaner</strong></td>
                    <td valign=top width="15%"class=screeningCellOdd align=center>DLRoth</td>
                    <td valign=top width="15%"class=screeningCellOdd align=center>06/01/2004</td>
                </tr>
                 <tr>
                    <td class="screeningCellEven" colspan="3" align=center><img src="/i/corp/addNoteButton.gif" border=0/></td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrame">
                <tr>
                    <td width="30%" class="screeningHeader">Problem Name</td>
                    <td width="14%" align="center" class="screeningHeader">Language</td>
                    <td width="14%" align="center" class="screeningHeader">Status</td>
                    <td width="14%" align="center" class="screeningHeader">Time</td>
                    <td width="14%" align="center" class="screeningHeader">Percentile</td>
                    <td width="14%" align="center" class="screeningHeader">Results</td>
                </tr>
                <tr>
                    <td width="30%" class="screeningCellOdd"><A href="/">Rain</A></td>
                    <td width="14%" align="center" class="screeningCellOdd">Java</td>
                    <td width="14%" align="center" class="screeningCellOdd">done</td>
                    <td width="14%" align="center" class="screeningCellOdd">00:40.20</td>
                    <td width="14%" align="center" class="screeningCellOdd">90.90</td>
                    <td width="14%" align="center" class="screeningCellOdd"><A href="/">view</A></td>
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

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer total= (ResultSetContainer)request.getAttribute("total_component_prices");%>


<SCRIPT LANGUAGE="JavaScript">
<!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
		var words = navigator.plugins["Shockwave Flash"].description.split(" ");
	    for (var i = 0; i < words.length; ++i)
	    {
		if (isNaN(parseInt(words[i])))
		continue;
		var MM_PluginVersion = words[i];
	    }
	MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
}
else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
   && (navigator.appVersion.indexOf("Win") != -1)) {
	document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n'); //FS hide this from IE4.5 Mac by splitting the tag
	document.write('on error resume next \n');
	document.write('MM_FlashCanPlay = ( IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
	document.write('</SCR' + 'IPT\> \n');
}
//-->
</SCRIPT>

<SCRIPT language="JavaScript">
                <!--

if ( MM_FlashCanPlay ) {
       document.write('<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"');
	document.write('  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
	document.write(' ID="bracket" WIDTH="170" HEIGHT="150" ALIGN="top">');
	document.write(' <PARAM NAME=movie VALUE="/i/promos/software_dev_promo.swf?currentTotal=<rsc:item set="<%=total%>" name="total" format="0,0"/>"> <PARAM NAME=menu VALUE=false> <PARAM NAME=quality VALUE=high> <PARAM NAME=salign VALUE=T> <PARAM NAME=bgcolor VALUE=#FFFFFF>  ');
	document.write(' <EMBED src="/i/promos/software_dev_promo.swf?currentTotal=<rsc:item set="<%=total%>" name="total" format="0,0"/>" menu=false quality=high salign=T bgcolor=#FFFFFF  ');
	document.write(' swLiveConnect=TRUE WIDTH="170" HEIGHT="150" NAME="bracket" ALIGN="top"');
	document.write(' TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">');
	document.write(' </EMBED>');
	document.write(' </OBJECT>');
}
// -->
</SCRIPT>
<SCRIPT language="JavaScript">
<!--<A href="/?&amp;t=development&amp;c=index"  target="_blank"><img src="/i/promos/development_promo_third.gif" width="170" height="150" border="0" alt="Earn cash while using your skills" /></A>
       if (!MM_FlashCanPlay){
       document.write('<A href="/?&amp;t=development&amp;c=index"  target="_blank"><img src="/i/promos/development_promo_third.gif" width="170" height="150" border="0"></A>');
       }
// -->
</SCRIPT>

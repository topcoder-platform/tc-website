<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%ResultSetContainer donationTotal = (ResultSetContainer)request.getAttribute("donationTotal");%>

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

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_rules_prizes" target="_top"><img src="/i/events/crpf03/promo_crpf_tshirt.gif" alt="Earn a t-shirt!" width="170" height="128" border="0"></A><br />

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_att" target="_top"><img src="/i/events/crpf03/att_foundation.gif" alt="ATT Foundation" width="170" height="120" border="0"></A><br />

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />


            <rsc:iterator list="<%=donationTotal%>" id="info">
                <SCRIPT language="JavaScript">
                <!--
                     if (MM_FlashCanPlay){
                             document.write('<object type="application/x-shockwave-flash" data="/i/tournament/crpf03/crpf_meter.swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="170" height=300 border="0" salign="Top" id="myFlash" >');
                             document.write('<PARAM NAME=movie VALUE="/i/tournament/crpf03/crpf_meter.swf?currentTotal=<rsc:item row="<%=info%>" name="amount" format="0.00"/>">');
                             document.write('<PARAM NAME=quality VALUE="high">');
                             document.write('<PARAM NAME=bgcolor VALUE="#FFFFFF">');
                             document.write('<embed src="/i/tournament/crpf03/crpf_meter.swf?currentTotal=<rsc:item row="<%=info%>" name="amount" format="0.00"/>&flashContentURL=flash_content/flash_content.html&altContentURL=upgrade_flash/upgrade_flash.html&contentVersion=6&contentMajorRevision=0&contentMinorRevision=79&allowFlashAutoInstall=false" quality=high width=170 height=300 border="0" salign="Top" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" name="myFlash" swLiveConnect="true" ></embed>');
                             document.write('</object>');
                     }
                     // -->
                  </SCRIPT>
             </rsc:iterator>

                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            if (!MM_FlashCanPlay){
                               document.write('<a href="/tc?module=CRPFReport"><img src="/i/tournament/crpf03/fundraisers.gif" width="180" height="100" border="0" hspace="0"></a>');
                            }
                            // -->
                            </SCRIPT>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <p><br/></p>

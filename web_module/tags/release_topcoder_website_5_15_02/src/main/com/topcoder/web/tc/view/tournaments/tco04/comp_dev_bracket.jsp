<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
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
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="bracket"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>Development Finals Bracket</p>

            <table width="510" align="center" border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td width = "100%" align = "center" class="bodyText"> 

<SCRIPT language="JavaScript">
                <!--
if ( MM_FlashCanPlay ) {
       document.write('<p>Click the names within the bracket to see competitor statistics.</p>');
       document.write('<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"');
	document.write('  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
	document.write(' ID="bracket" WIDTH="510" HEIGHT="450" ALIGN="top">');
	document.write(' <PARAM NAME=movie VALUE="/i/tournament/tco04/brackets/bracket_dev.swf"> <PARAM NAME=menu VALUE=false> <PARAM NAME=quality VALUE=high> <PARAM NAME=salign VALUE=T> <PARAM NAME=bgcolor VALUE=#FFFFFF>  '); 
	document.write(' <EMBED src="/i/tournament/tco04/brackets/bracket_dev.swf" menu=false quality=high salign=T bgcolor=#FFFFFF  ');
	document.write(' swLiveConnect=FALSE WIDTH="510" HEIGHT="450" NAME="bracket" ALIGN="top"');
	document.write(' TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">');
	document.write(' </EMBED>');
	document.write(' </OBJECT>');
	document.write(' <p>Note: The onsite competitors may change due to travel restrictions.</p>');                  
}
// -->
</SCRIPT>
<SCRIPT language="JavaScript">
<!--
       if (!MM_FlashCanPlay){
        document.write('<A href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank"> ');
        document.write('<img src="/i/noFlash.gif" width="340" height="258" border="0"></A> ');
       }
// -->
</SCRIPT>

                        </td>
                   </tr>
            </table>


         <p><br/></p>
            
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>

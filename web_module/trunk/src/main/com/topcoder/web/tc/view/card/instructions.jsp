<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Card</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="card"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" WIDTH="100%">
            
            <div class="bodyText">

            <p>Great!  You've unlocked your TopCoder Member Card.  In addition to being able to view your card here, you can also place it right into your own site! Here's how:</p>
            
            <ol>
            <li>Insert the following JavaScript into the <b>&lt;head&gt;</b> of your page:</li>
            
<pre>
&lt;SCRIPT LANGUAGE="JavaScript"&gt;
&lt;!--
var MM_contentVersion = 6;
var MM_FlashCanPlay = false;
var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
        var words = navigator.plugins["Shockwave Flash"].description.split(" ");
        for (var i = 0; i &lt; words.length; ++i)
        {
        if (isNaN(parseInt(words[i])))
        continue;
        var MM_PluginVersion = words[i];
        }
    MM_FlashCanPlay = MM_PluginVersion &gt;= MM_contentVersion;
}
else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")&gt;=0
   && (navigator.appVersion.indexOf("Win") != -1)) {
    document.write('&lt;SCR' + 'IPT LANGUAGE=VBScript\&gt; \n'); //FS hide this from IE4.5 Mac by splitting the tag
    document.write('on error resume next \n');
    document.write('MM_FlashCanPlay = ( IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
    document.write('&lt;/SCR' + 'IPT\&gt; \n');
}
//--&gt;
&lt;/SCRIPT&gt;
</pre>
            <li>Insert the following JavaScript code into the <b>&lt;body&gt;</b> of your page similar to how you would insert an image:<br/>
<pre>
&lt;SCRIPT language="JavaScript"&gt;
                &lt;!--
if ( MM_FlashCanPlay ) {
document.write(' &lt;object ');
document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.write(' codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
document.write(' width="400" ');
document.write(' height="400" ');
document.write(' id="tc_card" ');
document.write(' align="middle"&gt;');
document.write(' &lt;param name="allowScriptAccess" value="sameDomain" /&gt;');
document.write(' &lt;param name="movie" value="/i/card/tc_card.swf?memberID=144400" /&gt;');
document.write(' &lt;param name="menu" value="false" /&gt;');
document.write(' &lt;param name="quality" value="high" /&gt;');
document.write(' &lt;param name="bgcolor" value="#ffffff" /&gt;');
document.write(' &lt;embed ');
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
document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /&gt; ');
document.write(' &lt;/object&gt; ');
}
// --&gt;
&lt;/SCRIPT&gt;

&lt;SCRIPT language="JavaScript"&gt;
&lt;!--
       if (!MM_FlashCanPlay){
       document.write('&lt;img src="/i/clear.gif" width="400" height="400" border="0"&gt;');
       }
// --&gt;
&lt;/SCRIPT&gt;
</pre>
            </li>
            </ol>
            
            </div>
            

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>

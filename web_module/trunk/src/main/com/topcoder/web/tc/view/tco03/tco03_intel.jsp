<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Intel&#174; is the title sponsor of the 2003 TopCoder Open</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>');
}
</SCRIPT>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

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
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" align="center">
            <table border="0" cellspacing="15" cellpadding="0" width="540">
                <tr valign="top">
                    <td colspan="2" class="bodyText">
                        <p><img src="/i/sponsor/intel_ids/IDS_TC-header.gif" width="510" height="140" alt="Intel Developer Services" /></p>
                    </td>
                </tr> 
                
                <tr align="left">
                    <td class="bodyText" valign="top" width="280" > 
                        <p>With technology complexity increasing at a blistering pace, <strong>Intel&#174; Developer Services</strong> offers the resources and 
                        opportunities you need to keep in stride with industry innovations, take advantage of emerging technologies and accelerate the successful 
                        development and delivery of your solutions.</p>
                                             
                        <p>How? With offerings such as code samples, demos, software documentation, online training, developer forums and 
                        technical content. Membership with <strong>Intel Developer Services</strong> gives you FREE access to tools and resources that can 
                        maximize your code's performance, give you a time-to-market advantage and make your software sing.<br/>
                        <img src="/i/clear.gif" width="280" height="1" border="0"/></p>
                     </td>
                     
                     <td class="smallText" width="205">
                        <div align="center"><img src="/i/sponsor/intel_ids/Centrino_Image_embossed.jpg" width="120" height="117" /></div>
                       
                        <p>Register for Intel Developer Services and compete in the TopCoder Open for a chance to win an Intel&#174; Centrino&#8482;  
                        mobile technology-based notebook! <A href="Javascript:openWin('?t=tournaments&#38;c=tco03_intel_specs','comp',545,655);">View Specs.</A></p>
                        
                        <p class="bodyText"><strong><A href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup">Register Now!</A></strong></p>
                        
                        <p class="bodyText"><strong>Use promotion code <font color="#CC0000">TCO2003.</font></strong><br/>
                        <img src="/i/clear.gif" width="205" height="1" border="0"/></p>
                    </td>
                </tr>
             
                <tr>
                    <td colspan="2" class="bodyText">
                        <p><strong><A href="Javascript:openWin('?t=tournaments&#38;c=tco03_intel_sample','comp',545,655);">Check out</A> what Intel Developer 
                        Services offers you.</strong></p>
                        
                        <p><strong>Then join <A href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup">Intel Developer Services</A> 
                        today and get FREE technical resources designed to help you capitalize on today's technology trends, optimize solutions and fulfill your customers' growing demands.</strong></p>
                    
                        <p><strong>Remember to use promotion code <font color="#CC0000"><strong>TCO2003</strong></font> and compete in the TopCoder Open for a chance to win an Intel&#174; Centrino&#8482; 
                        mobile technology-based notebook!</strong></p>
                    
                        <p><A href="Javascript:openWin('?t=tournaments&#38;c=tco03_intel_rules','comp',545,655);">Official Drawing Rules</A> for Intel&#174; 
                        Centrino&#8482; mobile technology-based notebook.</p>
                    
                        <p class="smallText">*Intel, the Intel Inside logo, Intel Centrino and the Intel Centrino logo are trademarks or registered trademarks of Intel Corporation or its subsidiaries in the United States and other countries.</p>
                    
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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

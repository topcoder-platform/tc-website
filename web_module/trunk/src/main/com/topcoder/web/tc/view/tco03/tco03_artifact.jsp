<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Artifact Software is a corporate sponsor of the 2003 TopCoder Open coding tournament</title>

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

</head>

<body onLoad="timer(1);">

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
        <td width="99%" align="center">
            <table border="0" cellspacing="15" cellpadding="0">
                <tr valign="top">
                    <td width="510" class="promoText">
                        <p><img src="/i/sponsor/artifact/artifact_banner.jpg" width="510" height="66" /><br/>
                        <img src="/i/sponsor/artifact/artifact_headline.gif" width="510" height="66" /></p>

                        <p>Need quick answers to your Programming Questions? </p>
                        
                        <p>Tired of wasting time looking for code? </p>
                        
                        <p>At Artifact, we've created software products and an on-line developer network to help developers 
                        better manage their resources. </p>
                        
                        <p>The <strong><A href="http://www.HyperTracker.com/go/artifactsoftware/TCO" target="_blank">Artifact Network</A></strong>&#153;
                        is an on-line developer network that provides developers with an open forum to exchange code and development expertise. </p>
                        
                        <p>The <strong><A href="http://www.HyperTracker.com/go/artifactsoftware/TCO" target="_blank">Artifact Desktop</A></strong>&#153;
                        is a free .Net application that helps the individual developer to easily find, manage and share code, and collaborate with other 
                         developers in real-time. </p>
                         
                        <p>The <strong><A href="http://www.HyperTracker.com/go/artifactsoftware/TCO" target="_blank">Artifact Server</A></strong>&#153;
                        enables a development team to quickly establish their own private code-sharing network behind the corporate firewall. If so, the Artifact 
                        Desktop can help. It's a free application that provides access to the global Artifact Developer Network. This network contains thousands 
                        of code snippets and thousands of experienced developers. The Artifact Desktop helps you to quickly locate code you need from our 
                        network's repository. You can search for code snippets by language, platform, category and more. </p>
                        
                        <p>For immediate answers to your programming questions, use the Artifact Desktop's instant messaging and chat 
                        functionality to tap the expertise of other developers in the Artifact Network. </p>
                        
                        <p>Get the Artifact Desktop now, and build better software - faster </p>
           	
                        <p>To visit Artifact's Network click <strong><A href="http://www.HyperTracker.com/go/artifactsoftware/TCO" target="_blank">here</A></strong>. </p>
             
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

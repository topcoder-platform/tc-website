<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />

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
                <jsp:param name="level1" value="help"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="help"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Algorithm Competitions"/>  
        </jsp:include>

        <h2>Getting Started</h2>
        
<a name="gen_usage"></a>
<p><span class="bodySubtitle">What is the TopCoder Arena?</span><br/>
The TopCoder Arena is a pure Java application that can be run as either an Applet from within a browser, or as an application from within JWS (Java Web Start).  The Arena is where all of the competition action takes place.  It is where each coder can practice, compete, or spectate.</p>

<a name="gen_usage"></a>
<p><span class="bodySubtitle">How to Run the TopCoder Arena</span></p>

<ul>
<li>
<a name="gen_chat"></a><span class="bodySubtitle">What software will you need to install?</span> - 
In order to run the TopCoder Arena, you will need to install a Java runtime environment that is at least version 1.3. For information on which browser and operating systems are compatible with the plug-in, click here.  Most browser software will recognize the existence of a Java runtime on your machine, and utilize the latest version in order to run the Arena as an applet. The latest version of the JRE (Java Runtime Environment) can be downloaded from Sun's website (http://java.sun.com/products/plugin/). If you have the Sun 1.3 or 1.4 JRE or JDK installed on your machine, you already have the plug-in software installed. We recommend installing the JRE 1.4 environment, which is the most current version available. Once the plug-in (or the 1.3/1.4 environment) has been downloaded and installed, you will not need to perform these steps in the future. The download for the JRE version 1.4, which includes the plug-in software, is over 10MB. This means the download may take some time to complete. Remember, this download only needs to be completed once. Completing the previous steps will also satisfy all prerequisites in order to run the TopCoder Arena from within your browser. Installing the 1.3/1.4 Java Runtime will also allow you to run the TopCoder competition Arena from within Java Web Start (although Java Web Start will need to be installed separately).  The TopCoder competition software exists as a signed .jar file, which will request full access to your local machine.  This is so that certain elements of the Arena (i.e. cut and paste, writing to the local file system, etc.) will function properly.
</li>
<li>
<a name="gen_chat"></a><span class="bodySubtitle">Running the TopCoder Arena as an Applet or by using Java Web Start</span> - 
Many TopCoder members prefer to run the TopCoder Arena as an application, rather than an Applet.  In some cases, this can provide greater stability.  Java Web Start (JWS) will facilitate this process, checking for new versions of the software each time the Arena is run.  In order to use JWS, you may first need to install the JWS software.
</li>
<li>
<a name="gen_chat"></a><span class="bodySubtitle">Local Firewall and Network Considerations</span> - 
The following port access will be necessary in order to run the TopCoder Arena:<br/><br/>

Outbound access to www.topcoder.com on port 5001<br/><br/>

While using HTTP Tunneling, you will need access to arena.topcoder.com on port 80
</li>
<li>
<a name="gen_chat"></a><span class="bodySubtitle">HTTP Tunneling</span> - 
Without using HTTP tunneling the TopCoder Arena creates a direct socket connection to the TopCoder competition server.  In order to function, your local networking environment must allow outbound TCP connections to www.topcoder.com on port 5001.  Since port 5001 is a non-standard port, many firewalls will not allow this access.  If you do not have control over allowing this access, you do have the option to run the Arena utilizing HTTP tunneling.  By checking the HTTP Tunneling option on the Arena login screen, all network traffic to and from the TopCoder competition server will be wrapped as if it were standard HTTP traffic on a standard port (port 80).  This should resolve most firewall issues.  However, you should only utilize the tunneling option if it is necessary since the performance of the Arena will be significantly slower while the tunneling option is being utilized.
</li>
</ul>

         <p><br/></p>
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

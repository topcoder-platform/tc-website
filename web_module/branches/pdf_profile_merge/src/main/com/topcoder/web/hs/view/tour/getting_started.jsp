<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
  <jsp:param name="isGuidePage" value="true"/>
</jsp:include>
<!-- Top ends -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="170" bgcolor="#001934">
            <jsp:include page="../includes/left_nav.jsp" />
            <jsp:include page="../includes/left_calendar.jsp" />
        </td>
<!-- Left Column begins -->
        
<!-- Center Column begins -->
        <td valign="top" background="/i/hs/bluegradiant_bg.gif" bgcolor="#FFFFFF" width="99%">
            <table cellspacing="0" cellpadding="10" border="0" width="100%">
                <tr><td width="100%" bgcolor="001934"><img src="/i/hs/headinginside_compguide.gif" width="348" height="44" border="0"></td></tr>
                
                <tr>
                    <td width="100%" class="bodyText">

                        <h3>Getting Started</h3>
                        
                        <div align="right"><a href="?module=Static&d1=tour&d2=general_usage">The TopCoder Arena &gt;</a></h3></div>

                        <p><strong>What is the TopCoder Arena?</strong><br>
                        The TopCoder Arena is a pure Java application that can be run as either an Applet from within a browser, or as an 
                        application from within JWS (Java Web Start).  The Arena is where all of the competition action takes place.  It is 
                        where each coder can practice, compete, or spectate.</p>

                        <p><strong>What software will you need to install?</strong><br>
                        In order to run the TopCoder Arena, you will need to install a Java runtime environment that is at least version 1.3. 
                        For information on which browser and operating systems are compatible with the plug-in, click here.  Most browser 
                        software will recognize the existence of a Java runtime on your machine, and utilize the latest version in order to 
                        run the Arena as an applet. </p>
                        
                        <p>The latest version of the JRE (Java Runtime Environment) can be downloaded from Sun's 
                        <a href="http://java.sun.com/products/plugin/" target="_blank">web site.</a> If you have the Sun 1.3 or 1.4 JRE or 
                        JDK installed on your machine, you already have the plug-in software installed. </p>
                        
                        <p>We recommend installing the JRE 1.4 environment, which is the most current version available. Once the plug-in 
                        (or the 1.3/1.4 environment) has been downloaded and installed, you will not need to perform these steps in the future. 
                        The download for the JRE version 1.4, which includes the plug-in software, is over 10MB. This means the download 
                        may take some time to complete. </p>
                        
                        <p>Remember, this download only needs to be completed once. Completing the previous steps will also satisfy all prerequisites 
                        in order to run the TopCoder Arena from within your browser. Installing the 1.3/1.4 Java Runtime will also allow you 
                        to run the TopCoder competition Arena from within Java Web Start (although Java Web Start will need to be installed 
                        separately). </p>
                        
                        <p>The TopCoder competition software exists as a signed .jar file, which will request full access to your local machine.  This 
                        is so that certain elements of the Arena (i.e. cut and paste, writing to the local file system, etc.) will function properly.</p>

                        <p><strong>Running the TopCoder Arena as an Applet or by using Java Web Start</strong><br>
                        Many TopCoder members prefer to run the TopCoder Arena as an application, rather than an Applet.  In some cases, this can provide greater stability.  Java Web Start (JWS) will facilitate this process, checking for new versions of the software each time the Arena is run.  In order to use JWS, you will first need to install the JWS software.</p>

                        <p><strong>Local Firewall and Network Considerations</strong><br>
                        The following port access will be necessary in order to run the TopCoder Arena:</p>

                        <p><strong>As an Applet:</strong>  outbound access to www.topcoder.com on port 5001</p>

                        <p><strong>As a JWS Application:</strong>  outbound TCP access to arena.topcoder.com on port 80</p>

                        <p><strong>As either an Applet or an Application while using HTTP Tunneling:</strong>  HTTP access to arena.topcoder.com on port 80</p>

                        <p><strong>HTTP Tunneling</strong><br>
                        Without using HTTP tunneling the TopCoder Arena creates a direct socket connection to the TopCoder competition server.  
                        In order to function, your local networking environment must allow outbound TCP connections to www.topcoder.com on 
                        port 5001.  Since port 5001 is a non-standard port, many firewalls will not allow this access.  </p>
                        
                        <p>If you do not have control over allowing this access, you do have the option to run the Arena utilizing HTTP tunneling.  By 
                        checking the HTTP Tunneling option on the Arena login screen, all network traffic to and from the TopCoder competition 
                        server will be wrapped as if it were standard HTTP traffic on a standard port (port 80).  This should resolve most 
                        firewall issues.  However, you should only utilize the tunneling option if it is necessary since the performance of the 
                        Arena will be significantly slower while the tunneling option is being utilized.</p>

                        <p><br></p>

                    </td>
                </tr>
            </table>
        </td>
        
<!-- Right Column begins -->
        <td width="" bgcolor="#001934">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
<!-- Right Column ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../includes/foot.jsp" />
<!-- Footer ends -->

</body>

</html>

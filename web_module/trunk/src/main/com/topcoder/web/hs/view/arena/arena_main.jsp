<jsp:usebean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />
<jsp:setproperty name="NavZone" property="Level0" value="arena_main" />
<jsp:setproperty name="NavZone" property="Level1" value="" />

<html>
<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<jsp:include page="../includes/top.jsp" />

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">
        <td width="170" bgcolor="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
        <jsp:include page="../includes/left_calendar.jsp" />
        </td>
        
        <td width="99%">
            <table cellspacing="0" cellpadding="10" border="0"  width="100%">
                
                <tr valign="top">
                    <td align="left" width="99%" class="statText">
                        <img src="/i/headinginside_comparena.gif" width="348" height="44" border="0">

                        <p><font size="3">The Practice Rooms in the TopCoder High School Competition Arena are open to TopCoder High School members. As a 
                        member you can access the problems, code a solution, and submit the  solution to see the possible point value. In addition, 
                        you can view the submissions of participating members from previous match dates.</font></p>
                        
                        <p><strong>Note:</strong> Any use of the TopCoder High School Competition Arena, including the Practice Room, is 
                        limited to personal, non-commercial or educational purposes only.</p>
                        
                        <table align="right" width="240" cellpadding="0" cellspacing="10" border="0">
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="5" cellspacing="0" class="insetFrame">
                                        <tr><td class="moduleTitle" colspan="2">Requirements:</td></tr>
                            
                                        <tr><td class="moduleSubhead" colspan="2">You must have:</td></tr>
                                        
                                        <tr valign="top">
                                            <td class="moduleText" width="1">&middot;</td>
                                            <td class="moduleText" width="99%">knowledge of the Java or C++ or C# programming languages</td>
                                        </tr>
                                        
                                        <tr><td class="moduleSubhead" colspan="2">Your computer must have:</td></tr>
                                        
                                        <tr valign="top">
                                            <td class="moduleText" width="1">&middot;</td>
                                            <td class="moduleText" width="99%">Netscape 4+ or Internet Explorer 4+ with Sun's Java plug-in capabilities</td>
                                        </tr>
                                        
                                        <tr valign="top">
                                            <td class="moduleText" width="1">&middot;</td>
                                            <td class="moduleText" width="99%">Internet connection that allows outbound TCP connections to highschool.topcoder.com on ports 5001-5010. </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                            
                        <p>Practicing before a competition allows you to...
                                    
                        <ul>
                            <li>Become familiar with the competition arena before competing in a live contest.<br><br>
                            This applet will provide the same interface as an actual contest, and give you a chance to code some practice problems.</li>
                                   
                            <li>Code solutions, view other coders' solutions and challenge the solutions of other coders. Normally, these are two separate 
                            phases of a competition, and of course, we would not allow you to view a competitor's code while the coding phase is active.<br><br></li>
                                        
                            <li>System Test your solutions just as they would be in a Single Round Match.</li>
                        </ul>
                                    
                        <p><a href="Javascript:openWin('?module=Static&d1=arena&d2=quick_launch','comp',310,274);" class="statText"><strong><font size="3">Ready to practice?</font></strong></a><br>
                        Click the button below to launch the TopCoder High School Competition Arena. To enter the practice
                        area once you log in, select "Practice Room" from the "Active Contests" menu.</p>

                        <p>Click the button below to launch the Arena.</p>
                                    
                        <p><a class="rednav" href="Javascript:openWin('?module=Static&d1=arena&d2=quick_launch','comp',300,225);"><img border="0" height="30" width="200" alt="Download Arena Applet" src="/i/download_applet_hs.gif"></a></p>
                                    
                        <p><br></p>
                        
                    </td>
                </tr>
            </table>
        </td>

        <td width="200">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>
</html>

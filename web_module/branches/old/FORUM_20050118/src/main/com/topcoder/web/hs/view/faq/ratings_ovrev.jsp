<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" />
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
                <tr><td width="100%" bgcolor="#001934"><img src="/i/hs/headinginside_faq.gif" width="348" height="44" alt="Support" border="0"></td></tr>
                
                <tr valign="top">
                    <td width="100%" class="bodyText">
                        <h3>How Ratings Work</h3><a name="top"></a>
                        
                        <table cellspacing="0" cellpadding="0" border="0">
                            <tr valign="top">
                                <td>
                                    <table width="100" cellpadding="5" cellspacing="0" bgcolor="001935" border="0">
                                        <tr><td class="statTextLarge" background="/i/hs/steel_bluebv_bg.gif" align="left">Rating Key</td></tr>
                                        
                                        <tr><td align="left" class="coderTextRed">2200+</td></tr>
                                        
                                        <tr><td align="left" class="coderTextYellow">1500 - 2199</td></tr>
                                        
                                        <tr><td align="left" class="coderTextBlue">1200 - 1499</td></tr>
                                        
                                        <tr><td align="left" class="coderTextGreen">900 - 1199</td></tr>
                                        
                                        <tr><td align="left" class="bodyText"><font color="#CCCCCC">0 - 899</font></td></tr>
                                        
                                        <tr><td class="smallText" bgcolor="#FFFFFF">A coder's handle is color-coded depending on their rating within the Competition Arena.</td></tr>
                                    </table>
                                </td>
                                
                                <td><img border="0" src="/i/hs/clear.gif" width="10" height="1" alt=""></td>

                                <td valign="top">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                            <td class="bodyText">
                                                <p>The following statistics are kept about each coder:</p>
                                                <ul>
                                                    <li>Rating</li>
                                                    <li>Volatility</li>
                                                    <li>Number of times previously rated</li>
                                                </ul>
                                                
                                                <p>Before competing, new members ratings are provisional.</p>
                                                
                                                <p>After a competition the algorithm below is applied to the competitors. First, the ratings of members who have previously 
                                                competed are calculated, with new members' performances not considered. Second, new members are given a rating based on 
                                                their performance relative to everyone in the competition.</p>
                                                
                                                <p><a href="?module=Static&d1=faq&d2=ratings_cal">How ratings are calculated</a></p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <p><br></p>

                    </td>
                </tr>
            </table>
        </td>
        
        <td width="" bgcolor="#001934" valign="top">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>

    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>

<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript">
function openWin(url, name, w, h) {
    win = window.open(url, 'photowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

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
        <td valign="top" width="99%">
            <table cellspacing="0" cellpadding="20" border="0" width="100%">
                <tr valign="top">
                    <td height="100%" class="statTextBig">

                        <div align="center">
                        
                        <jsp:include page="../includes/tchs03_head_tourney.jsp" />

                        <jsp:include page="../includes/tchs03_tabs.jsp" >
                            <jsp:param name="isSummaryPage" value="true"/>
                        </jsp:include>

                        <jsp:include page="../includes/tchs03_summary_subnav.jsp" >
                            <jsp:param name="isPhotosPage" value="true"/>
                        </jsp:include>

                        </div>
                    </td>
                </tr>
            </table>

            <div align="center">
            
            <table border="0" cellspacing="0" cellpadding="0">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>          
            
                <tr><td class="statText" colspan="3"><img src="/i/tournament/tchs03/team_woodbridge_amity.jpg" alt="Woodbridge - Amity" width="500" height="342" class="photoFrameBig"></td></tr>
                
                <tr>
                    <td class="statText">
                        <a href="Javascript:openWin('/i/tournament/tchs03/woodbridge_lazira.jpg','photowin',350,350);" class="statText"><img src="/i/tournament/tchs03/woodbridge_lazira.jpg" alt="" width="120" height="120" class="photoFrameSmall" /></a>
                        <a href="Javascript:openWin('/i/tournament/tchs03/woodbridge_nathanbp.jpg','photowin',350,350);" class="statText"><img src="/i/tournament/tchs03/woodbridge_nathanbp.jpg" alt="" width="120" height="120" class="photoFrameSmall" /></a>
                        <a href="Javascript:openWin('/i/tournament/tchs03/woodbridge_PolaristarII.jpg','photowin',350,350);" class="statText"><img src="/i/tournament/tchs03/woodbridge_PolaristarII.jpg" alt="" width="120" height="120" class="photoFrameSmall" /></a>
                    </td>
                </tr>
            </table>

            </div>
            
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
            </table>

            <p><br/></p>
        
        </td>
        
        <td width="" bgcolor="#001934">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>

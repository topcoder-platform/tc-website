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
        <td valign="top" width="99%">
            <table cellspacing="0" cellpadding="20" border="0" width="100%">
                <tr valign="top">
                    <td height="100%" align="center" class="statTextBig">

                        <div align="center">
                        
                        <jsp:include page="../includes/tchs03_head_tourney.jsp" />

                        <jsp:include page="../includes/tchs03_tabs.jsp" >
                            <jsp:param name="isSchoolsPage" value="true"/>
                        </jsp:include>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr><td width="100%" class="tourney_subnav"><img src="/i/hs/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
                        </table>

                        <jsp:include page="../includes/tchs03_participants.jsp" />
                        
                        </div>
                        
                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
        
        <td width="" bgcolor="#001934">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>

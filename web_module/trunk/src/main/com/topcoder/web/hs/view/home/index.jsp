<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities.">
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++">

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<jsp:include page="../includes/top.jsp" >
  <jsp:param name="isHomePage" value="true"/>
</jsp:include>

<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001934" width="100%">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="170" bgcolor="#001934">
            <jsp:include page="../includes/left_nav.jsp" />
            <jsp:include page="../includes/left_calendar.jsp" />
        </td>
<!-- Left Column ends -->
        
<!-- Center Column begins -->
        <td valign="top" width="99%">
            <table cellspacing="0" cellpadding="10" border="0" width="100%">
                <tr valign="top">
                    <td height="100%" align="center" class="statTextBig">

                        <div align="center">
                        
                        <jsp:include page="../includes/tchs03_head_home.jsp" />

                        <jsp:include page="../includes/tchs03_tabs.jsp" >
                            <jsp:param name="isSchoolsPage" value="true"/>
                        </jsp:include>

                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr><td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
                        </table>

                        <jsp:include page="../includes/tchs03_participants.jsp" />
                        
                        </div>
                        
                    </td>
                </tr>
            </table>

            <p><br></p> 
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="200" bgcolor="#001934">

            <jsp:include page="../includes/sponsor_right.jsp" /><br>
            <img src="/i/cas_quote_home.gif" width="200" height="240" alt="The Connecticut Association of Schools" border="0"><br>
            <jsp:include page="../includes/right_resources.jsp" /><br><br>
        </td>
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="joinus"/>
                    <jsp:param name="tabLev3" value="devforums"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Developer Forums</span></h1>
                        <p>
                        Are you attending the TCO finals as a spectator or finalist? Either way, be sure to attend the Developer Forums. This year's TCO features two rewarding topics:
                        </p>
                        <h3>Wednesday, June 27</h3>
                        <p>
                        <b>10:00AM - 11:00AM  :  Security in Group Developed Software</b><br>
                        One critical challenge IT management faces as it adapts to an
                        increasingly global workforce is how to protect its company's
                        proprietary information from being copied or exploited.  As system
                        information is distributed across a global workforce, it becomes much
                        more difficult to manage and secure this proprietary intellectual
                        property.</p>

                        <p>The apparent risk this poses to a company's most sensitive systems has
                        created a perception of risk, causing many traditional IT organizations
                        to avoid a strategy using a distributed global workforce for anything
                        beyond run rate development. This hesitation prevents IT organizations
                        from fully benefiting from the proven advantages of globalization.</p>

                        <p>This discussion will explore how the TopCoder Software Development
                        Methodology protects sensitive client information at each phase of its
                        unique software engineering process.</p>

                        <h3>Wednesday, June 27</h3>
                        <p>
                        <b>2:00PM - 3:00PM  :  The Power of Communities -- And Its Future</b><br>
                        Communities can hold enormous power and exert significant influence -
                        far more so than any one individual - IF, managed and channeled
                        correctly.  We will examine the concept, and reality, of Community Power
                        - looking at the sources and structures that influence the creation and
                        growth of communities, strengths and weaknesses of communities, how to
                        manage/channel this community power towards producing value, and the
                        future of communities.  And wrap this around, of course, how companies
                        will, and currently do, benefit from the every expanding power and
                        influence of the TopCoder community. 
                        </p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>

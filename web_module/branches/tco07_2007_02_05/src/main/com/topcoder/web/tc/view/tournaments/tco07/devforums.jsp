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

                        <h1><div>Developer Forums</div></h1>
                        <p>
                        <b>**NEED NEW CONTENT**</b> <br>
                        Are you attending the TCO finals as a spectator or finalist? Either way, be sure to attend the Developer Forums. This year's TCO features three rewarding topics:
                        </p>
                        <h3>Wednesday, November 15</h3>
                        <p>
                        <b>3:00PM - 4:00PM  :  Applying the TopCoder Philosophy to New Frontiers</b><br>
                        Two TopCoder clients have utilized the core TopCoder philosophies -- 
                        competition-based business models and objective rating systems - as a 
                        means of assessing performance and reducing risk. In the first part of 
                        the forum, Aizling will discuss how the company based its revolutionary 
                        approach to nursing and the healthcare industry on a competition model, 
                        feedback system, and shift matching logic. Next up will be Equitrader, 
                        which will review its simulated trading competitions, its rating system, 
                        and new technology that enables members to create autonomous trading bots. 
                        How does the TopCoder approach apply to staffing a medical facility or 
                        trading stocks? Join in the discussion, and find out!
                        </p>
                        <h3>Thursday, November 16</h3>
                        <p>
                        <b>3:00PM - 4:00PM  :  Estimating Project Size</b><br>
                        How long will this take? How much money will it cost? These two simple 
                        questions can be infuriatingly difficult to answer, especially when it comes 
                        to an enterprise software project. But there's hope, thanks to the "Use 
                        Case Points" methodology. Use Case Points can help evaluate a project's 
                        scope - based on the Use Cases and Actors outlined in the Use Case model - 
                        as well as a project's complexity. This forum will discuss the features of 
                        the Use Case Points approach, and highlight how it has been applied to 
                        TopCoder projects.
                        </p>
                        <h3>Friday, November 17</h3>
                        <p>
                        <b>1:00PM - 2:00PM  :  Overview of Recent TopCoder Projects</b><br>
                        New clients and projects have expanded TopCoder's presence in a variety 
                        of market spaces, from energy and insurance to finance, healthcare, media, 
                        and retail. TopCoder has built a variety of applications - including data 
                        warehousing, internal, integration, and mobile device systems - using new 
                        and emerging technologies like J2ME, RFID, and AJAX. For each project, 
                        TopCoder has applied its software development methodology to build 
                        reliable, scalable solutions - and, by leveraging TopCoder's component 
                        library, these projects have been completed for less money and with fewer 
                        bugs. In this forum, learn more about the diverse array of projects 
                        TopCoder is tackling, and what we've learned by applying our methods 
                        to a wide range of industries.
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

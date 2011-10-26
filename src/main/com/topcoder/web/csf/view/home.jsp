<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="home"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Competition Guide</span>
            </div>

            <div style="float: right; margin: 0px 0px 10px 10px;">
                <%--<map name="highlights">
                <area shape="rect" alt="" coords="1,1,199,95" href="/?module=Static&d1=leaderboardOverview" />
                <area shape="rect" alt="" coords="1,105,199,195" href="/?module=Static&d1=assembly&d2=pastContests" />
                <area shape="rect" alt="" coords="1,205,199,295" href="/?module=Static&d1=assembly&d2=pastContests" />
                <area shape="rect" alt="" coords="1,305,199,399" href="/?module=ViewContestDetails&ct=1007" />
                </map>
                <img src="/i/home/highlights0921.png" alt="Series Prizes" usemap="#highlights" />--%>
                <a href="/forums?module=Thread&threadID=123&start=0"><img src="/i/home/highlights1102.png" alt="Series Prizes" usemap="#highlights" /></a>
            </div>

            <p>
                Microsoft and British Telecom, in association with TopCoder, will run a series of Connected Services
                Sandbox Mashup Service Design and Assembly competitions. In these competitions, developers from Sandbox
                member organizations, as well as freelance application developers, can collaborate and compete to
                generate new mashup service designs and then build functional prototypes of those designs.
            </p>

            <p>
                Through this series of competitions, Sandbox members can take advantage of a "no-shore" pool of creative
                talent to design and assemble working prototypes of services which could result in commercialized
                deployments in service provider networks .
            </p>

            <c:if test="${sessionInfo.anonymous}">
                    <p align="center">
                        <span class="bigRed">Click <A class="bigRed" href="<tc-webtag:linkTracking link="http://www.networkmashups.com/" refer="csf_home"/>">here</A> to register and learn more!</span>
                    </p>
            </c:if>

            <h2>Competition Series Goals &amp; Objectives</h2>
            <ul>
                <li>Fuel the creative development process and encourage collaboration among the wide range of Connected
                    Services Sandbox participants and freelance application developers.
                </li>
                <li>Develop an experienced pool of resources able to meet the growing demand for new service development
                    using the Connected Services Framework.
                </li>
                <li>Excite customers by providing resources that can reduce time from concept to market.</li>
                <li>Deliver a broad range of new services that will help consumers to tie together office, home and
                    mobile data to meet the growing demand for information regardless of location, device or platform.
                </li>
            </ul>
            <h2>Competition Structure and Format</h2>

            <p>
                The competitions will be divided into multiple usage scenarios defined by Microsoft and British Telecom.
                These scenarios will provide the criteria for the competitions.
            </p>

            <p>
                <strong>Two Stage Competitions:</strong>
            </p>

            <p><strong><%--<a href="/?module=ViewActiveContests">--%>Creative Mashup Design
                Competitions:<%--</a>--%></strong> The Creative Mashup Design Competitions represent the first stage of
                the contests, and consist of creating a textual or graphical representation of the proposed solution
                (specification, process diagram, flow chart) that will satisfy the criteria specified for the given
                usage scenario. The scope and rules for the competitions will be defined by Microsoft and British
                Telecom.</p>

            <p><strong><%--<a href="/?module=Static&d1=assembly&d2=activeContests">--%>Assembly Competitions:<%--</a>--%></strong> The Assembly Competition is the
                second stage and requires that the winning Mashup Design from the first stage of the competition be
                built into a prototype that delivers a demonstrable service. The Connected Services Framework Mashup
                Service Design and Assembly Competitions are not intended to produce commercial, carrier-grade software,
                but a working prototype or proof-of-concept service which could then be scaled for commercial use.</p>

            <h2>Scoring the Competition</h2>

            <p>
                At the end of each stage of the competitions, the submissions will be reviewed by a panel of Microsoft
                customers, Microsoft engineers and a selection of participants in the Sandbox. The judging criteria will
                be defined by Microsoft and British Telecom. Winners will be identified, announced and rewarded through
                both monetary prizes and non-monetary promotional programs.
            </p>

            <p><strong>Welcome to the Connected Services Sandbox. We hope you will find these competitions both
                challenging and rewarding.</strong></p>


        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>
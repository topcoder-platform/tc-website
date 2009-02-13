<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="description"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Component Design and Development Competition</span></h1>
                
                <h2>Component Design</h2>
                <p>TopCoder Design Competitions require participants to design a software component.  Starting from a requirements specification, they produce a full set of design documentation: UML class, sequence, and use case diagrams, and a component specification document, which contains algorithm descriptions, exception handling, and documentation.</p>
                <p>Each competitor's submission goes through a review process that includes an initial screening and, if the submission passes screening, a full review by a three person Review Board.  The competitors have a chance to appeal their review scores and, once all appeals are answered, the winner of the competition is announced.  After the winner fixes any remaining problems with their submission, the competition ends and the design is prepared to become the basis for a future development competition.</p>
                <p>All design and review work of the TopCoder Collegiate Challenge Design Finals will take place online.  At the onsite event, the competitors will first see their review scorecards and the appeals phase will take place.</p>
                
                <h2>Component Development</h2>
                <p>TopCoder Development Competitions require participants to implement a previously designed software component.  Their starting point is the winning design submission that includes UML class, sequence, and use case diagrams, and a component specification document which contains algorithm descriptions, exception handling, and documentation.  They are required to provide a full implementation of the design, as well as a full suite of unit tests for their implementation and documentation.</p>
                <p>Each competitor's submission goes through a review process that includes an initial screening and, if the submission passes screening, a full review by a three person Review Board.  The competitors have a chance to appeal their review scores and, once all appeals are answered, the winner of the competition is announced.  After the winner fixes any remaining problems with their submission, the competition ends and the implementation becomes a part of the TopCoder software catalog.</p>
                <p>All implementation and review work of the TopCoder Collegiate Challenge Development Finals will take place online.  At the onsite event, the competitors will first see their review scorecards and the appeals phase will take place.</p>
                <p>When is the competition?  See the schedule <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule" alt="TCCC07 Component Schedule">here</a>.</p>
                <p>It is important for you to read the official <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=rules" alt="TCCC07 Component Rules &amp; Regulations">rules and regulations</a> for more details.</p>
                <p>The competition is free and you must be an 18 years or older collegiate member, as well as meet all eligibility criteria, in order to participate.</p>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>
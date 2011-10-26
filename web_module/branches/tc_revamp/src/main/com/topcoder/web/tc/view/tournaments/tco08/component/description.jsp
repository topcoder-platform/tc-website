<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="description"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Component Design and Development Competition</h2>
        
        <div class="sub_content">
        
            <h3>Component Design</h3>
            <p>TopCoder Design Competitions require participants to design a software component. Starting from a requirements specification, they produce a full set of design documentation: UML class, sequence, and use case diagrams, and a component specification document, which contains algorithm descriptions, exception handling, and documentation.</p>
            <p>Each competitor's submission goes through a review process that includes an initial screening and, if the submission passes screening, a full review by a three person Review Board. The competitors have a chance to appeal their review scores and, once all appeals are answered, the winner of the competition is announced. After the winner fixes any remaining problems with their submission, the competition ends and the design is prepared to become the basis for a future development competition.</p>
            <p>At the onsite finals of the TopCoder Open, the finalists will be tasked with designing a small widget that will be showcased in its finished form on Thursday, May 15 during the Awards Ceremony.</p>
            
            <h3>Component Development</h3>
            <p>TopCoder Development Competitions require participants to implement a previously designed software component. Their starting point is the winning design submission that includes UML class, sequence, and use case diagrams, and a component specification document which contains algorithm descriptions, exception handling, and documentation. They are required to provide a full implementation of the design, as well as a full suite of unit tests for their implementation and documentation.</p>
            <p>Each competitor's submission goes through a review process that includes an initial screening and, if the submission passes screening, a full review by a three person Review Board. The competitors have a chance to appeal their review scores and, once all appeals are answered, the winner of the competition is announced. After the winner fixes any remaining problems with their submission, the competition ends and the implementation becomes a part of the TopCoder software catalog.</p>
            <p>At the onsite finals of the TopCoder Open, the finalists will be tasked with implementing a small widget based on the winners from the Design and Studio competitions.  The widget will be showcased in its finished form on Thursday, May 15 during the Awards Ceremony.</p>
            <p>When is the competition? See the schedule <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=schedule">here</a>.</p>
            <p>It is important for you to read the official <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=rules">rules and regulations</a> for more details.</p>
            <p>The competition is free and you must be a member who is 18 years or older, as well as meet all eligibility criteria, in order to participate.</p>
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>

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
        <jsp:param name="tabLev2" value="design"/>
        <jsp:param name="tabLev3" value="summary"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Component Design Summary</span></h1>
                    <div style="float:right;">
                        <A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=518024">Discuss this</A><br />
                    </div>

                    <p>Thursday, November 1, 2007<br />
                    by <span><strong>the Design Review Board</strong></span><br />
                    <span><em>TopCoder Members</em></span></p>

                    <%-- Round 1 --%>
                    <p>Wednesday, October 31, 2007<br />
                    <span style="font-size:14px;"><strong>Round 1</strong></span><br />
                    by <tc-webtag:handle coderId="277356" context="design" darkBG="true" /></p>
                    
                    <p>Probably all of us are familiar with Graph theory and have implemented various graph algorithms to solve problems. Depending on the problem space, it may be necessary to represent graphs in memory in a variety of different ways.  The Graph Framework component provides a standard interface for representing graphs regardless of internal memory representation.</p>
                    <p>The component will provide two representations for graphs, one suitable for dense graphs and one suitable for sparse graphs. The Graph Framework should also provide numerous common graph functionalities, such as modeling both directed and undirected graphs, with or without cycles, CRUD operations with edges and vertices, event listener framework, etc.</p>
                    <p>It seems to be an exciting component for designers - the designer should not know some specific IT technology (such as ASP.NET, servlets, JSP, etc.) and maximum freedom for creativity is given to implement the requirements. Many requirements make the design really untrivial - the designers should have good knowledge of various design patterns to implement the required functionality and make usage of this component really easy.  Competitors had to find the golden mean between simplicity of API and the component flexibility.</p>
                    <p>Probably the most challenging parts of the component were the ability to find out what kind of graph a Graph object is (directed, undirected, acyclic, multigraph, etc.) in an efficient way and making such property settable.  The designer has to implement flexible validation support for invalid operations and powerful transformation mechanisms from one kind of graph to another one.</p> 
                    <p>Another non-trivial task was to make the graph really independent from its representation but make easy extending of both graph operations and graph representation possible. Some designers implement Bridge Design pattern to solve this task effectively.</p>
                    <br />
                    
                    <%-- Round 2 --%>
                    <p>Thursday, November 1, 2007<br />
                    <span style="font-size:14px;"><strong>Round 2</strong></span><br />
                    by <tc-webtag:handle coderId="152342" context="design" darkBG="true" /></p>
                    
                    <p>The Scrollable Data Bound Table component is a custom table component with a scrollbar. It uses AJAX to pass the data when it becomes necessary as the user slides the scroll bar up and down, and caches it on the client side to keep the network traffic down to the minimum required.</p>
                    <p>Building a design for this component was relatively straightforward, as the web technologies that must be used place strict boundaries for the design. Understanding these technologies was crucial to submitting a working design, though. This proved too challenging for the majority of the competitors: the component got only three submissions that passed the review.</p>
                    <p>When the requirements call for a compact design like this, the designers get fewer chances to forget a requirement, miss a relationship on a diagram, or make a mistake in an algorithm description. They also get more time to document their classes and methods well. As the result, the submitters are forced to compete on fine points of understanding the TopCoder Design Methodology and showcasing their submissions to the users (and of course to the Review Board). The winning submissions in both Java and .NET were high-quality designs with great documentation for developers, earning their authors impressive scores in the upper nineties.</p>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>
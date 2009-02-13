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

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="description"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Component Design and Development Competition</span></h1>
                        <p>
                        <h2>Component Design</h2>
                        <p>
                        TopCoder Design Competitions require participants to design a software component.  Starting from a requirements specification, they produce a full set of design documentation: UML class, sequence, and use case diagrams, and a component specification document which contains algorithm descriptions, exception handling, and documentation.
                        </p>
                        <p>
                        Each competitor's submission goes through a review process that includes an initial screening and, if the submission passes screening, a full review by a three person Review Board.  The competitors have a chance to appeal their review scores and once all appeals are answered the winner of the competition is announced.  After the winner fixes any remaining problems with their submission, the competition ends and the design is prepared to become the basis for a future development competition.
                        </p>
                        <p>
                        All design and review work of the TopCoder Open Design Finals will take place online.  At the onsite event, the competitors will first see their review scorecards and the appeals phase will take place.
                        </p>
                        <p>
                        <h2>Component Development</h2>
                        <p>
                        TopCoder Development Competitions require participants to implement a previously designed software component.  Their starting point is the winning design submission that includes UML class, sequence, and use case diagrams, and a component specification document which contains algorithm descriptions, exception handling, and documentation.  They are required to provide a full implementation of the design, as well as a full suite of unit tests for their implementation and documentation.
                        </p>
                        <p>
                        Each competitor's submission goes through a review process that includes an initial screening and, if the submission passes screening, a full review by a three person Review Board.  The competitors have a chance to appeal their review scores and once all appeals are answered the winner of the competition is announced.  After the winner fixes any remaining problems with their submission, the competition ends and the implementation becomes a part of the TopCoder software catalog.
                        </p>
                        <p>
                        All implementation and review work of the TopCoder Open Development Finals will take place online.  At the onsite event, the competitors will first see their review scorecards and the appeals phase will take place.
                        </p>
                        <p>
                        When is the competition?  See the <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=schedule">schedule</a>.
                        </p>
                        <p>
                        It is important for you to read the official <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=rules">rules and regulations</a> for more details.  
                        </p>
                        <p>
                        The competition is free and you must be 18 years or older, as well as meet all eligibility criteria, in order to participate.
                        </p>
<%--
                        <h2>How to Register for the Component Competition</h2>
                        <p>
                        <strong>Already a TopCoder Member?</strong><br>
                        Click <A href="/tc?module=TCO07ViewRegistration&amp;ct=component">here</A> to register for the TCO07 Component Competition.
                        </p>
                        <p>
                        <strong>Not Yet a TopCoder Member?</strong><br>
                        Click <A href="/reg/">here</A> to register as a TopCoder member.<br>
                        Check your email and activate your new TopCoder account.<br>
                        Click <A href="/tc?module=TCO07ViewRegistration&amp;ct=component">here</A> to register for the TCO07 Component Competition
                        </p>
--%>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>

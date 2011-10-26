<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="eventpatrons"/>
                    <jsp:param name="tabLev3" value="nsa"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="margin-bottom: 20px;"><a target="_blank" href="<tc-webtag:linkTracking link='http://www.nsa.gov' refer='TCO07_NSA_PAGES' />"><img src="/i/tournament/tco07/nsa_logo.png" alt="NSA" border="0" /></a></div>

                        <h2>Where Intelligence Goes to Work</h2>
                        <p>
                        Everyday, the National Security Agency is faced with new threats to our nation's security. Our adversaries do their best to keep their plans a secret. We work to uncover those secrets, and keep our own secrets safe. That is why it is vital for NSA to employ the most intelligent people in the country.
                        </p>
                        <p>
                        At the nation's top cryptologic organization, you can work with the best and the brightest, using your intelligence to solve some of the nation's most difficult challenges. Your solutions can play a major role in shaping the course of world history.
                        </p>
                        <p>
                        NSA has exciting career opportunities available in Computer/Electrical Engineering, Computer Science, Mathematics, Foreign Language, Intelligence Analysis, Cryptanalysis, and Signals Analysis. You'll enjoy an incredible benefits package, competitive pay, and the satisfaction of making the world a safer place.
                        </p>
                        <p>
                         U.S. citizenship is required. NSA is an Equal Opportunity Employer.<br>
                         For more information about the career opportunities available at NSA:
                         </p>
                         <p><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsaConfirm" class="button" style="width: 70px;">Apply Now</a></p>                       
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>

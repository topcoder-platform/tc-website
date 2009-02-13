<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
    <jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="long_compete"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Contest Details"/>
    </jsp:include>

<div align="center">
<table style="margin-top: 20px; margin-bottom: 20px;" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td style="padding: 0px 5px 10px 0px;" align="center" width="50%">
            <a class="bigButton" style="width: 100px;" href="">Register</a>
            <%--<div class="bigButton" style="width: 100px;">Register</div>--%>
        </td>
        <td style="padding: 0px 0px 10px 5px;" align="center" width="50%">
            <%--<a class="bigButton" style="width: 100px;" href="">Submit</a>--%>
            <div class="bigButton" style="width: 100px;">Submit</div>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 10px;" align="center">
            Register to get info necessary to submit a solution<br />
        </td>
    </tr>
</tbody>
</table>
</div>

<div class="sectionHeader">Competition Overview</div>

<p>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer justo dui, pharetra sed, ornare a, luctus sed, lacus. Vivamus nonummy. Ut bibendum nisi quis lacus. Nunc eu lacus sit amet urna vehicula vestibulum. Maecenas laoreet nunc. Nulla facilisi. Proin sem. Praesent nisl arcu, lobortis non, molestie nec, gravida ac, ipsum. Aenean ornare nibh a nulla. Fusce dignissim, sem pulvinar adipiscing faucibus, pede dui laoreet ligula, in hendrerit nunc lorem id dui. Maecenas ante.
</p>
<p>
Morbi ut nibh vel justo placerat posuere. Etiam ac sem a elit posuere gravida. Curabitur commodo nulla vitae massa. Fusce tincidunt tincidunt arcu. Proin interdum consequat diam. Pellentesque metus nisl, consectetuer quis, viverra non, imperdiet at, nibh. Maecenas imperdiet, arcu sit amet condimentum viverra, tortor elit ornare urna, eu interdum nulla nulla quis augue. Nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse potenti. Nam a sem et ante pulvinar sollicitudin.
</p>
<p>
Nulla metus. Nullam malesuada quam. Curabitur convallis aliquet dui. Nulla augue nulla, elementum nec, commodo eget, vulputate et, diam. Vivamus commodo, dui sed mollis rhoncus, augue est hendrerit sapien, et scelerisque augue enim at sem. Morbi vel sem sed nisl facilisis tincidunt. Vestibulum nec est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce ut mi. Mauris sollicitudin lacinia velit. Curabitur sed arcu. Vivamus ipsum. Ut ullamcorper felis hendrerit pede. Cras felis eros, convallis non, pretium ac, interdum id, dui. Praesent hendrerit consectetuer massa. Vestibulum laoreet. Donec sollicitudin vehicula turpis. Quisque eget nisi et dolor porta ultricies.
</p>

<div class="sectionHeader">Prizes</div>

<p>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer justo dui, pharetra sed, ornare a, luctus sed, lacus. Vivamus nonummy. Ut bibendum nisi quis lacus. Nunc eu lacus sit amet urna vehicula vestibulum. Maecenas laoreet nunc. Nulla facilisi. Proin sem. Praesent nisl arcu, lobortis non, molestie nec, gravida ac, ipsum. Aenean ornare nibh a nulla. Fusce dignissim, sem pulvinar adipiscing faucibus, pede dui laoreet ligula, in hendrerit nunc lorem id dui. Maecenas ante.
</p>

<div class="sectionHeader">Timeline</div>

<div align="center" style="margin: 20px;">
<table cellpadding="0" cellspacing="0" style="width: 180px;">
<tbody>
    <tr>
        <td align="center" colspan="2" style="border-bottom: 1px solid #999999;">
            <strong>Registration & Submission</strong>
        </td>
    </tr>
    <tr>
        <td width="100%">
            <strong>Opens:</strong>
        </td>
        <td align="center" nowrap="nowrap">
            <strong>06.06.2007</strong><br />12:00 NOON EDT
        </td>
    </tr>
    <tr>
        <td>
            <strong>Closes:</strong>
        </td>
        <td align="center" nowrap="nowrap">
            <strong>07.06.2007</strong><br />12:00 NOON EDT
        </td>
    </tr>
</tbody>
</table>
</div>

<div class="sectionHeader">Conditions of Participation</div>

<p>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer justo dui, pharetra sed, ornare a, luctus sed, lacus. Vivamus nonummy. Ut bibendum nisi quis lacus. Nunc eu lacus sit amet urna vehicula vestibulum. Maecenas laoreet nunc. Nulla facilisi. Proin sem. Praesent nisl arcu, lobortis non, molestie nec, gravida ac, ipsum. Aenean ornare nibh a nulla. Fusce dignissim, sem pulvinar adipiscing faucibus, pede dui laoreet ligula, in hendrerit nunc lorem id dui. Maecenas ante.
</p>
<p>
Morbi ut nibh vel justo placerat posuere. Etiam ac sem a elit posuere gravida. Curabitur commodo nulla vitae massa. Fusce tincidunt tincidunt arcu. Proin interdum consequat diam. Pellentesque metus nisl, consectetuer quis, viverra non, imperdiet at, nibh. Maecenas imperdiet, arcu sit amet condimentum viverra, tortor elit ornare urna, eu interdum nulla nulla quis augue. Nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse potenti. Nam a sem et ante pulvinar sollicitudin.
</p>
<p>
Nulla metus. Nullam malesuada quam. Curabitur convallis aliquet dui. Nulla augue nulla, elementum nec, commodo eget, vulputate et, diam. Vivamus commodo, dui sed mollis rhoncus, augue est hendrerit sapien, et scelerisque augue enim at sem. Morbi vel sem sed nisl facilisis tincidunt. Vestibulum nec est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce ut mi. Mauris sollicitudin lacinia velit. Curabitur sed arcu. Vivamus ipsum. Ut ullamcorper felis hendrerit pede. Cras felis eros, convallis non, pretium ac, interdum id, dui. Praesent hendrerit consectetuer massa. Vestibulum laoreet. Donec sollicitudin vehicula turpis. Quisque eget nisi et dolor porta ultricies.
</p>

<div class="sectionHeader">Eligibility</div>

<p>
The competition is open to all members who are at least 13 years of age.
</p>
<p>
All competitors must be registered members of TopCoder, and must have agreed to the rules on this page prior to participating in this competition.
</p>
<p>
Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors), implementation and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the competition and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the competition. 
</p>

<div class="sectionHeader">Competition Structure</div>
<p>
Each Marathon Match will contain a single problem.  The problem statement will indicate both the question presented to the contestant as well as how submissions will be scored.  Contestants will submit their solution which will immediately be put on a queue for system testing.  Once system testing is complete, the competitor will be assigned a score which will be available on the website.  Each competitor may submit as many times as they choose, however they may only submit once per hour.
</p>

<div class="sectionHeader">Other</div>

<p>
The competition is void in whole or in part where prohibited by law.
</p>
<p>
A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com displayed for at least 3 months after the end of the competition.
</p>
<p>
This tournament is brought to you by TopCoder, Inc., 95 Glastonbury Blvd, Glastonbury, CT 06033.
</p>


            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="foot.jsp" />
</body>
</html>
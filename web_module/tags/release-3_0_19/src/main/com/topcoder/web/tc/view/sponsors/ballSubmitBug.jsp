<%@ page import="com.topcoder.web.tc.controller.request.util.SubmitBallBug" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
<div align="center" style="padding-bottom: 10px; border-bottom: 1px solid #999999;">
    <A href="http://www.theball.com/"><img src="/i/sponsor/theball.png" alt="The Ball" /></A>
    <br><strong>
    Report a bug
    | <A href="/tc?module=Static&d1=sponsors&d2=ballKnownBugs" class="bcLink">Known bugs</A>
    </strong>
</div>

<div style="margin-bottom: 20px;">
    <p>
    You're probably wondering, "What is the Ball?"  Actually, a better question is, "WHERE is the Ball?"  
    </p>
    <p>
    <A href="http://www.theball.com/">The Ball</A> travels from site to site across the Web, and it's your job to find it. It's like an online treasure hunt - but unlike an "X" on a treasure map, the Ball doesn't stay still!
    </p>
    <p>
    As you pursue it across the Internet, you're presented with puzzles and challenges. Solve them correctly and you receive clues to help you find the Ball, and the keys you'll need to unlock it when you do.  Find the Ball, win the cash!
    </p>
    <p>
    Right now the Ball is in beta testing.  We're launching it first to our most reliable source of thinkers and code breakers: YOU, the TopCoder community.  Before we let any random person play the game, we want to know what bugs there are and whether the game can be automated, broken or cheated.  That's where you come in.  
    </p>
    <p>
    For several weeks, starting April 4, 2007, we'll be running a bug finding contest in parallel with the Ball game itself.  Each TopCoder member who reports a novel* bug or a novel* method to automate game play will receive a share of a $1,500 prize pool.  We've provided a simple bug report form <LINK> for you to let us know when you've found a bug or a way to circumvent the intended game play. 
    </p>
    <p>
    The success of the Ball depends largely on what the TopCoder community finds.  <A href="http://www.theball.com/">Download the plug-in</A> now and start chasing the Ball!
    </p>
</div>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="mainForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitBallBug"/>


<h3 align="center">Report a bug</h3>

<table cellspacing="0" cellpadding="3" style="width: 100%; margin-bottom: 40px;">
<tbody>

    <tr>
        <td nowrap="nowrap" align="center" colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=SubmitBallBug.SYS_CONFIG%>"><span class="bigRed"><%=err%><br /></span></tc-webtag:errorIterator>
        </td>
    </tr>


    <tr>
        <td nowrap="nowrap">
            System Configuration:
        </td>
        <td>
            <tc-webtag:textArea name="<%=SubmitBallBug.SYS_CONFIG%>" rows="6" cols="40"/>
        </td>
    </tr>


    <tr>
    <td nowrap="nowrap" align="center" colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=SubmitBallBug.BUG_DESC%>"><span class="bigRed"><%=err%><br /></span></tc-webtag:errorIterator>
    </td>
</tr>

    <tr>
        <td nowrap="nowrap">
            Bug description:
        </td>
        <td>
            <tc-webtag:textArea name="<%=SubmitBallBug.BUG_DESC%>" rows="6" cols="40"/>
        </td>
    </tr>



        <tr>
        <td nowrap="nowrap" align="center" colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=SubmitBallBug.HOW_TO%>"><span class="bigRed"><%=err%><br /></span></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap">
            How to reproduce bug:
        </td>
        <td>
            <tc-webtag:textArea name="<%=SubmitBallBug.HOW_TO%>" rows="6" cols="40"/>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" align="center" colspan="2">
            <button name="submit" value="submit" type="submit" style="margin-top: 10px;">Submit</button>
        </td>
    </tr>
</tbody>
</table>
</form>

    <p class="small">
    * TopCoder reserves sole discretion to judge which bug and automation reports are "novel" for the purposes of earning a share in the prize pool, and to disqualify reports that are unduly broad, vague, or poorly characterized.
    </p>
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>
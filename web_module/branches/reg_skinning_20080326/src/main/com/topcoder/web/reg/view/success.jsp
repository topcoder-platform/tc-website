<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Registration</title>
    <jsp:include page="/script.jsp"/>
    <reg_tags:style/>
</head>

<body>

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div id="pageAligner" align="center">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>

<div id="regBcContainer">
    <div class="regBc">
        <div class="title">
            Step <strong>5</strong> of
            <c:choose>
                <c:when test="${isNewReg}">
                    <strong>6</strong>
                </c:when>
                <c:otherwise>
                    <strong>5</strong>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="off">Select Your Registration</div>

        <div class="off">General</div>

        <div class="off">Demographics</div>

        <div class="off">Confirm</div>

        <div class="on">Success</div>
        <c:if test="${isNewReg}">
            <div class="off">Activation</div>
        </c:if>
    </div>
</div>

    <c:set value="<%=RegistrationType.TC_DIRECT_ID%>" var="direct"/>
     <c:set value="<%=Constants.REG_TYPE_IDS%>" var="regTypes"/>
<div id="successMessage">
    <c:choose>
        <c:when test="${isNewReg}">

           <c:choose>
                <c:when test="${cf:contains(requestScope[regTypes], direct)}">
                    <p>
                        <strong>You're almost ready to begin using TopCoder Direct</strong>
                    </p>
                    <p>
                        You just need to activate your account to access your TopCoder Direct Cockpit.
                    </p>
                    <p>
                        You should have a message in your email inbox with a link that you need to click to activate your account.
                    </p>
                </c:when>
                <c:otherwise>
                    <p>
                        <strong>Registration successful!</strong>
                    </p>
                    <div class="error">
                        Please check your email. You <u>MUST</u> activate your account to complete registration.
                    </div>
                    <p>
                        Your activation code is being emailed to you. Follow the instructions in the email to activate your account.
                    </p>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <p>
                <strong>Profile updated!</strong>
            </p>
            <p>
                Your profile has been successfully updated
            </p>
        </c:otherwise>
    </c:choose>
</div>

<c:set value="<%=RegistrationType.COMPETITION_ID%>" var="competition"/>
<c:if test="${cf:contains(requestScope[regTypes], competition)}">
    <div class="regHead">As a Registered Competitor</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="/tc"><img src="/i/registration/competitor_howto.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%"><strong>Learn how to compete</strong><br />
                <a href="/tc?module=Static&amp;d1=help&amp;d2=index">Algorithm</a><br />
                <a href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=desGettingStarted">Software Design</a><br />
                <a href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=devGettingStarted">Software Development</a><br />
                <a href="/longcontest/?module=Static&amp;d1=instructions">Marathon Matches</a>
            </td>
        </tr>
        <tr>
            <td class="image">
                <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=description"><img src="/i/registration/the_digital_run.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%"><strong>The Digital Run</strong><br />
                Rewarding the top software designers and developers. Place well in a competition, you earn points.
                Accumulate lots of points over the course of a Stage (4 per year) or year, you win. It's that simple.
            </td>
        </tr>
    </tbody>
    </table>

</c:if>
<c:set value="<%=RegistrationType.HIGH_SCHOOL_ID%>" var="hs"/>
<c:if test="${cf:contains(requestScope[regTypes], hs)}">
    <div class="regHead">As a Registered High School Competitor</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=index"><img src="/i/registration/hs_howto.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%"><strong>How to compete</strong><br />
                Take a look at our <a href="/tc?module=Static&amp;d1=hs&amp;d2=support&amp;d3=index">How to Compete</a> guide.
            </td>
        </tr>
        <tr>
            <td class="image">
                <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index"><img src="/i/registration/hs_education.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%"><strong>Learn more</strong><br />
                Our <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index">Educational Content</a> has volumes of helpful
                information on how to be a better programmer, as well as how to be a better TopCoder competitor.
            </td>
        </tr>
    </tbody>
    </table>

</c:if>
<c:set value="<%=RegistrationType.SOFTWARE_ID%>" var="tcs"/>
<c:if test="${cf:contains(requestScope[regTypes], tcs)}">
    <div class="regHead">As a Registered TopCoder Software Customer</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/"><img src="/i/registration/tcs_info.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%">
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/about/explanationMovie.jsp">How it works</a>
                <br />
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp">Who it's working
                    for</a><br />
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Get started</a>
            </td>
        </tr>
    </tbody>
    </table>

</c:if>
<c:set value="<%=RegistrationType.CORPORATE_ID%>" var="corp"/>
<c:if test="${cf:contains(requestScope[regTypes], corp)}">
    <div class="regHead">As a Registered Corporate Services Member</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="/corp/?module=Static&amp;d1=corp&amp;d2=index"><img src="/i/registration/corporate.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%">
                <a href="/corp/?module=Static&amp;d1=corp&amp;d2=spon_prog&amp;d3=market_tourny">Sponsor an event</a><br />
                <a href="/pl/">Host your own event, Powered by TopCoder</a><br />
                <a href="/corp/?module=Static&amp;d1=corp&amp;d2=tces_home">Hire talented programmers</a>
            </td>
        </tr>
    </tbody>
    </table>

</c:if>

<c:set value="<%=RegistrationType.STUDIO_ID%>" var="studio"/>
<c:if test="${cf:contains(requestScope[regTypes], studio)}">
    <div class="regHead">As a Registered TopCoder Studio Member</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="http://studio.topcoder.com/?module=ViewActiveContests"><img src="/i/registration/studio.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%">
                As a TopCoder Studio member you now have access to submit creative work for any of the
                <a href="http://studio.topcoder.com/?module=ViewActiveContests">active contests</a>. Don't forget that
                you can also browse around the <a href="http://studio.topcoder.com/forums">TopCoder Studio forums</a>
                for interesting and helpful info from the community.
            </td>
        </tr>
    </tbody>
    </table>

</c:if>


<c:set value="<%=RegistrationType.TEACHER_ID%>" var="teacher"/>
<c:if test="${cf:contains(requestScope[regTypes], teacher)}">
    <div class="regHead">As a Registered Professor</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="/education/?module=Static&amp;d1=introduction"><img src="/i/registration/professor.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%">
                After you become an autorized professor by <a href="/education/?module=Static&amp;d1=introduction">contacting a TopCoder rep</a>, you can immediately start using the Educational Platform in all your classes.
            </td>
        </tr>
    </tbody>
    </table>

</c:if>

<c:set value="<%=RegistrationType.OPENAIM_ID%>" var="openAIM"/>
<c:if test="${cf:contains(requestScope[regTypes], openAIM)}">
    <div class="regHead">As an Open AIM Developer Challenge Competitor</div>
    <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
    <tbody>
        <tr>
            <td class="image">
                <a href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/"><img src="/i/registration/openaim.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
            </td>
            <td class="text" width="100%">
                Thousands of dollars (and hundreds of t-shirts) await the developers who can most <a href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/">creatively use the AOL Instant Messenger APIs</a> in an original application.</td>
        </tr>
    </tbody>
    </table>

</c:if>

    <%-- don't show this part if it's a new registration for tc direct--%>
    <c:if test="${(isNewReg and not cf:contains(requestScope[regTypes], direct)) or not isNewReg}">
        <div class="regHead">As a Registered TopCoder Member</div>
        <table cellpadding="0" cellspacing="0" border="0" class="whatToDo">
            <tbody>
                <tr>
                    <td class="image">
                        <a href="http://<%=ApplicationServer.SERVER_NAME%>"><img src="/i/registration/minimal.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;"/></a>
                    </td>
                    <td class="text" width="100%">
                        As a TopCoder member you now have access to all
                        <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>">TopCoder
                            Forums</a> and the ability to view all statistical content on the website. Enjoy.
                    </td>
                </tr>
            </tbody>
        </table>
    </c:if>


    </div>
</div>

</body>
</html>
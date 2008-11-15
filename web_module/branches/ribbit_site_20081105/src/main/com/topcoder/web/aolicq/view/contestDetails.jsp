<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<%@ page import="com.topcoder.web.aolicq.model.PrizeType" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/arena.js"></script>

  <title>Ribbit - $100,000 Killer App Challenge  :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>

</head>
<body>
	  
	 <jsp:include page="topNav.jsp">
        <jsp:param name="active_page" value="home"/>
    </jsp:include>
<div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
<div class="secondary-body">
      <%-- Front Page Body Content --%>  
                        <div class="siteBoxHalf">


<%--
<div class="linkBox">
    <aolicq:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <c:choose>
        <c:when test="${currentTime>contest.endTime}">
            <a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a> &gt;
        </c:when>
        <c:otherwise>
            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a> &gt;
        </c:otherwise>
    </c:choose>
    ${contest.name}
</div>
--%>

<h2 class="register">Register &amp; Submit</h2>



<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
    <div align="center">
        <table style="margin-top: 20px; margin-bottom: 20px; width: 320px;" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td width="100%">
                        <div class="bigRed" style="border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
                            <c:choose>
                                <c:when test="${fn:length(contest.prizes)==1}">
                                    <c:forEach items="${contest.prizes}" var="prize">
                                        <div style="float: right; text-align: right;">
                                            <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                            <br />
                                            <tc-webtag:format object="${contest.endTime}" format="MM.dd.yyyy" timeZone="${sessionInfo.timezone}"/>
                                        </div>
                                        <strong>
                                            Winner:<br />
                                            Due date:
                                        </strong>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${contest.prizes}" var="prize">
                                        <c:choose>
                                            <c:when test="${clientPrize==prize.type.id}">
                                                <div style="float: right; clear: right; text-align: right;">
                                                    <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                                    <br />
                                                </div>
                                                <strong>${prize.type.description}:</strong><br />
                                            </c:when>
                                            <c:otherwise>
                                                <div style="float: right; clear: right; text-align: right;">
                                                    <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                                    <br />
                                                </div>
                                                <strong>Prize ${prize.place}:</strong><br />
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <div style="float: right; clear: right; text-align: right;">
                                        <tc-webtag:format object="${contest.endTime}" format="MM.dd.yyyy" timeZone="${sessionInfo.timezone}"/>
                                    </div>
                                    <strong>Due date:</strong>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                    <c:choose>
                    <c:when test="${registered}">
                    <td style="padding: 10px 5px 10px 20px;" align="right">
                        <img src="/i/events/aolicq/interface/btnRegisterNA.png" alt="Register" />
                    </td>
                    <td style="padding: 10px 0px 10px 5px;" align="right">
                        <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src="/i/events/aolicq/interface/btnSubmit.png" alt="Submit" /></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 10px;" align="center">
                        You are registered for this project.<br />
                    </td>
                    </c:when>
                    <c:otherwise>
                    <td style="padding: 10px 5px 10px 20px;" align="right">
                        <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src="/i/events/aolicq/interface/btnRegister.png" alt="Register" /></a>
                    </td>
                    <td style="padding: 10px 0px 10px 5px;" align="right">
                        <img src="/i/events/aolicq/interface/btnSubmitNA.png" alt="Submit" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 10px;" align="center">
                        <br />
                    </td>
                    </c:otherwise>
                    </c:choose>
                </tr>
            </tbody>
        </table>
    </div>
</c:if>

<h3>Project Overview</h3>
${contest.overview.value}
<br /><br />

<c:if test="${registered || currentTime>contest.endTime}">
    <c:if test="${fn:length(contest.documents)>0}">
        <strong>Documentation</strong><br />
        <c:forEach items="${contest.documents}" var="document">
            ${document.type.description}:
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                    ${document.originalFileName}</a> <br/>
        </c:forEach>
        <br /><br />
    </c:if>
</c:if>

<div id="register-steps">
            	<h2>How to Register</h2>
                <p>Participation in the Ribbit Killer App Challenge is completely FREE! Just follow the simple steps below and you'll be on your way to possibly claiming some of our $100,000 in prize money! Here's a quick overview: :</p>
            	<ol>
                	<li><strong>Register for a developer id at <a href="http://developer.ribbit.com/register/">ribbit.com.</a></strong></li>
                    <li class="two"><strong><a href="https://www.topcoder.com/reg/?module=Main&amp;rt=2">Sign up</a> to become a Topcoder member </strong><br />
                    The Killer App Challenge is run using TopCoder's patented competition engine and administered by TopCoder's professional competition staff. TopCoder members are a worldwide community of programmers who compete in algorithm and development contests for prize money. Become a member now to compete in this challenge and other TopCoder contests! If you are already a TopCoder member, go to step 3. <a href="https://www..topcoder.com/reg/?module=Main&amp;rt=2">Sign up at TopCoder &gt;&gt;</a></li>
                  <li class="three"><strong><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1002">Register</a> for the Ribbit Killer App Challenge now!</strong><br />Once you are a TopCoder member, all you have to do is register for the Ribbit Killer App Challenge! Register now to participate in this contest! <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&ct=1002">Contest registration >></a> </li>
                    <li class="four"><strong><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&ct=1002">Submit</a> your application</strong><br />  Once your app is live, submit it to the contest. You will need to submit a zip file to TopCoder which includes 2 items: 
                    	<ol class="sublist">
                        	<li>A text document containing:
                            	<ul class="sublist2">
                                	<li>Your TopCoder handle name</li>
									<li>Your unique Ribbit Developer ID</li>
									<li>The Ribbit AppID</li>
									<li>A title and brief overview of the application to be used as an online description</li>
									<li>The Killer App Category to which you are submitting</li>
									<li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
                                </ul>
                            </li>
                            <li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels)</li>
                        </ol>
                    	Submit early to be eligible for Check Point Awards. Check Point winners will gain first hand feedback for improving and enhancing submissions &mdash; increasing your chances of creating the ultimate Killer App and winning the Grand Prize.
                    </li>
                </ol>
          </div>

		 <h3>How to Submit</h3>
            <p>The requirements for submission may vary depending on the Killer App category, make sure you check out your specific category info page before submitting. (link)</p>
            <p>Once your app is live, <a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>">submit it to the contest</a>.</p>
            <p>You will need to submit a zip file to TopCoder which includes 2 items:</p>
           	
           	<ol class="sublist">
				<li>A text document containing:
					<ul class="sublist2">
						<li>Your TopCoder handle name</li>
						<li>Your unique Ribbit Developer ID</li>
						<li>The Ribbit AppID</li>
						<li>A title and brief overview of the application to be used as an online description</li>
						<li>The Killer App Category to which you are submitting</li>
						<li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
					</ul>
				</li>
				
				<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels)</li>
			</ol>
	
              
<h3>Payment</h3>
${contest.prizeDescription.value}

<c:choose>
    <c:when test="${fn:length(contest.prizes)==1}">
        <c:forEach items="${contest.prizes}" var="prize">
            <strong>Winning Designer:
                <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
            </strong>
        </c:forEach>
        <br /><br />
    </c:when>
    <c:otherwise>
        <c:forEach items="${contest.prizes}" var="prize">
            <c:choose>
                <c:when test="${clientPrize==prize.type.id}">
                    <strong>${prize.type.description}:
                        <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                    </strong>
                    <br />
                </c:when>
                <c:otherwise>
                    <strong>Prize ${prize.place}:
                        <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                    </strong><br />
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <br /><br />
    </c:otherwise>
</c:choose>


<h3>Eligibility</h3>

<p>You must be a TopCoder KillerApps member, at least 18 years of age, meeting all of the membership requirements.
    In addition, you must fit into one of the following categories.
</p>

<p>If you reside in the United States, you must be either:</p>
<ul>
    <li>A US Citizen</li>
    <li>A Lawful Permanent Resident of the US</li>
    <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
        permitting unrestricted employment in the U.S.
    </li>
</ul>
<c:choose>
<c:when test="${contest.id==2048}"></c:when>
<c:otherwise>
<p>If you do not reside in the United States:</p>
<ul>
    <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will
        not need to do anything to become authorized)
    </li>
    </c:otherwise>
    </c:choose>
</ul>


<br /><br />

<h3>Timeline</h3>
All submissions are required to be submitted by the End Date.
<br /><br />


<div align="center">
    <table cellpadding="4" cellspacing="0" width="250">
        <tbody>
            <tr>
                <td valign="top" nowrap="nowrap"><strong>Start Date:</strong></td>
                <td>
                    <tc-webtag:format object="${contest.startTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
            <tr>
                <td valign="top" nowrap="nowrap"><strong>End Date:</strong></td>
                <td>
                    <tc-webtag:format object="${contest.endTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
        </tbody>
    </table>
</div>

        </div>
</div>
<jsp:include page="tcFoot.jsp"/>

</body>
</html>
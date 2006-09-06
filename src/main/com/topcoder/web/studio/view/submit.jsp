<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">
        <jsp:include page="top.jsp"/>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">


                <div class="linkBox"><studio:forumLink forumID="${contest.forumId}"/></div>

                <div class="breadcrumb">
                    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A> &gt;
                    ${contest.name}
                </div>

                <h1>Submit Your Design</h1>

                <div align="center">
                    <div align="left" style="width:500px;">
                        <p>Thank you for accepting the terms of the contest. Please use the form below to upload your
                            submission:</p>

                        <p>The maximum file size per submission is 2MB.</p>

                        <p>
                            Only the following file types will be accepted:
                            <ul>
                                <c:forEach items="${contest.fileTypes}" var="fileType">
                                    <li>
                                            ${fileType.description}
                                    </li>
                                </c:forEach>
                            </ul>

                        </p>

                        <div align="center">
                            <form action="${sessionInfo.servletPath}" method="POST" name="submission" enctype="multipart/form-data">
                                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>
                                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

                                <p>
                                    <b>My design:</b><br/>
                                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION%>">${err}
                                        <br></tc-webtag:errorIterator></span>
                                    <input type="file" name="<%=Constants.SUBMISSION%>">
                                </p>

                                <p>
                                    <input type="image" src="/i/layout/btn_submit.gif" onmouseover="this.src='/i/layout/btn_submit_on.gif'" onmouseout="this.src='/i/layout/btn_submit.gif'">
                                </p>
                            </form>
                        </div>

                    </div>
                </div>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>
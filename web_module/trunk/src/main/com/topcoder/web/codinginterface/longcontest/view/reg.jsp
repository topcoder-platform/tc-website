<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants,
                com.topcoder.web.common.tag.AnswerInput,
                java.util.List"
        %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String level2 = "topcoder";
   String image = "long_comps_topcoder";
    if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="topcoder_practice";
    } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="intel_practice";
        image = "long_comps_intel";
    } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
        level2="intel";
        image = "long_comps_intel";
    }
%>
<html>
<head>
    <title>TopCoder</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="long_contests"/>
                <jsp:param name="level2" value="<%=level2%>"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Registration"/>
            </jsp:include>
            <div align="center">
                <div style="width: 510px; text-align: left;">
                    <div style="float: right;"><ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
                    </div>
                    <span class="bigHandle">Contest: <%=request.getAttribute(Constants.CONTEST_NAME_KEY)%></span>

                    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST"
                          name="surveyForm">
                        <input type="hidden" name="<%=Constants.MODULE%>" value="SubmitReg"/>
                        <input type="hidden" name="<%=Constants.ROUND_ID%>"
                               value="<%=request.getAttribute(Constants.ROUND_ID)%>"/>
                        <% int i = 1; %>
                        <% List questionInfo = (List) request.getAttribute("questionInfo");%>
                        <tc-webtag:questionIterator list="<%=questionInfo%>" id="question">
                            <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame"
                                   align="center">
                                <tr>
                                    <td colspan="2" class="bodySubtitle" valign="top" width="100%">
                                        <%=questionInfo.size() > 1 ? i + ". " : ""%>
                                        <jsp:getProperty name="question" property="text"/>
                                        <br/><br/>
                                        <hr width="100%" size="1" noshade/>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" class="errorText">
                                        <tc-webtag:errorIterator id="err"
                                                                 name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                            <br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <% boolean even = false; %>
                                <tc-webtag:answerInput id="answerInput" question="<%=question%>">
                                    <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                                        <td width="100%">
                                            <%=answerText%>
                                        </td>
                                        <td align="right">
                                            <%=answerInput%>
                                        </td>
                                    </tr>
                                    <% even = !even; %>
                                </tc-webtag:answerInput>
                            </table>
                            <p><br/></p>
                            <% i++;%>
                        </tc-webtag:questionIterator>
                    </form>
                </div>
            </div>

            <div align="center">
                <div style="width: 510px; text-align: left;">
                    <span class="bodySubtitle">Registration</span><br>
                    Please read through the following terms and then click "Accept" when you're done.
                    <br><br>
                </div>

                <form name="terms">
                    <textarea style="width:510; height:300;" name="textarea">
                        <%=request.getAttribute(Constants.ROUND_TERMS_KEY)%>
                    </textarea>
                    <br><br>
                    <A href="javascript: document.surveyForm.submit();"><img src="/i/accept.gif" alt="Accept"
                                                                             border="0"/></A>
                </form>
            </div>


        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>
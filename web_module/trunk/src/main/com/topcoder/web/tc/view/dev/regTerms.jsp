<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% List questionInfo = (List) request.getAttribute("questionInfo");%>
<html>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.web.common.tag.AnswerInput" %>
<head>
    <title>TopCoder - Message</title>
    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value="active_contests"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            <jsp:include page="../body_top.jsp">
                <jsp:param name="image" value="development"/>
                <jsp:param name="image1" value="white"/>
                <jsp:param name="title" value="Components"/>
            </jsp:include>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectRegister"/>
                <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID%>"/>

                <tc:questionIterator list="<%=questionInfo%>" id="question">
                    <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                        <tr>
                            <td colspan="2" class="bodySubtitle" valign="top" width="100%">
                                <jsp:getProperty name="question" property="text"/>
                                <br/><br/>
                                <hr width="100%" size="1" noshade/>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" class="errorText">
                                <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                    <br/></tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <% boolean even = false; %>
                        <tc:answerInput id="answerInput" question="<%=question%>">
                            <tr>
                                <td width="100%">
                                    <%=answerText%>
                                </td>
                                <td align="right">
                                    <%=answerInput%>
                                </td>
                            </tr>
                        </tc:answerInput>
                    </table>
                    <p><br/></p>
                </tc:questionIterator>

                <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="10" cols="60"/>

                <p>
                    <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                        <br/></tc-webtag:errorIterator></span>
                I Agree to the Terms and Conditions stated above&#160;<tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                </p>

                <p>
                    <A href="Javascript:document.regForm.submit();">Register</A>
                </p>

            </form>
        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="right.jsp"/>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>



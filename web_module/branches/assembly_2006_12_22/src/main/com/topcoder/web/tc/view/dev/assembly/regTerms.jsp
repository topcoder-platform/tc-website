<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<html>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.common.tag.AnswerInput" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.List" %>
<head>
    <title>TopCoder - Message</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
		        <jsp:param name="node" value="assembly_compete"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

            <jsp:include page="/page_title.jsp">
				<jsp:param name="image" value="assembly"/>
			    <jsp:param name="title" value="Active Contests"/>
            </jsp:include>
           

            <form action="${sessionInfo.servletPath}" method="POST" name="regForm">
                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectRegister"/>
                <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID%>"/>

                <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="10" cols="60"/>

                <p style="width: 510px;">
                    <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                        <br/></tc-webtag:errorIterator></span>

                    I Agree to the Terms and Conditions stated above&#160;
                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                </p>

                <p style="width: 510px;">
                    <A href="Javascript:document.regForm.submit();">Register</A>
                </p>

                <p><br></p>
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



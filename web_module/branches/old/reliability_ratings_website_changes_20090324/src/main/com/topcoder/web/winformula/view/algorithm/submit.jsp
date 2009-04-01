<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow,
                com.topcoder.web.winformula.algorithm.CodingConstants,
                java.util.Date"
        %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Submit</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <jsp:include page="/script.jsp"/>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>

        <jsp:include page="/nav.jsp">
        <jsp:param name="tabLev1" value="manage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>

<script language="javascript">
    function submit() {
        document.codingForm.<%=CodingConstants.ACTION_KEY%>.value = "submit";
        document.codingForm.submit();
    }

    function save() {
        document.codingForm.<%=CodingConstants.ACTION_KEY%>.value = "save";
        document.codingForm.submit();
    }
    function openWin(url, name) {
        var w = screen.availWidth * 2 / 3;
        var h = screen.availHeight / 2;
        var left = Math.round((screen.availWidth - w) / 2);
        var top = Math.round((screen.availHeight - h) / 2);
        win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=yes,menubar=no"
                + ",width=" + w + ",height=" + h
                + ",left=" + left + ",top=" + top);
        win.location.href = url;
        win.focus();
    }
</script>
        <%-- Main Content --%>
        <div class="sub-navigation"><a href="?module=ManageMyAlgorithms">Manage My Algorithms</a> | Submit | <a href="?module=ViewLastPredictions${adminExtraParams}">Current Algorithm's Predictions</a> | <a href="?module=ViewQueue">Queue Status</a></div>
        <h1>Submit</h1>

        <jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
        <tc-webtag:useBean id="languages" name="<%=CodingConstants.LANGUAGES%>" type="java.util.List" toScope="page"/>
        <% Integer lang = (Integer) request.getAttribute(CodingConstants.LANGUAGE_ID); %>
        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="codingForm">
            <input type="hidden" name="<%=CodingConstants.MODULE%>" value="Submit"/>
            <input type="hidden" name="<%=CodingConstants.ACTION_KEY%>" value=""/>


            <table cellpadding="0" cellspacing="0" border="0" class="bodyText">
                <tr>
                    <td valign="top">
                        <span class="bodyTitle">Coding Area</span><br />
                        <strong>Class Name: <%=request.getAttribute(CodingConstants.CLASS_NAME)%></strong><br />
                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&amp;popup=false<%=(lang!=null?"&amp;lid="+lang:"")%>" class="statLink">Problem
                            Statement</a>
                        (<a href="Javascript:openWin('<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&amp;popup=true<%=(lang!=null?"&amp;lid="+lang:"")%>', 'Problem Statement');" class="statLink">new
                        window</a>)
                    </td>
                    <td align="right" valign="top">Choose your language:<br />
                        <tc-webtag:listIterator id="language" listKey="languages" type="com.topcoder.shared.language.Language">
                            <tc-webtag:radioButton name="<%=CodingConstants.LANGUAGE_ID%>" value="<%=String.valueOf(language.getId())%>"  selected="<%=language.getId() == lang.intValue() ? "true" : "false" %>"/>
                            &#160;
                            <jsp:getProperty name="language" property="name"/>
                            &#160;
                        </tc-webtag:listIterator><br />
                        <%
                            if (request.getAttribute(CodingConstants.FORUM_ID) != null) {
                        %>
                        <tc-webtag:forumLink forumID="<%=((Long)request.getAttribute(CodingConstants.FORUM_ID)).longValue()%>" message="Discuss this contest"/>

                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <textarea cols="70" rows="4" name="methods" class="codeTextArea" wrap="off" readonly><%
                            ArrayList methodNames = (ArrayList) request.getAttribute(CodingConstants.METHOD_NAME);
                                            ArrayList returnTypes = (ArrayList) request.getAttribute(CodingConstants.RETURN_TYPE);
                                            ArrayList paramTypes = (ArrayList) request.getAttribute(CodingConstants.ARG_TYPES);
                        //formatting to the right so that these show up in the text area aligned right.
                        for (int i = 0; i < methodNames.size(); i++) {
                        %>
Method Name: <%=methodNames.get(i)%>
Return Type: <%=StringUtils.htmlEncode((String) returnTypes.get(i))%>
Arg Types: <%=StringUtils.htmlEncode((String) paramTypes.get(i))%>
                            <%
                                }
                            %></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="bodySubtitle">Submission</span><br />
                        <%
                            if (request.getAttribute(CodingConstants.CODE) == null || request.getAttribute(CodingConstants.CODE).toString().equals("")) {
                        %>
                        <textarea cols="100" rows="20" name="code" class="codeTextArea" wrap="off"></textarea>
                        <%
                            } else {
                        %>
                        <textarea cols="100" rows="20" name="code" class="codeTextArea" wrap="off"><%=StringUtils.replace((String) request.getAttribute(CodingConstants.CODE), "&", "&amp;")%></textarea>

                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="bodySubtitle">Messages</span><br />
                        <textarea cols="70" rows="5" name="messages" class="messageTextArea" wrap="off" readonly><%=(request.getAttribute(CodingConstants.MESSAGE) != null ? "" + request.getAttribute(CodingConstants.MESSAGE) : "")%></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="float:left; padding: 5px 5px 0px 0px;">
                            &nbsp;
                        </div>
                    </td>
                    <td align="right" valign="top">
                        <div style="float:right; padding: 5px 0px 0px 5px;">
                            <a href="javascript:submit();"><img src="/i/interface/btn_submit.gif" alt="Submit" border="0"/></a>
                        </div>

                        <div style="float:right; padding: 5px 0px 0px 5px;">
                            <a href="javascript:save();"><img src="/i/interface/btn_save.gif" alt="Save" border="0"/></a>
                        </div>

                    </td>
                </tr>
            </table>
        </form>

        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>
        
<%-- End Wrapper --%>        
</div>
</body>
</html>

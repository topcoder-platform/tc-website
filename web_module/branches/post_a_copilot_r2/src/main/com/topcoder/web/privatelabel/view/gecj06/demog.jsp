<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
<% List questionList = (List) request.getAttribute("questionList");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gecj06.css"/>
    <title>Google Code Jam Europe 2006, Powered by TopCoder</title>
    <jsp:include page="../script.jsp"/>
</head>

<body>

<SCRIPT type="text/javascript">
    function submitEnter(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            document.frmLogin.submit();
            return false;
        } else return true;
    }
</SCRIPT>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gecj06/logo_CodeJamEurope.gif"
                                                        alt="Google Code Jam Europe logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
    <td width="49%">&#160;</td>
    <td>
        <div class="greenBigBox">

            <!-- Tab bar links-->
            <div align=center>
                <jsp:include page="links.jsp">
                    <jsp:param name="selectedTab" value="registration"/>
                </jsp:include>
            </div>

            <br><br>
            <table cellpadding="0" cellspacing="0" border="0" class="bodyText">
                <tr>
                    <td valign="top" colspan="2">
                        <span class="bigTitle">Registration</span>
                        <br><br>
                    </td>
                    <td valign="top" rowspan="2">
                        <jsp:include page="right_reg.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div class="regBreadOff">General</div>

                        <div class="regBreadOn">Demographics</div>

                        <div class="regBreadOff">Confirm</div>

                        <div class="regBreadOff">Success</div>

                        <div class="regBreadOff">Activation</div>
                    </td>
                    <td valign="top" width="100%">

                        <table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
                            <form action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>"
                                  method="POST" name="regForm" enctype="multipart/form-data">
                                <input type="hidden" name="<%=Constants.MODULE_KEY%>"
                                       value="<%=Constants.GOOGLE_EUROPE_06_REG_CONFIRM%>"/>
                                <input type="hidden" name="<%=Constants.COMPANY_ID%>"
                                       value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
                                <input type="hidden" name="<%=Constants.EVENT_ID%>"
                                       value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
                                <pl:questionIterator id="question" list="<%=questionList%>">
                                    <tr>
                                        <td colspan="2" class="errorText" align="center">
                                            <tc-webtag:errorIterator id="err"
                                                                     name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%>
                                                <br/></tc-webtag:errorIterator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <%if (question.isRequired()) {%><span class="errorText">*</span><%}%>
                                            <%=question.getText()%>
                                        </td>
                                        <td align="left">
                                            <pl:demographicInput question="<%=question%>"/>
                                        </td>
                                    </tr>
                                </pl:questionIterator>
                                <tr>
                                    <td colspan="2" class="errorText" align="center">
                                        <tc-webtag:errorIterator id="err" name="<%=Constants.FILE%>"><%=err%><br/>
                                        </tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" nowra>
                                        Resume
                                    </td>
                                    <td align="left">
                                        <input type=file name="<%=Constants.RESUME%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign=bottom nowrap>
                                        <span class="errorText">* Required</span>
                                    </td>
                                    <td align="left" valign=bottom>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <p align="center"><a href="javascript:document.regForm.submit();">Submit</a></p>
                                    </td>
                                </tr>
                            </form>
                        </table>
                        <br/><br/>
                    </td>
                </tr>
            </table>
            To find out more detailed information about Google Code Jam Europe 2006, including a list of the prizes,
            please read the <a href="/pl/?&module=Static&d1=gecj06&d2=rules">Terms and Conditions</a>.


        </div>
    </td>
    <td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="foot.jsp"/>
</body>
</html>
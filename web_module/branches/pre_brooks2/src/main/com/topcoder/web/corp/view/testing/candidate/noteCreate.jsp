<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

</HEAD>

<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<body onLoad="document.note.<%=Constants.NOTE_TEXT%>.focus()">

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Note Creation</h1>
                    </td>
                </tr>
            </table>
            <% System.out.println("path: " + sessionInfo.getServletPath());%>

            <screen:form name='note' method='POST' action='<%=sessionInfo.getServletPath()%>'>
            <INPUT type="hidden" name='<%=Constants.MODULE_KEY%>' value='NoteCreate'/>
            <INPUT type="hidden" name='<%=Constants.FIRST_ATTEMPT%>' value='false'/>
            <INPUT type="hidden" name='<%=Constants.CANDIDATE_ID%>' value='<%=candidateInfo.getUserId()%>'/>
            
            <table cellspacing="1" cellpadding="3" width="70%">
                <tr><td class="bodyText" align="center"><screen:servletLink processor="PopulateCandidate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="bodyText"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink></td></tr>

                <tr>
                    <td class="errorTextOdd">
                        <% if ((String)request.getAttribute(Constants.MESSAGE_PARAMETER) != null){ %>
                        &nbsp;<br>
                        <%= request.getAttribute(Constants.MESSAGE_PARAMETER).toString() %>
                        <br>&nbsp;
                        <% } else if ((String)request.getParameter(Constants.MESSAGE_PARAMETER) != null){ %>
                        &nbsp;<br>
                        <%= request.getParameter(Constants.MESSAGE_PARAMETER) %>
                        <br>&nbsp;
                    <% } %>
                    </td>
                </tr>
                
                <tr><td align="center"><textarea name="<%=Constants.NOTE_TEXT%>" COLS="80" rows="4"></textarea></td></tr>    
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><a href="Javascript:document.note.submit()" CLASS="button">Save</a></p></div></td>
                 </tr>
            </table>
            </screen:form>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>

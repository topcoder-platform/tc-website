<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp"/>

<SCRIPT language="JavaScript"><!--
function back() {
    history.back();
}
//--></SCRIPT>
</HEAD>

<body>

<!-- Header begins -->
<jsp:include page="/includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr valign="top">
                    <td class="bodyText">
                    
                        <jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" scope="request" />
                        
                        <% if("PopulateSession".equals(candidateInfo.getReferrer())) { %><h1 class="testHead">Create a New Session - <%} else if("BuildCandidateList".equals(candidateInfo.getReferrer())) {%><h1 class="testHead">Candidate List - <%}%><FONT COLOR="#000000"><%if(candidateInfo.isNew()) { %>Set up a Candidate<%} else {%>Candidate Info<%}%></h1>
                    
                    </td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><screen:form name="candidateSetupForm" action="<%= Constants.CONTROLLER_URL %>" method="GET">
                    <INPUT type="hidden" name="rp" value="UpdateCandidate" />
                    <INPUT type="hidden" name="referrer" value="<jsp:getProperty name="candidateInfo" property="referrer" />" />
                    <td width="100%"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>
 
            <table cellspacing="0" cellpadding="3" class="testFrame">
                <tr>
                    <td class="testTableSubtitleOdd">Email Address</td>
                        <% if (candidateInfo.isNew()) { %>
                    <td class="testTableOdd"><input type="text" name="emailAddress" size="30" maxlength="30" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                        <% } else { %>
                    <td class="testTableOdd"><jsp:getProperty name="candidateInfo" property="userName" /></td>
                        <% } %>
                </tr>
                
                <tr>
                    <td>&#160;</td>
                    <td class="errorTextOdd" align="left" valign="middle"><screen:errors name="emailAddress" /></td>
                </tr>
                
                    <% if (!candidateInfo.isNew()) { %>
                <tr>
                    <td class="testTableSubtitleOdd">Password</td>
                    <td class="testTableEven"><jsp:getProperty name="candidateInfo" property="password" /></td>
                </tr>
                
                <tr>
                    <td>&#160;</td>
                    <td class="errorTextOdd" align="left" valign="middle"></td>
                </tr>
                    <% } %>
                    
                <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="10" border="0" /></td></tr>
            </table>
                    
            <table border="0" cellspacing="10" cellpadding="0">
                <% if (candidateInfo.isNew()) { %>
                 <tr><td><div align="center"><a href="JavaScript:document.candidateSetupForm.submit()" class="bodyText">Save</a></div></td></tr>
                    <% } else { %>
                 <tr><td><div align="center"><a href="JavaScript:back()" class="bodyText">Go Back</a></div></td></tr>
                    <% } %>
            
                <%
                     if(!candidateInfo.isNew())
                    { 
                        String params = Constants.CANDIDATE_ID + "=" + candidateInfo.getUserId(); 
                %>
                <p>To add a note <screen:servletLink processor="NoteList" param="<%=params%>" styleClass="bodyText">click here</screen:servletLink></p>
                <% }  %>

            </table>
                            
            </screen:form>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/includes/foot.jsp" />

</body>
</html>

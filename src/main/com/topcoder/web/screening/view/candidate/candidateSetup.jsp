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

             <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><screen:form name="candidateSetupForm" action="<%= Constants.CONTROLLER_URL %>" method="GET">
                    <INPUT type="hidden" name="rp" value="UpdateCandidate" />
                    <INPUT type="hidden" name="referrer" value="<jsp:getProperty name="candidateInfo" property="referrer" />" />
                    <td width="100%"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>
 
            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr>
                    <td class="testTableTitle" colspan="3">Candidate</td>
                </tr>
                    
                <tr>
                    <td class="testTableSubtitleOdd">Email Address:</td>
                        <% if (candidateInfo.isNew()) { %>
                    <td class="testTableOdd"><input type="text" name="emailAddress" size="30" maxlength="30" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                        <% } else { %>
                    <td class="testTableOdd"><jsp:getProperty name="candidateInfo" property="userName" /></td>
                        <% } %>
                    <td class="errorTextOdd"><screen:errors name="emailAddress" /></td>
                </tr>
                
                    <% if (!candidateInfo.isNew()) { %>
                <tr>
                    <td class="testTableSubtitleEven">Password:</td>
                    <td class="testTableEven"><jsp:getProperty name="candidateInfo" property="password" /></td>
                    <td class="errorTextOdd" align="left" valign="middle"></td>
                </tr>
                    <% } %>
                    
                <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="10" border="0" /></td></tr>
            </table>
                    
            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                <% if (candidateInfo.isNew()) { %>
                 <tr><td><div align="center"><p class="button"><a href="JavaScript:document.candidateSetupForm.submit()" class="button">Save</a></p></div></td></tr>
                    <% } else { %>
                 <tr><td><div align="center"><p class="button"><a href="JavaScript:back()" class="button">Go Back</a></p></div></td></tr>
                    <% } %>
            
                <%
                     if(!candidateInfo.isNew())
                    { 
                        String params = Constants.CANDIDATE_ID + "=" + candidateInfo.getUserId(); 
                %>
                 <tr><td class="bodyText" align="center"><screen:servletLink processor="NoteList" param="<%=params%>">Add a note</screen:servletLink> for this candidate</p></td></tr>
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

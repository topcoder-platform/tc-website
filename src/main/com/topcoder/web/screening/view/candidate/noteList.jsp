<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants,
                 com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="/script.jsp" />

</head>

<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />

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
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Note List</h1>                  
                    </td>
                </tr>
            </table>
            
            <table cellspacing="1" cellpadding="3" width="100%">
                <tr><form><td class="bodyText" align="center"><screen:servletLink processor="PopulateCandidate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink></td></tr>
            </table>
            
            <table cellspacing="0" cellpadding="3" width="100%" class="testFrame">
                <tr>
                    <td align="center" class="testTableTitleSmall">Notes</td>
                    <td align="center" class="testTableTitleSmall">Author</td>
                    <td align="center" class="testTableTitleSmall">Date Created</td>
                </tr>
                
                <% { boolean even = true; %>
                <screen:resultSetRowIterator id="row" list="<%=candidateInfo.getNoteList()%>">
                <tr>
                    <td <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><%=StringUtils.htmlEncode((String)row.getItem("text").getResultData())%></td>
                    <td align="center" <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><screen:resultSetItem row="<%=row%>" name="created_by" /></td>
                    <td align="center" <% if(even){ %>class="testTableEven"<% } else { %>class="testTableOdd"<% } %>><strong><screen:resultSetItem row="<%=row%>" name="create_date" /></strong></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
                <% } %>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="70%">
                 <tr>
                    <td><div align="center"><p class="button"><screen:servletLink processor="NoteCreate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="button">Add</screen:servletLink></p></div></td>
                </form></tr>
            </table>
                     
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

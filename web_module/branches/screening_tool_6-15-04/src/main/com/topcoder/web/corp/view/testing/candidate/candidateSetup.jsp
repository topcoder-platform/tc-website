<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.common.BaseServlet" %>
<%@ taglib uri="screening.tld" prefix="screen" %>

<HTML>
<HEAD>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

<SCRIPT language="JavaScript"><!--
function back() {
    history.back();
}
//--></SCRIPT>
</HEAD>
<jsp:useBean id="candidateInfo" class="com.topcoder.web.corp.model.CandidateInfo" scope="request" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% if (candidateInfo.isNew()) { %>
  <body onLoad="document.candidateSetupForm.emailAddress.focus()">
<% } else { %>
  <body>
<% } %>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="200" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="700">
                <tr valign="top">
                    <td class="bodyText"> 
                        
                        <p>
                        <span class=testHead>
                        <% if("PopulateSession".equals(candidateInfo.getReferrer())) { %>
                        Create a New Session - 
                        <%} else if("BuildCandidateList".equals(candidateInfo.getReferrer())) {%>
                        <span class=testHead>Candidate List - 
                        <%}%>
                        </span>
                        <span class=testHead>
                        <%if(candidateInfo.isNew()) { %>
                        Set up a Candidate
                        <%} else {%>
                        Candidate Info
                        <%}%>
                        </span>
                        </p>

                    </td>
                </tr>
            </table>

             <table border="0" cellspacing="0" cellpadding="0" width="700">
                <tr><screen:form name="candidateSetupForm" action="<%=sessionInfo.getServletPath()%>" method="GET">
                    <INPUT type="hidden" name="<%=Constants.MODULE_KEY%>" value="UpdateCandidate" />
                    <INPUT type="hidden" name="referrer" value="<jsp:getProperty name="candidateInfo" property="referrer" />" />
                    <td width="100%"><img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"></td>
                </tr>
            </table>
 
            <table cellspacing="0" cellpadding="0" width="700" class="screenFrame">
                <tr>
                    <td class="screeningHeader" width="50%">Personal Info</td>
                    <td class="screeningHeader" width="50%">Demographic Info</td>
                </tr>
                <tr>
                <td width="50%" valign=top class="screeningBG">
                
<%-- NEW CANDIDATE --%>
                <% if (candidateInfo.isNew()) { %>
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>First Name:</td>
                            <td class="screeningCell" width="100%"><input type="text" name="firstName" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Middle Initial:</td>
                            <td class="screeningCell"><input type="text" name="middleInitial" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Last Name:</td>
                            <td class="screeningCell"><input type="text" name="lastName" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Email Address:</td>
                            <td class="screeningCell"><input type="text" name="emailAddress" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell"><screen:errors id="err" name="emailAddress" ><%=err%></screen:errors></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 1:</td>
                            <td class="screeningCell"><input type="text" name="address1" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 2:</td>
                            <td class="screeningCell"><input type="text" name="address2" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 3:</td>
                            <td class="screeningCell"><input type="text" name="address3" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>City:</td>
                            <td class="screeningCell"><input type="text" name="city" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>State:</td>
                            <td class="screeningCell"><input type="text" name="state" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Zip Code:</td>
                            <td class="screeningCell"><input type="text" name="zipCode" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Country:</td>
                            <td class="screeningCell"><input type="text" name="country" size="25" maxlength="50" value="<jsp:getProperty name="candidateInfo" property="userName" />"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                    </table>
                    </td>
                    <td width="50%" valign=top class="screeningBG">
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningCell">This is where some question would go like "do you say 'nu-cle-ar' or 'nu-qu-lar'?</td>
                            <td class="screeningCell" width="50%">
                            <form>
                                <select>
                                    <option selected>-
                                    <option>Nu-cle-ar you dumbass
                                    <option>me say Nu-qu-lar
                                </select>
                            </form>
                            </td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Student or Professional?</td>
                            <td class="screeningCell">
                            <form>
                                <select>
                                    <option selected>-
                                    <option>Student
                                    <option>Professional
                                </select>
                            </form>
                            </td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">David Lee Roth or Sammy Hagar?</td>
                            <td class="screeningCell">
                            <form>
                                <select>
                                    <option selected>-
                                    <option>David Lee Roth
                                    <option>Sammy Hagar
                                </select>
                            </form>
                            </td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Coke or Pepsi?</td>
                            <td class="screeningCell">
                            <form>
                                <select>
                                    <option selected>-
                                    <option>Coke
                                    <option>Pepsi
                                </select>
                            </form>
                            </td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Skiing or Snowboarding?</td>
                            <td class="screeningCell">
                            <form>
                                <select>
                                    <option selected>-
                                    <option>Skiing
                                    <option>Snowboarding
                                </select>
                            </form>
                            </td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                    </table>

<%-- VIEW CANDIDATE --%>
                    <% } else { %>
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>First Name:</td>
                            <td class="screeningCell" width="100%">Some</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Middle Initial:</td>
                            <td class="screeningCell">F</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Last Name:</td>
                            <td class="screeningCell">Dude</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Email Address:</td>
                            <td class="screeningCell"><jsp:getProperty name="candidateInfo" property="userName" /></td>
                            <td class="screeningCell"><screen:errors id="err" name="emailAddress" ><%=err%></screen:errors></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right nowrap=nowrap>Password:</td>
                            <td class="screeningCell"><jsp:getProperty name="candidateInfo" property="password" /></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 1:</td>
                            <td class="screeningCell">123 This St.</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 2:</td>
                            <td class="screeningCell"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Address 3:</td>
                            <td class="screeningCell"></td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>City:</td>
                            <td class="screeningCell">Middle</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>State:</td>
                            <td class="screeningCell">Nowhere</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Zip Code:</td>
                            <td class="screeningCell">012345</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell" align=right>Country:</td>
                            <td class="screeningCell">United States</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                    </table>
                    </td>
                    <td width="50%" valign=top class="screeningBG">
                    <table cellspacing="0" cellpadding="0" border=0 class=bodyText width="100%">
                        <tr>
                            <td class="screeningCell">This is where some question would go like "do you say 'nu-cle-ar' or 'nu-qu-lar'?</td>
                            <td class="screeningCell" width="50%">Nu-cle-ar dumbass, look how it's spelled</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Student or Professional?</td>
                            <td class="screeningCell">Professional</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">David Lee Roth or Sammy Hagar?</td>
                            <td class="screeningCell">David Lee Roth</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Coke or Pepsi?</td>
                            <td class="screeningCell">Pepsi</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                        <tr>
                            <td class="screeningCell">Skiing or Snowboarding?</td>
                            <td class="screeningCell">Snowboarding</td>
                            <td class="screeningCell" align="left" valign="middle"></td>
                        </tr>
                    </table>
                    <% } %>

                    </td>
                </tr>
            <table border="0" cellspacing="10" cellpadding="0" width="50%">


                <% if (candidateInfo.isNew()) { %>
                 <tr><td><div align="center"><p class="button"><a href="JavaScript:document.candidateSetupForm.submit()" class="button">Save</a></p></div></td></tr>
                    <% } %>
            </table>
                            
            </screen:form>

            <p></p>
            <%if(!candidateInfo.isNew()) { %>
            <table cellspacing="0" cellpadding="0" width="700" class="screenFrame">
                <tr>
                    <td width="70%" class="screeningHeader">Notes</td>
                    <td width="15%" align="center" class="screeningHeader">Author</td>
                    <td width="15%" align="center" class="screeningHeader">Date Created</td>
                </tr>

                <% if (candidateInfo.getNoteList().isEmpty()) { %>
                  <td colspan="3" align="center" class="screeningCell">There are currently no notes for this candidate.</td>
                <% } else { boolean even = true; %>
                <screen:resultSetRowIterator id="row" list="<%=candidateInfo.getNoteList()%>">
                <tr>
                    <td valign=top width="70%"<% if(even){ %>class="screeningCell"<% } else { %>class="screeningCell"<% } %>><strong><%=StringUtils.htmlEncode((String)row.getItem("text").getResultData())%></strong></td>
                    <td valign=top width="15%" align="center" <% if(even){ %>class="screeningCell"<% } else { %>class="screeningCell"<% } %>><screen:resultSetItem row="<%=row%>" name="created_by" /></td>
                    <td valign=top width="15%" align="center" <% if(even){ %>class="screeningCell"<% } else { %>class="screeningCell"<% } %>><strong><screen:resultSetItem row="<%=row%>" name="create_date" /></strong></td>
                </tr>
                <% even = !even; %>
                </screen:resultSetRowIterator>
                <% } %>
                 <tr>
                    <td class="screeningHeader" colspan="3" align=center><screen:servletLink processor="NoteCreate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>"><img src="/i/corp/addNoteButton.gif" border=0/></screen:servletLink></td>
                </tr>
            </table>

            <p><br></p>
            <% } %>



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

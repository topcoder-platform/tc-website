<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }

function submitReload() {
    document.profileSetupForm.rp.value = "<%=Constants.POPULATE_PROFILE_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitAdd() {
    document.profileSetupForm.rp.value = "<%=Constants.PROFILE_ADD_PROBLEM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitRemove(id) {
    document.profileSetupForm.testSetBRemove.value = id;
    document.profileSetupForm.rp.value = "<%=Constants.PROFILE_REMOVE_PROBLEM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}

function submitConfirm() {
    document.profileSetupForm.rp.value = "<%=Constants.PROFILE_CONFIRM_PROCESSOR%>";
    document.profileSetupForm.submit();
    return;
}
</SCRIPT>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><img src="/i/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0" /><BR>
            <h1 class="testHead">Create a New Session - <FONT COLOR="#000000">Set up a New Test Profile</FONT></h1>
            <P>To set up a new Test Profile, follow these steps:</P>
            <ol>
                <li>Choose an appropriate name for the Test Profile.</li>
                <li>Assign a Problem Set to Test Set A.  Further information on each Problem Set can be found by clicking "Problem Sets" at the top
                of the page.  Once a Problem Set is selected, the Test Set A table will be automatically populated.</li>
                <li>Assign a Problem or Problems to Test Set B by choosing a Problem from the list and clicking "Add".  Clicking on the Problem
                Name once the table has been populated will open a window that displays statistical information about the Problem, as well as the
                Problem Statement.</li>
                <li>Choose the language(s) in which candidates will be able to code their solutions.</li>
                <li>Click "Confirm" to ensure the correctness of the information.</P>
<jsp:useBean id="profile" class="com.topcoder.web.screening.model.ProfileInfo" scope="request" />
<screen:form name="profileSetupForm" method="GET" action="<%=Constants.CONTROLLER_URL%>">
        <INPUT TYPE="HIDDEN" NAME="rp" VALUE="" >
        <% if(!profile.isNew()) { %>
        <INPUT TYPE="HIDDEN" NAME="profileId" VALUE="<jsp:getProperty name="profile" property="profileId" />" >
        <% } %>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Name</b>&#160;</TD><TD><img src="/i/clear.gif" width="1" height="1" border="0" /></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><input type="text" name="profileName" value ="<jsp:getProperty name="profile" property="profileName" />" size="30" maxlength="30"></TD>
           </TR>
           <TR>
              <TD></TD><TD><img src="/i/clear.gif" width="1" height="1" border="0" /></TD><TD colspan="2" class="errorText" align="left" valign="middle"><screen:errors name="profileName" /></TD>
           </TR>
           <TR align="right" valign="middle">
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Problem Set</b>&#160;</TD><TD><img src="/i/clear.gif" width="1" height="1" border="0" /></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select name="testSetA" onChange="submitReload()">
                <screen:resultSetRowIterator id="row" list="<%=profile.getProblemSetList()%>"><%
                if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) {
                %><option value="<screen:resultSetItem row="<%=row%>" name="round_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="name" /></option><%
                }
                else {
                %><option value="<screen:resultSetItem row="<%=row%>" name="round_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option><%
                }
              %></screen:resultSetRowIterator>
              </select>
              </TD>
           </TR>
           <TR>
              <TD></TD><TD><img src="/i/clear.gif" width="1" height="1" border="0" /></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="80%">
           <TR>
              <TD COLSPAN="4"><img src="/i/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Test Set A</B></TD>
           </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
            </TR>
           <TR>
              <TD COLSPAN="4"><img src="/i/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>
            <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name="testA" property="roundId" />,<screen:beanWrite name="testA" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testA" property="problemName"/></a></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testA" property="divisionDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testA" property="difficultyDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testA" property="algorithmicCategoryList" /></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testA" property="businessCategoryList" /></TD> --%>
            </TR>
            </screen:listIterator>
           <TR>
              <TD COLSPAN="4"><img src="/i/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="80%">
           <TR>
              <TD COLSPAN="5"><img src="/i/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" CLASS="bodyText"><B>Test Set B</B></TD>
           </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC">&#160;</TD>
            </TR>
           <TR>
              <TD COLSPAN="5"><img src="/i/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>
            <INPUT TYPE="HIDDEN" name="testSetBRemove" value="" >
            <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
            <INPUT TYPE="HIDDEN" name="testSetB" value="<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>" >
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="divisionDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="difficultyDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="algorithmicCategoryList" /></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="businessCategoryList" /></TD> --%>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<A HREF="JavaScript:submitRemove('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" CLASS="bodyText">Remove</A></TD>
            </TR>
            </screen:listIterator>
           <TR>
              <TD colspan="5" class="errorText" align="center" valign="middle"><screen:errors name="testSetB" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="5"><img src="/i/clear.gif" width="1" height="30" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" ALIGN="center">
<select name="testSetBAdd" class="dropdown" size="10" multiple="true">
<screen:resultSetRowIterator id="row" list="<%=profile.getCompanyProblemList()%>">
<option value="<screen:resultSetItem row="<%=row%>" name="round_id" />,<screen:resultSetItem row="<%=row%>" name="problem_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option>
</screen:resultSetRowIterator>
</select>
              </TD>
           </TR>
           <TR>
              <TD COLSPAN="5" ALIGN="center"><A HREF="JavaScript:submitAdd()" CLASS="bodyText">Add</A></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD><img src="/i/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText"><B>Available Languages</B></TD>
           </TR>
<screen:resultSetRowIterator id="row" list="<%=profile.getLanguageList()%>">
            <TR>
               <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;
                <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
                <input type="checkbox" name="language" value="<screen:resultSetItem row="<%=row%>" name="language_id" />" CHECKED>&#160;<screen:resultSetItem row="<%=row%>" name="language_name" />
                <% } else { %>
                <input type="checkbox" name="language" value="<screen:resultSetItem row="<%=row%>" name="language_id" />" >&#160;<screen:resultSetItem row="<%=row%>" name="language_name" />
                <% } %>
               </TD>
            </TR>
</screen:resultSetRowIterator>
           <TR>
              <TD colspan="2" class="errorText" align="left" valign="middle"><screen:errors name="language" /></TD>
           </TR>
           <TR>
              <TD><img src="/i/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText"><A HREF="JavaScript:submitConfirm()" CLASS="bodyText">Confirm</A></TD>
            </TR>
         </TABLE>
</screen:form>
<P><BR/></P>

     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>

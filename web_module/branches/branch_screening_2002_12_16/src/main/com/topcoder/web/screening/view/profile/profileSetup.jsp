<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var size = "top=2,left=2,width=600,height=549,status=0";
    var name="graph";
    window.open('<%=Constants.CONTROLLER_URL%>?<%=Constants.REQUEST_PROCESSOR%>=PopulateProblemDetail&<%=Constants.PROBLEM_ID%>='+id,name,size);
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
      <TD VALIGN="top"><img src="/i/ev/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" height="1" vspace="5" border="0" /><BR>
<FONT SIZE="3" COLOR="#666666"><B>Create a New Session - </B></FONT><FONT SIZE="3" COLOR="#990000"><B>Set-Up a New Test Profile</B></FONT>
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P><BR>
<jsp:useBean id="profile" class="com.topcoder.web.screening.model.ProfileInfo" scope="request" />
<screen:form name="profileSetupForm" method="POST" action="<%=Constants.CONTROLLER_URL%>">
        <INPUT TYPE="HIDDEN" NAME="rp" VALUE="" >
        <% if(!profile.isNew()) { %>
        <INPUT TYPE="HIDDEN" NAME="profileId" VALUE="<jsp:getProperty name="profile" property="profileId" />" >
        <% } %>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Name</b>&#160;</TD><TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><input type="text" name="profileName" value ="<jsp:getProperty name="profile" property="profileName" />" size="30" maxlength="30"></TD>
           </TR>
           <TR>
              <TD></TD><TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR align="right" valign="middle">
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Problem Set</b>&#160;</TD><TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select name="testSetA" onChange="submitReload()">
                <screen:resultSetRowIterator id="row" list="<%=profile.getProblemSetList()%>">
                <% if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) { %>
              	<option value="<screen:resultSetItem row="<%=row%>" name="round_id" />" SELECTED><screen:resultSetItem row="<%=row%>" name="name" /></option>
                <% } else { %>
              	<option value="<screen:resultSetItem row="<%=row%>" name="round_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option>
                <% } %>
                </screen:resultSetRowIterator>
              </select>
              </TD>
           </TR>
           <TR>
              <TD></TD><TD><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="80%">
           <TR>
              <TD COLSPAN="4"><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Test Set A</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Category</B></TD>
	        </TR>
           <TR>
              <TD COLSPAN="4"><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>
            <screen:resultSetRowIterator id="row" list="<%=profile.getTestSetAList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="problem_id" />')" class="bodyText"><screen:resultSetItem row="<%=row%>" name="name" /></a></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="difficulty_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="category_desc" /></TD>
	        </TR>
            </screen:resultSetRowIterator>
           <TR>
              <TD COLSPAN="4"><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="80%">
           <TR>
              <TD COLSPAN="5"><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" CLASS="bodyText"><B>Test Set B</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Category</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC">&#160;</TD>
	        </TR>
           <TR>
              <TD COLSPAN="4"><img src="/i/ev/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>
            <INPUT TYPE="HIDDEN" name="testSetBRemove" value="" >
            <screen:resultSetRowIterator id="row" list="<%=profile.getTestSetBList()%>">
            <INPUT TYPE="HIDDEN" name="testSetB" value="<screen:resultSetItem row="<%=row%>" name="problem_id" />" >
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:resultSetItem row="<%=row%>" name="problem_id" />')" class="bodyText"><screen:resultSetItem row="<%=row%>" name="name" /></a></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="difficulty_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="category_desc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<A HREF="#" CLASS="bodyText" onClick="submitRemove(<screen:resultSetItem row="<%=row%>" name="problem_id" />)" >Remove</A></TD>
	        </TR>
            </screen:resultSetRowIterator>
           <TR>
              <TD COLSPAN="5"><img src="/i/ev/clear.gif" width="1" height="30" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" ALIGN="center">
<select name="testSetBAdd" class="dropdown" size="10" multiple="true">
<screen:resultSetRowIterator id="row" list="<%=profile.getCompanyProblemList()%>">
<option value="<screen:resultSetItem row="<%=row%>" name="problem_id" />"><screen:resultSetItem row="<%=row%>" name="name" /></option>
</screen:resultSetRowIterator>
</select>
              </TD>
           </TR>
           <TR>
              <TD COLSPAN="5" ALIGN="center"><A HREF="#" CLASS="bodyText" onClick="submitAdd()">Add</A></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
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
              <TD><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">Clear | <A HREF="#" CLASS="bodyText" onClick="submitConfirm()">Confirm</A></TD>
	        </TR>
         </TABLE>
</screen:form>
<P><BR/></P>

     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><img src="/i/ev/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>

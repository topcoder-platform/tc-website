<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var size = "top=2,left=2,width=600,height=549,status=0";
    var name="graph";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,size);
    return;
  }

function submitEdit() {
    document.profileConfirmForm.rp.value = "<%=Constants.POPULATE_PROFILE_PROCESSOR%>";
    document.profileConfirmForm.submit();
    return;
}

function submitUpdate() {
    document.profileConfirmForm.rp.value = "<%=Constants.UPDATE_PROFILE_PROCESSOR%>";
    document.profileConfirmForm.submit();
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
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Create a New Session - </B></FONT><FONT SIZE="3" COLOR="#990000"><B>Set-Up a New Test Profile</B></FONT>
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P><BR>
<jsp:useBean id="profile" class="com.topcoder.web.screening.model.ProfileInfo" scope="request" />
<screen:form name="profileConfirmForm" method="POST" action="<%=Constants.CONTROLLER_URL%>">
        <INPUT TYPE="HIDDEN" NAME="rp" VALUE="" >
        <% if(!profile.isNew()) { %>
        <INPUT TYPE="HIDDEN" NAME="profileId" VALUE="<jsp:getProperty name="profile" property="profileId" />" >
        <% } %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle"><b>Name:</b>&#160;</TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="profile" property="profileName" /></TD>
           </TR>
           <TR>
              <TD></TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR align="right" valign="middle">
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle"><b>Problem Set:</b>&#160;</TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                <screen:resultSetRowIterator id="row" list="<%=profile.getProblemSetList()%>">
                <% if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) { %>
                  <INPUT type="HIDDEN" name="testSetA" value="<screen:resultSetItem row="<%=row%>" name="round_id" />" >
                  <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><screen:resultSetItem row="<%=row%>" name="name" /></TD>
                <% break; }%>
                </screen:resultSetRowIterator>
           </TR>
           <TR>
              <TD></TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" CLASS="bodyText"><B>Test Set A</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Category</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Category</B></TD>
	        </TR>
           <TR>
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">
            <jsp:useBean id="testA" type="com.topcoder.web.screening.model.ProblemInfo" />
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<jsp:getProperty name="testA" property="roundId" />,<jsp:getProperty name="testA" property="problemId"/>')" class="bodyText"><jsp:getProperty name="testA" property="problemName"/></a></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testA" property="divisionDesc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testA" property="difficultyDesc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testA" property="businessCategoryList" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testA" property="algorithmicCategoryList" /></TD>
	        </TR>
            </screen:listIterator>
           <TR>
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" CLASS="bodyText"><B>Test Set B</B></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Category</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Category</B></TD>
	        </TR>
           <TR>
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
            <jsp:useBean id="testB" type="com.topcoder.web.screening.model.ProblemInfo" />
            <INPUT TYPE="HIDDEN" name="testSetB" value="<jsp:getProperty name="testB" property="roundId" />,<jsp:getProperty name="testB" property="problemId"/>" >
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<jsp:getProperty name="testB" property="roundId" />,<jsp:getProperty name="testB" property="problemId"/>')" class="bodyText"><jsp:getProperty name="testB" property="problemName"/></a></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testB" property="divisionDesc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testB" property="difficultyDesc" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testB" property="businessCategoryList" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="testB" property="algorithmicCategoryList" /></TD>
	        </TR>
            </screen:listIterator>
           <TR>
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText"><B>Available Languages</B></TD>
           </TR>
<screen:resultSetRowIterator id="row" list="<%=profile.getLanguageList()%>">
            <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
            <input type="HIDDEN" name="language" value="<screen:resultSetItem row="<%=row%>" name="language_id" />">
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="language_name" /></TD>
	        </TR>
            <% } %>
</screen:resultSetRowIterator>
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center"><a name="submit" /><a HREF="#submit" CLASS="bodyText" onClick="submitEdit()">Edit</A> | <A HREF="#submit" CLASS="bodyText" onClick="submitUpdate()">Submit</A></TD>
           </TR>
         </TABLE>
</screen:form>
<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
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
            <h1 class="testHead">Create a New Session - <FONT COLOR="#000000">New Test Profile Confirmation</FONT></h1>
            <P>Review the information below for correctness.  If the information is correct, click "Submit".  If changes need to be made, click "Edit" 
            to return to the previous page.</P>
<jsp:useBean id="profile" class="com.topcoder.web.screening.model.ProfileInfo" scope="request" />
<screen:form name="profileConfirmForm" method="GET" action="<%=Constants.CONTROLLER_URL%>">
        <INPUT TYPE="HIDDEN" NAME="rp" VALUE="" >
        <% if(!profile.isNew()) { %>
        <INPUT TYPE="HIDDEN" NAME="profileId" VALUE="<jsp:getProperty name="profile" property="profileId" />" >
        <% } %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle"><b>Name:</b>&#160;</TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
              <INPUT TYPE="HIDDEN" name="profileName" value="<jsp:getProperty name="profile" property="profileName" />" >
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="profile" property="profileName" /></TD>
           </TR>
           <TR>
              <TD></TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR align="right" valign="middle">
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle"><b>Problem Set:</b>&#160;</TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                <screen:resultSetRowIterator id="row" list="<%=profile.getProblemSetList()%>"><% 
                if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) { 
                 %><INPUT type="HIDDEN" name="testSetA" value="<screen:resultSetItem row="<%=row%>" name="round_id" />" >
                  <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><screen:resultSetItem row="<%=row%>" name="name" /></TD><% 
                } 
              %></screen:resultSetRowIterator>
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
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Test Set B</B></TD>
           </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
            </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
            <INPUT TYPE="HIDDEN" name="testSetB" value="<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>" >
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="divisionDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="difficultyDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="algorithmicCategoryList" /></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name="testB" property="businessCategoryList" /></TD> --%>
            </TR>
            </screen:listIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
              <TD ALIGN="center"><a HREF="JavaScript:submitEdit()" CLASS="bodyText">Edit</A> | <A HREF="JavaScript:submitUpdate()" CLASS="bodyText">Submit</A></TD>
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

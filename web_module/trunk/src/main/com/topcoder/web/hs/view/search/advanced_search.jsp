<%@ taglib uri="/search-taglib.tld" prefix="adv" %>
<%@ page import="com.topcoder.web.hs.model.*,java.util.*" %>
<jsp:useBean id="search" type="com.topcoder.web.hs.model.SearchBean" scope="request"/>
<jsp:useBean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />
<jsp:setProperty name="NavZone" property="Level0" value="stats" />
<jsp:setProperty name="NavZone" property="Level1" value="advanced_search" />
<HTML>
<HEAD>
 <TITLE>::TopCoder High School::</TITLE>
 <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
 <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="../includes/css.jsp"/>
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp"/>
 <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR>
   <TD>
    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
     <TR VALIGN="top">
      <TD WIDTH="170" BGCOLOR="#001934">
<jsp:include page="../includes/left_nav.jsp"/>
<jsp:include page="../includes/left_calendar.jsp"/>
      </TD>
      <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
      <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
      <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_bg.gif" BGCOLOR="#FFFFFF">
       <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
        <TR>
         <TD>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
           <TR>
            <TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_search.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
            <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="4096">&nbsp;</TD>
           </TR>
          </TABLE>
         </TD>
        </TR>
        <TR>
         <TD>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
            <TD>
             <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
              <TR>
               <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
              </TR>
             </TABLE>
            </TD>
            <TD HEIGHT="100%" CLASS="bodyText">
            <!-- Start Body -->
<P><BR></P>   
<P>Enter search criteria below then click the go button. Search results matching the criteria selections will be returned. Click on a Handle to view information about the Coder.</P>
<FORM METHOD="get" name="advForm">
 <INPUT TYPE="hidden" NAME="module" VALUE="Search">
 <INPUT TYPE="hidden" NAME="cmd" VALUE="adv">
 <INPUT TYPE="hidden" NAME="start" VALUE="<jsp:getProperty name="search" property="Start"/>">
 <INPUT TYPE="hidden" NAME="end" VALUE="<jsp:getProperty name="search" property="End"/>">
 <INPUT TYPE="hidden" NAME="next" VALUE="">
 <TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
  <TR>
   <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/hs/clear.gif" HEIGHT="4" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" HEIGHT="18" VALIGN="middle" CLASS="bodyText">&nbsp;Member Search: Search by handle, rating or state.</TD>
  </TR>
  <TR>
   <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/hs/clear.gif" HEIGHT="4" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" HEIGHT="30" VALIGN="middle" CLASS="bodyText">
    &nbsp;An underscore ( _ ) = one character space<BR>
    &nbsp;A percent sign ( % ) = any number of character spaces
   </TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="1" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD></TD>
   <TD></TD>
   <TD CLASS="errorText" ALIGN="left" VALIGN="middle">
    <adv:errorIterator id="error" name="SchoolCode"><%=error%><BR></adv:errorIterator>
   </TD>
  </TR>
  <TR>
   <TD COLSPAN="2" WIDTH="50%" HEIGHT="15" VALIGN="middle" CLASS="bodyText">
    Handle&nbsp;<INPUT TYPE="text" NAME="handle" VALUE="<jsp:getProperty name="search" property="Handle"/>" MAXLENGTH="20" SIZE="15" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD CLASS="bodyText">&nbsp;</TD>
   <TD COLSPAN="1" CLASS="bodyText" ALIGN="left" VALIGN="middle">
    State&nbsp;<adv:rscSelect name="state_code" class="dropdown" onChange="Javascript:changeState()" list="<%=search.getStateList()%>" selectedValue="<%=search.getStateCode()%>" topValue="" topText="Any State" fieldValue="state_code" fieldText="state_name"/>
   </TD>
  </TR>
  <TR>
   <TD COLSPAN="4"><IMG SRC="/i/hs/clear.gif" HEIGHT="6" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText">Rating</TD>
   <TD COLSPAN="2">
  </TR>
  <TR>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <adv:errorIterator id="error" name="MinRating"><%=error%><BR></adv:errorIterator>
    <adv:errorIterator id="error" name="MaxRating"><%=error%><BR></adv:errorIterator>
    <adv:errorIterator id="error" name="MinMax"><%=error%><BR></adv:errorIterator>
   </TD>
   <TD></TD>
   <TD CLASS="errorText" ALIGN="left" VALIGN="middle">
    <adv:errorIterator id="error" name="SchoolId"><%=error%><BR></adv:errorIterator>
   </TD>
  </TR>
  <TR>
   <TD WIDTH="25%" VALIGN="middle" CLASS="bodyText">
    &nbsp;Min&nbsp;<INPUT TYPE="text" NAME="min_rating" VALUE="<jsp:getProperty name="search" property="MinRating"/>" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD WIDTH="25%" VALIGN="middle" CLASS="bodyText">
    &nbsp;Max&nbsp;<INPUT TYPE="text" NAME="max_rating" VALUE="<jsp:getProperty name="search" property="MaxRating"/>" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD CLASS="bodyText">&nbsp;</TD>
   <TD COLSPAN="1" CLASS="bodyText" VALIGN="center" ALIGN="left">
    School&nbsp;<adv:rscSelect name="school_id" class="dropdown" list="<%=search.getSchoolList()%>" selectedValue="<%=search.getSchoolId().toString()%>" topValue="-1" topText="Any School" fieldValue="school_id" fieldText="full_name"/>
   </TD>
  </TR>
  <TR>
   <TD HEIGHT="18" VALIGN="middle" ALIGN="center" CLASS="statText" COLSPAN="4">
    <INPUT TYPE="button" NAME="submitButton" VALUE="Submit" ONCLICK="Javascript:submitSearch()">
   </TD>
  </TR>
  <TR>
   <TD CLASS="statText" COLSPAN="4" BACKGROUND="/i/hs/steel_blue_bg.gif"><IMG BORDER="0" HEIGHT="3" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD>
  </TR>
  <TR>
   <TD CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="12" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD>
  </TR>
  <% if (search.hasMemberList()) {
       if (search.getMemberList().size()==0) { %>
  <TR>
   <TD CLASS="bodyText" ALIGN="center">
    No members found.
   </TD>
  </TR>
    <% } else { %>
  <TR>
   <TD COLSPAN="4">
    <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
     <TR>
      <TD COLSPAN="5" ALIGN="left">
       &nbsp;Search Results:&nbsp;&nbsp;<jsp:getProperty name="search" property="Start"/> to <jsp:getProperty name="search" property="End"/>
      </TD>
     </TR>
     <TR>
      <TD COLSPAN="5" ALIGN="center">
       <%=(search.getHasPrev()?"<A HREF=\"Javascript:document.advForm.next.value='false';Javascript:document.advForm.submit()\">&lt;&lt; prev</A>":"&lt;&lt; prev")%> | <%=(search.getHasNext()?"<A HREF=\"Javascript:document.advForm.next.value='true';Javascript:document.advForm.submit()\">next &gt;&gt;</A>":"&gt;&gt; next")%>
      </TD>
     </TR>
     <TR>
      <TD><B>Handle</B></TD>
      <TD><B>Rating</B></TD>
      <TD><B>State</B></TD>
      <TD><B>School</B></TD>
      <TD><B>Last Competed</B></TD>
     </TR>
     <adv:resultSetRowIterator id="member" list="<%=search.getMemberList()%>">
        <TR>
            <TD><A HREF="?module=Statistics&c=member_profile&cr=<adv:resultSetItem row='<%=member%>' name="user_id"/>"><adv:resultSetItem row="<%=member%>" name="handle"/></A></TD>
            <TD><adv:resultSetItem row="<%=member%>" name="rating"/></TD>
            <TD><adv:resultSetItem row="<%=member%>" name="state_code"/></TD>
            <TD><adv:resultSetItem row="<%=member%>" name="school_name"/></TD>
            <TD><adv:resultSetItem row="<%=member%>" name="last_competed" format="MM/dd/yyyy" ifNull="N/A"/></TD>
       </TR>

     </adv:resultSetRowIterator>
    </TABLE>
  </TR>
    <% }
     } %>
 </TABLE>
 <SCRIPT type="text/javascript">
  function changeState() {
   document.advForm.cmd.value="";
   document.advForm.submit();
  }
  function submitSearch() {
   document.advForm.submit();
  }
  function submitEnter(_event) {
   var keycode;
   if (window.event) {
    keycode=window.event.keyCode;
   }
   else if (_event) {
    keycode=e.which;
   }
   else {
    return(true);
   }
   if (keycode==13) {
    submitSearch();
    return(false);
   }
   else {
    return(true);
   }
  }
 </SCRIPT>
</FORM>
             <!-- End Body -->
             </TD>
             <TD>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
               <TR>
                <TD><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
               </TR>
              </TABLE>
             </TD>
            </TR>
           </TABLE>
          </TD>
         </TR>
        </TABLE>
       </TD>
       <TD BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top.gif" WIDTH="1" HEIGHT="18" BORDER="0"></TD>
       <TD BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_right.gif" WIDTH="1" HEIGHT="18" BORDER="0"></TD>
       <TD BGCOLOR="#001934" VALIGN="top">
        <IMG SRC="/i/hs/right_top_3dots.gif" WIDTH="86" HEIGHT="41" BORDER="0">
       <BR>
<jsp:include page="../includes/right_resources.jsp"/>
       </TD>
      </TR>
     </TABLE>
    </TD>
   </TR>
  </TABLE>
<jsp:include page="../includes/foot.jsp"/>
 </BODY>
</HTML>

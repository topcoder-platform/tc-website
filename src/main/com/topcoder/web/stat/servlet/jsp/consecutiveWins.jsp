<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");

String sDivision = srb.getProperty("dn","1");
String romanDivision = null;
if (sDivision.equals("1")) romanDivision = "I";
else if (sDivision.equals("2")) romanDivision = "II";
%>
<html>
<head>
   <TITLE>TopCoder :: Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <%@ include file="/script.jsp" %>
<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</script>
</HEAD>
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <%@ include file="/top.jsp" %>
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <%@ include file="left.jsp" %>
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" BGCOLOR="#CCCCCC" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Quick Stats&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
           <TR>
            <TD BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG src="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/> 

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
              <TR>
                <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                  <P CLASS="statText">
                    This chart represents the longest consecutive room win streaks in Single Round Matches.
                  </P>
                  <P CLASS="statText">
<% if (sDivision.equals("2")){ %>  
                    View consecutive room win streaks for <A CLASS="statText" HREF="/stat?c=most_consecutive_wins&dn=1">Division I</A>
<% } else { %>
                    View consecutive room win streaks for <A CLASS="statText" HREF="/stat?c=most_consecutive_wins&dn=2">Division II</A>
<% } %>
                  </P>
                  <!-- Stats Intro Begins -->
                  <%@ include file="qsIntro.jsp" %>

          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="7" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_gray_bg.gif" COLSPAN="7" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;Consecutive Wins&nbsp;-&nbsp;Division-<%=romanDivision%></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
                    <TR VALIGN="middle">
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="10" HEIGHT="18">&nbsp;</TD>            
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="20%">
            <a href="/stat?c=most_consecutive_wins&dn=<%=sDivision%>&sq=Most_Consecutive_Wins&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Handle</a>
            </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="15%">
            <a href="/stat?c=most_consecutive_wins&dn=<%=sDivision%>&sq=Most_Consecutive_Wins&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Consecutive Wins</a>
            </TD>
                      <TD colspan="3" CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="40%">Round Duration</TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">Start/End Date</TD>
                    </TR>
          <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
<logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
  <logic:equal name="queryEntries" property="key" value="Most_Consecutive_Wins">
  <logic:present name="queryEntries" property="value">
    <bean:define id="resultSet" name="queryEntries" property="value" type="ResultSetContainer" />
    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow"> 
    <tr valign="middle">
            <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 3 /*"coder_score"*/ + "]" %>'/>
          <td CLASS="smallFoot" align="right" height="13"><bean:write name="resultRow" property='<%= "item[" + 10 /*"rank"*/ + "]" %>'/>&nbsp;</td>
          <td><A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"coder_id"*/ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"> <bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></td>
        <TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 2 /*"length"*/ + "]" %>'/></TD>
                <TD CLASS="statText" ALIGN="right" width="18%"><bean:write name="resultRow" property='<%= "item[" + 5 /*"contest"*/ + "]" %>'/><!--,<bean:write name="resultRow" property='<%= "item[" + 6 /*"round"*/ + "]" %>'/>--></td>
                <TD CLASS="statText" ALIGN="center" width="4%">&nbsp;-&nbsp;</td>
        <TD CLASS="statText" ALIGN="left" width="18%"><bean:write name="resultRow" property='<%= "item[" + 8 /*"contest"*/ + "]" %>'/><!--,<bean:write name="resultRow" property='<%= "item[" + 9 /*"round"*/ + "]" %>--></TD>
                <TD CLASS="statText" ALIGN="center"><stat:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 4 /*"start_date"*/ + "].resultData" %>'/>&nbsp;-&nbsp;<bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 7 /*"end_date"*/ + "].resultData" %>'/></TD>
    </tr>
    </logic:iterate>
  </logic:present>
  </logic:equal>
</logic:iterate>
</logic:present>
<TR>
                      <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                    </TR>
                  </TABLE>




           </TD>
              </TABLE>      
            </TD>
            <TD VALIGN="top" WIDTH="10"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
           </TR>
           <TR>
             <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>     
           <TR>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
             <TD background="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG src="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
             <TD background="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
           </TR>  
           <TR>
             <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG src="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG src="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <!-- END BODY -->

       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG src="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0">
         <%@ include file="/public_right.jsp" %>
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
     </TR>
   </TABLE>
   <%@ include file="/foot.jsp" %> 
</body>
</html>




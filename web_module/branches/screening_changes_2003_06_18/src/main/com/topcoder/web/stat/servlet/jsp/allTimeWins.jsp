<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>

<HTML>
<HEAD>
   <TITLE>TopCoder Statistics - All-Time Wins</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="/script.jsp" />
<SCRIPT language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</SCRIPT>
</HEAD>
</HEAD>
<BODY>
  <jsp:include page="/top.jsp" />

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
         <jsp:include page="../includes/global_left.jsp" />
        </TD>
       
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
         <!-- BEGIN BODY -->
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
                    <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
                    <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
                        &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Quick Stats&#160;&#160;</SPAN>
                    </TD>
                    <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
                </TR>
            </TABLE>
            
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
                <TR>
                    <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/> 

                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                            <TR>
                                <TD COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                                    <P CLASS="statText">This chart represents the Top 10 in Overall Room Wins.</P>
                                    
                                    <P CLASS="statText">See Room Wins for <A CLASS="statText" HREF="/stat?c=all_time_wins_by_div&dn=1">Division-I</a> or 
                                    <A CLASS="statText" HREF="/stat?c=all_time_wins_by_div&dn=2">Division-II</a></P>

<!-- Stats Intro Begins -->
                                    <jsp:include page="qsIntro.jsp" />

                                    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                                        <TR><TD COLSPAN="5" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD></TR>
                                        <TR><TD background="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;All-Time Wins</TD></TR>
                                        <TR><TD COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD></TR>
                                        <TR VALIGN="middle">
                                            <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="10" HEIGHT="18">&nbsp;</TD>            
                                            <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
                                                <a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Handle</a>
                                            </TD>
                                                
                                            <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
                                                <a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=5&sd=<%= "5".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Overall</a>
                                            </TD>
                      
                                            <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
                                                <a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Div.&nbsp;I</a>
                                            </TD>
                      
                                            <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
                                                <a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Div.&nbsp;II</a>
                                            </TD>
                                        </TR>
                                            
                                        <TR><TD COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD></TR>

<logic:present name="QUERY_RESPONSE" scope="request">
    <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
        <logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
            <logic:equal name="queryEntries" property="key" value="All_Time_Wins">
                <logic:present name="queryEntries" property="value">
                    <bean:define id="resultSet" name="queryEntries" property="value" type="ResultSetContainer" />
                        <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow"> 

                                        <tr valign="middle">
                                        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 2 /*"coder_score"*/ + "]" %>'/>
                                                
                                            <td CLASS="smallFoot" align="right" height="13"><bean:write name="resultRow" property='<%= "item[" + 6 /*"rank"*/ + "]" %>'/>&nbsp;</td>
                                            <td><A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"coder_id"*/ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"> <bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></td>
                                            <TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 5 /*"total"*/ + "]" %>'/></TD>
                                            <TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 3 /*"div 1"*/ + "]" %>'/></TD>
                                            <TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 4 /*"div 2"*/ + "]" %>'/></TD>
                                        </tr>
                                            
                        </logic:iterate>
                    </logic:present>
                </logic:equal>
            </logic:iterate>
        </logic:present>
                                            
                                        <TR><TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="5"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD></TR>
                                        <TR><TD CLASS="statText" COLSPAN="5"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD></TR>
                                    </TABLE>
                                </TD>
                            </TR>
                        </TABLE>      
                    </TD>
                </TR>
                    
                <TR><TD WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                
            </TABLE>
         
         <p><br></p>

<!-- END BODY -->

        </TD>
        <TD WIDTH="10"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
            <jsp:include page="/public_right.jsp" />
        </TD>
<!-- Gutter -->
        <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->       

     </TR>
</TABLE>
   <jsp:include page="/foot.jsp" /> 
</body>
</html>






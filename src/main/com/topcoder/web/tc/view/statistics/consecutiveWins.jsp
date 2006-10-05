<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");

String sDivision = srb.getProperty("dn","1");
String romanDivision = null;
if (sDivision.equals("1")) romanDivision = "I";
else if (sDivision.equals("2")) romanDivision = "II";
%>
<html>
<head>
<TITLE>TopCoder Statistics - Most Consecutive Wins</TITLE>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</HEAD>
<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="algo_recordbook"/>
            </jsp:include>
        </td>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Algorithm Competition Record Book"/>
</jsp:include>

<div style="float:right; padding-left: 20px;"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">back to table of contents</A></div>
<% if (sDivision.equals("2")){ %>
<A HREF="/stat?c=most_consecutive_wins&dn=1">Div I</A>
 | Div II
<% } else { %>
Div I
 | <A HREF="/stat?c=most_consecutive_wins&dn=2">Div II</A>
<% } %>
<br><br>
<strong>Record:</strong> This chart represents the longest consecutive room win streaks in Single Round Matches.

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="6">Most Consecutive Wins</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header"><a href="/stat?c=highest_accuracy&sq=Highest_Submission_Accuracy&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Coder</a></td>
        <td class="headerC"><a href="/stat?c=highest_accuracy&sq=Highest_Submission_Accuracy&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Wins</a></td>
        <td class="headerC" width="100%" colspan="3">Duration</td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
<logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
  <logic:equal name="queryEntries" property="key" value="Most_Consecutive_Wins">
  <logic:present name="queryEntries" property="value">
    <bean:define id="resultSet" name="queryEntries" property="value" type="ResultSetContainer" />
    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">

    <tr class="<%=even?"dark":"light"%>">
        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 3 /*"coder_score"*/ + "]" %>'/>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 10 /*"rank"*/ + "]" %>'/></td>
        <td class="value" nowrap><tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>" context="algorithm"/></td>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 2 /*"length"*/ + "]" %>'/></td>
        <td class="valueR">
        <strong><bean:write name="resultRow" property='<%= "item[" + 5 /*"contest"*/ + "]" %>'/></strong><br>
        <bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 4 /*"start_date"*/ + "].resultData" %>'/>
        </td>
        <td class="valueC">-</td>
        <td class="value">
        <strong><bean:write name="resultRow" property='<%= "item[" + 8 /*"contest"*/ + "]" %>'/></strong><br>
        <bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 7 /*"end_date"*/ + "].resultData" %>'/>
        </td>
    </tr>

    <% even = !even;%>
    </logic:iterate>
  </logic:present>
  </logic:equal>
</logic:iterate>
</logic:present>

</tbody>
</table>


</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

<%--
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
              <TR>
                <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
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
                  <jsp:include page="qsIntro.jsp" />

          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                    <TR>
                      <TD COLSPAN="7" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_gray_bg.gif" COLSPAN="7" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;Consecutive Wins&nbsp;-&nbsp;Division-<%=romanDivision%></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
                      <TD COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
RANK<td CLASS="smallFoot" align="right" height="13"><bean:write name="resultRow" property='<%= "item[" + 10 /*"rank"*/ + "]" %>'/>&nbsp;</td>
HANDLE<td CLASS="statText"><A HREF="/tc?module=MemberProfile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"coder_id"*/ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"> <bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></td>
LENGTH<TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 2 /*"length"*/ + "]" %>'/></TD>
DURATION1<TD CLASS="statText" ALIGN="right" width="18%"><bean:write name="resultRow" property='<%= "item[" + 5 /*"contest"*/ + "]" %>'/><!--,<bean:write name="resultRow" property='<%= "item[" + 6 /*"round"*/ + "]" %>'/>--></td>
<TD CLASS="statText" ALIGN="center" width="4%">&nbsp;-&nbsp;</td>
DURATION2<TD CLASS="statText" ALIGN="left" width="18%"><bean:write name="resultRow" property='<%= "item[" + 8 /*"contest"*/ + "]" %>'/></TD>
DATE1 and DATE2<TD CLASS="statText" ALIGN="center"><bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 4 /*"start_date"*/ + "].resultData" %>'/>&nbsp;-&nbsp;<bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 7 /*"end_date"*/ + "].resultData" %>'/></TD>
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
                      <TD CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                    </TR>
                  </TABLE>




           </TD>
           </TR>
              </TABLE>
            </TD>
           </TR>
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <p><br></p>

         <!-- END BODY -->

       </TD>
       <TD WIDTH="10"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
</body>
</html>
--%>
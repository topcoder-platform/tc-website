<%@ page language="java" errorPage="/errorPage.jsp" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<% //common code that pulls out the request bean.
com.topcoder.web.stat.bean.StatRequestBean srb = (com.topcoder.web.stat.bean.StatRequestBean) request.getAttribute("REQUEST_BEAN");

String sDivision = srb.getProperty("dn","1");
String romanDivision = null;
if (sDivision.equals("1")) romanDivision = "I";
else if (sDivision.equals("2")) romanDivision = "II";
%>
				  <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="registerNav" VALIGN="middle" HEIGHT="18">&nbsp;Highest Totals&nbsp;-&nbsp;Division&nbsp;<%=romanDivision%></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
                    <TR VALIGN="middle">
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="10" HEIGHT="18">&nbsp;</TD>					  
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
					  <a href="/stat?c=highest_totals&dn=<%=sDivision%>&sq=Highest_Totals&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Handle</a>
					  </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
					  <a href="/stat?c=highest_totals&dn=<%=sDivision%>&sq=Highest_Totals&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Points</a>
					  </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
					  <a href="/stat?c=highest_totals&dn=<%=sDivision%>&sq=Highest_Totals&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Round</a>
					  </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
					  <a href="/stat?c=highest_totals&dn=<%=sDivision%>&sq=Highest_Totals&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Date</a>
					  </TD>
                    </TR>
					<TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
<logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
	<logic:equal name="queryEntries" property="key" value="Highest_Totals">
	<logic:present name="queryEntries" property="value">
		<bean:define id="resultSet" name="queryEntries" property="value" type="com.topcoder.web.stat.common.ResultSetContainer" />
		<logic:iterate name="resultSet" id="resultRow" type="com.topcoder.web.stat.common.ResultSetContainer.ResultSetRow"> 
		<tr valign="middle">
		        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 3 /*"coder_score"*/ + "]" %>'/>
    			<td CLASS="smallFoot" align="right" height="13"><bean:write name="resultRow" property='<%= "item[" + 8/*"rank"*/ + "]" %>'/>&nbsp;</td>
    			<td><A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"coder_id"*/ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"> <bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></td>
				<TD CLASS="statText" ALIGN="center"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 2 /*"score"*/ + "].resultData" %>'/></TD>
                <TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 7 /*"contest"*/ + "]" %>'/></TD>
                <TD CLASS="statText" ALIGN="center"><bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 6 /*"date"*/ + "].resultData" %>'/></TD>
		</tr>
		</logic:iterate>
	</logic:present>
	</logic:equal>
</logic:iterate>
</logic:present>
<TR>
                      <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="5"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="5"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                    </TR>
                  </TABLE>

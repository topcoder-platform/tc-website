<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,com.topcoder.shared.util.ApplicationServer"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Component History</TITLE>
   <jsp:include page="baseHRef.jsp" />
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />
 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

        <TD WIDTH="180">
<!-- Left nav begins -->
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
<!-- Left nav ends -->
        </TD>

<!-- Gutter begins -->
       <TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter ends -->

        <TD CLASS="bodyText" WIDTH="99%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="15" BORDER="0"><BR/>

<%
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
pageContext.setAttribute("coder_id", srb.getProperty("cr","0000"));
%>

<!-- Center column begins -->
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
                    <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
                    <TD CLASS="bodySubhead" VALIGN="middle" WIDTH="100%">&#160;&#160;&#160;Component
<% if(srb.getProperty("pi").equals("113")){
%>
       Development
<%
   }
   else{
%>
       Design

<%
   }
%> History&#160;&#160;</TD>
                    <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
                </TR>
            </TABLE>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
                <TR>
                    <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR/>
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>


<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Basic_Coder_Information");
boolean bEmpty = (rsc == null || rsc.size()!=1);
if (!bEmpty) {
  ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
  pageContext.setAttribute("resultRow", rsr);
%>

		<bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"coder_score"*/ + "]" %>'/>
                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                            <TR>
                                <TD colspan="2" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                            </TR>

                            <TR VALIGN="middle">
                                <TD CLASS="statTextLarge">
                                    <B>Coder:</B>&#160;<SPAN CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><B><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></B></SPAN>
                                </TD>

                                <TD width="99%" CLASS="statText" HEIGHT="16" align="right">
                                    <A HREF="/stat?c=member_profile&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="statText">Profile</A>
                                    |
                                    <A HREF="/stat?pi=112&c=tcs_ratings_history&pi=112&&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="statText">Design Rating</A>
                                    |

    <% if(srb.getProperty("pi").equals("112")) { %>
                                    <strong>Design Earnings</strong>
    <% } else { %>
                                    <A HREF="/stat?c=component_history&pi=112&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="statText">Design Earnings</A>
    <% } %>

                                    |
                                    <A HREF="/stat?pi=113&c=tcs_ratings_history&pi=113&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="statText">Development Rating</A>
                                    |

    <% if(srb.getProperty("pi").equals("113")) { %>
                                    <strong>Development Earnings</strong>
    <% } else { %>
                                    <A HREF="/stat?c=component_history&pi=113&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="statText">Development Earnings</A>
    <% } %>
                                </TD>
                            </TR>

                            <TR>
                                <TD COLSPAN="2" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                            </TR>
                        </TABLE>
<%
} //end if not empty
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("component_earnings");
pageContext.setAttribute("resultSet", rsc2);

//calculate scrolling information
//1. pick apart parms
String sStartRow=srb.getProperty("sr","1");
pageContext.setAttribute("sr", sStartRow);
String sEndRow = srb.getProperty("er",Integer.toString(rsc2.size()));
pageContext.setAttribute("er", sEndRow);
String sNumRow = srb.getProperty("nr",Integer.toString(rsc2.size()));
pageContext.setAttribute("nr", sNumRow);

//2. calculate next scroll
int iTemp = Integer.parseInt(sEndRow)+1;
pageContext.setAttribute("next_sr", Integer.toString(iTemp));
iTemp += Integer.parseInt(sNumRow)-1;
pageContext.setAttribute("next_er", Integer.toString(iTemp));

//3. now calculate previous scroll
iTemp = Math.max(1,Integer.parseInt(sStartRow)-1);
pageContext.setAttribute("prev_er", Integer.toString(iTemp));
iTemp = Math.max(1,(iTemp-Integer.parseInt(sNumRow)+1));
pageContext.setAttribute("prev_sr", Integer.toString(iTemp));

String sortString = "";
if (srb.getProperty("sq")!=null){
	sortString="&sq=" + srb.getProperty("sq");
	sortString+="&sc=" + srb.getProperty("sc");
	sortString+="&sd=" + srb.getProperty("sd", "desc");
}
String sSortUrl = "/stat?c=component_history&pi="+srb.getProperty("pi")+ "&cr="+srb.getProperty("cr")+"&sq=component_history";
%>
                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="3" WIDTH="100%">
		  		<% if (!bEmpty) { %>
                            <TR>
                                <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="statTextBig" COLSPAN="7">Component History</TD>
                            </TR>

			<% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>

			<TR>
			    <TD CLASS="statText" BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="7" HEIGHT="16" align="center">
				<% if (rsc2.croppedDataBefore()) { %>
			        <a href="/stat?c=component_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="statText">&lt;&lt; previous</a>

				<% } else { %>
			        &lt;&lt; previous

				<% } %>
			        &nbsp;|&nbsp;

				<% if (rsc2.croppedDataAfter()) { %>
			        <a href="/stat?c=component_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="statText">next &gt;&gt;</a>

				<% } else { %>
			        next &gt;&gt;

				<% } %>
                                </TD>
                            </TR>

			<% } %>

                            <TR VALIGN="middle">
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="15%" HEIGHT="18"><a href="<%=sSortUrl%>&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Date</a></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" ALIGN="left" WIDTH="32%"><a href="<%=sSortUrl%>&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Project / Event</a></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" ALIGN="center" WIDTH="18%"><a href="<%=sSortUrl%>&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Place</a></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" ALIGN="right" WIDTH="10%"><a href="<%=sSortUrl%>&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Amount</a></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" ALIGN="right" WIDTH="20%"><a href="<%=sSortUrl%>&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Score</a></TD>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                            </TR>

<logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">

                            <TR VALIGN="middle">
                                <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                                <TD CLASS="statText" HEIGHT="13"><bean:write format="MM.dd.yy" name="resultRow2" property='<%= "item[" + 3 /* event date */ + "].resultData" %>'/></TD>
                                <% if (resultRow2.getIntItem("component_id")!=-1) { %>
                                  <TD CLASS="statText" ALIGN="left"><A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<bean:write name="resultRow2" property='<%= "item[" + 2 /* round id */ + "]" %>'/>" CLASS="statText"><bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/></A></TD>
                                <% } else { %>
                                  <TD CLASS="statText" ALIGN="left"><bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/></TD>
                                <% } %>
                                <TD CLASS="statText" ALIGN="center">
                                    <bean:write name="resultRow2" property='<%= "item[" + 5 /* place */ + "]" %>'/>
                                </TD>
                                <TD CLASS="statText" ALIGN="right">$&nbsp;<bean:write format="0.00" name="resultRow2" property='<%= "item[" + 6 /* money */ + "].resultData" %>'/></TD>
                                <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow2" property='<%= "item[" + 8 /* score */ + "]" %>'/></TD>
                                <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                            </TR>
</logic:iterate>

		 <% } else { %>

                            <TR>
                                <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                            </TR>

			<TR>
                                <TD COLSPAN="7" CLASS="statText">This member has no component history.</TD>
                            </TR>
         <% } %>
                            <TR>
                                <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                            </TR>
                        </TABLE>
                    </TD>
                </TR>
		   <% if (!bEmpty) { %>
			<% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
                <TR>
                    <TD CLASS="statText" BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="7" HEIGHT="16" align="center">
				<% if (rsc2.croppedDataBefore()) { %>
					<a href="/stat?c=component_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="statText">&lt;&lt; previous</a>
				<% } else { %>
					&lt;&lt; previous
				<% } %>
					&nbsp;|&nbsp;
				<% if (rsc2.croppedDataAfter()) { %>
					<a href="/stat?c=component_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="statText">next &gt;&gt;</a>
				<% } else { %>
					 next &gt;&gt;
				<% } %>
                    </TD>
                </TR>
			<% } %>
		<% } %>

            </TABLE>

            <p><br></p>
<!-- Center column ends -->

        </TD>

<!-- Gutter begins -->
       <TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter ends -->

        <TD width="170">
<!-- right begins -->
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="profile"/>
            </jsp:include>
<!-- right ends -->
       </TD>

<!-- Gutter begins -->
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter ends -->

     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>



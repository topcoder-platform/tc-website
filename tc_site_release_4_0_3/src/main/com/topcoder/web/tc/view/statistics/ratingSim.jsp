<%@ page
  language="java"
  import="com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.text.DecimalFormat,
          java.util.ArrayList,
          com.topcoder.web.tc.Constants;"

%>

<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<HTML>
    <HEAD>
        <TITLE>TopCoder Statistics - Rating Sim</TITLE>
        <jsp:include page="baseHRef.jsp" />
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
        <jsp:include page="../script.jsp" />
    </HEAD>
    <BODY>
    <jsp:include page="../top.jsp" />
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
        <TR>
            <TD WIDTH="180" VALIGN="top">
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="level1" value="statistics"/>
                    <jsp:param name="level2" value="round_overview"/>
                </jsp:include>
            </TD>
            <TD WIDTH="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="bodyText" WIDTH="99%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR>

                <!-- BEGIN BODY -->
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                    <TR>
                        <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
                        <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
                        <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
                            &#160;<SPAN CLASS="bodySubhead">&#160;&#160;<%= "Rating Sim"%>&#160;&#160;</SPAN>
                        </TD>
                        <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
                    </TR>
                </TABLE>

                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" width="100%">
                    <TR>
                        <TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/><br/>

<%
ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("Rounds_By_Date");
%>

                            <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">
                                <FORM name="coderRankForm" action="/tc" method="get">
                                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="RatingSim"/>
                                <input type="hidden" name="postback" value="true"/>
                                <tr>
                                    <td class="bigRed" >
                                        <tc-webtag:errorIterator id="err" name="Contest"><%=err%><br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <TR>
                                    <TD >
                                        <SPAN CLASS="statTextBig"><B>Please select a round:</B><BR/></SPAN>
                                        <tc-webtag:rscSelect name="Contest" list="<%=rsc%>" fieldText="full_name" fieldValue="round_id"/>
                                    </TD>
                                </TR>

                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                  <tr>
                                    <td class="bigRed" >
                                        <tc-webtag:errorIterator id="err" name="Rating"><%=err%><br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <TR>
                                    <TD >
                                        <SPAN CLASS="statTextBig"><B>Rating:</B><BR/></SPAN>
                                        <tc-webtag:textInput name="Rating"  size="15" maxlength="50"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                <tr>
                                    <td class="bigRed" >
                                        <tc-webtag:errorIterator id="err" name="Vol"><%=err%><br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <TR>
                                    <TD >
                                        <SPAN CLASS="statTextBig"><B>Volatility:</B><BR/></SPAN>
                                        <tc-webtag:textInput name="Vol"  size="15" maxlength="50"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                <tr>
                                    <td class="bigRed" >
                                        <tc-webtag:errorIterator id="err" name="Division"><%=err%><br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <TR>
                                    <TD >
                                        <SPAN CLASS="statTextBig"><B>Division:</B><BR/></SPAN>
                                        <select name="Division">
                                            <option value="1">Division 1</option>
                                            <option <%if(request.getAttribute("Division") != null && request.getAttribute("Division").equals("2")) {%>selected<%}%> value="2">Division 2</option>
                                        </select>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                <tr>
                                    <td class="bigRed" >
                                        <tc-webtag:errorIterator id="err" name="Score"><%=err%><br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <TR>
                                    <TD >
                                        <SPAN CLASS="statTextBig"><B>Score:</B><BR/></SPAN>
                                        <tc-webtag:textInput name="Score"  size="15" maxlength="50"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                <TR><TD COLSPAN="18"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD></TR>
                                 <TR>
                                    <TD >
                                        <input type="submit" value="Run Simulation"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                <TR>
                                    <TD ><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/></TD>
                                </TR>
                                <%if(request.getAttribute("sim_results") != null) {%>
                                <TR>
                                    <TD >
                                        <SPAN CLASS="statTextBig">Your new rating would be: <%=request.getAttribute("sim_results")%></span>
                                    <BR/></TD>
                                </TR>
                                <%}%>
                            </TABLE>
                        </TD>
                    </TR>

                        <TR><TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                    </FORM>
                </TABLE>

                <p><br></p>
                <!-- END BODY -->

            </TD>

            <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>

            <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
                <jsp:include page="../public_right.jsp" />
            </TD>
            <!-- Gutter -->
            <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
        </TR>
    </TABLE>

    <jsp:include page="../foot.jsp" />
    </BODY>
</HTML>




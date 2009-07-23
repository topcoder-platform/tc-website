<%@ page import="java.util.Map"%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="java.util.List"%>
<%@ page import="com.topcoder.web.corp.common.TCESConstants"%>
<%@ page import="com.topcoder.web.common.model.ContractingResponseGroup"%>
<%@ page import="com.topcoder.web.common.model.ContractingResponse"%>
<%@ page import="com.topcoder.web.common.StringUtils"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"%>
<%@ taglib uri="tces-taglib.tld" prefix="tces" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="script.jsp"/>
</head>
<%
List prefList = (List)request.getAttribute("prefs");
List techList = (List)request.getAttribute("techSkills");
List dbList = (List)request.getAttribute("dbSkills");
List langList = (List)request.getAttribute("langSkills");
List osList = (List)request.getAttribute("osSkills");
List industryList = (List)request.getAttribute("industrySkills");
    ResultSetContainer info = (ResultSetContainer)((Map)request.getAttribute("memberData")).get("TCES_Member_Profile");
    ResultSetContainer jobInfo = (ResultSetContainer)((Map)request.getAttribute("memberData")).get("TCES_Position_Name");
%>
<body>

<!-- Header Begins -->
<jsp:include page="top.jsp">
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Header Ends -->


<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <TR valign="top">
        <td width="50%"><jsp:include page="left.jsp" /></td>
        <!-- Center Column Begins -->
      <td class="recruitingBody">
            <img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p>
                            <tces:trailIterator id="trailItem" trailList="<%=(List)request.getAttribute("trail")%>">
                                <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
                            </tces:trailIterator>
                            <br>
                            <span class="testHead">Coder Skill Set: <rsc:item name="handle" set="<%=info%>"/></span>
                            <br><br>
                        </p>
                    </td>
                </tr>
         <tr>
            <td class="bodyText" width="50%" valign="top">
            <strong>Name:</strong> <rsc:item name="first_name" set="<%=info%>"/> <rsc:item name="middle_name" set="<%=info%>"/> <rsc:item name="last_name" set="<%=info%>"/><br />
            <strong>Address:</strong><br>
                        <rsc:item name="address1" set="<%=info%>"/><br>
                        <%= info.getItem(0, "address2").toString().length()==0?"":info.getStringItem(0, "address2")+"<br>"%>
                        <%= info.getItem(0, "address3").toString().length()==0?"":info.getStringItem(0, "address3")+"<br>"%>
                        <%= info.getItem(0, "province").toString()%>
                        <%= info.getItem(0, "city").toString()%>,
                        <%= info.getItem(0, "state_code").toString()%>
                        <%= info.getItem(0, "zip").toString()%>
                        <%= info.getItem(0, "country_name").toString()%><br>
            <strong>Email:</strong> <a href="mailto:<%=info.getItem(0, "email").toString() %>" class="bodyText"><%= info.getItem(0, "email").toString() %></A><br>
            <strong>Phone:</strong> <%= info.getItem(0, "home_phone").toString()%><br>
                        <% if (String.valueOf(Boolean.TRUE).equals(request.getAttribute("has_resume"))) { %>
              <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.RESUME_DOWNLOAD_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>&amp;<%=TCESConstants.JOB_ID_PARAM%>=<%=request.getAttribute(TCESConstants.JOB_ID_PARAM)%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=request.getAttribute(TCESConstants.MEMBER_ID_PARAM)%>" class="bodyText"><B>Resume</B></a>
                        <% } %>
            <br><br>
            <strong>Interested in:</strong> <rsc:item name="job_desc" set="<%=jobInfo%>"/>
            <br><br>
<% if (String.valueOf(Boolean.TRUE).equals(request.getAttribute("is_ranked"))) { %>
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=request.getAttribute(TCESConstants.JOB_ID_PARAM)%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=request.getAttribute(TCESConstants.MEMBER_ID_PARAM)%>" class="bodyText">Coder Demographic Info</A>
            <br>
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=request.getAttribute(TCESConstants.JOB_ID_PARAM)%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=request.getAttribute(TCESConstants.MEMBER_ID_PARAM)%>" class="bodyText">Coder Competition History</A>
            <br>
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=request.getAttribute(TCESConstants.JOB_ID_PARAM)%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=request.getAttribute(TCESConstants.MEMBER_ID_PARAM)%>" class="bodyText">Coder Problem Submissions</A>
            <br>
            Coder Skill Set
            <br><br>
<% } %>
               </td>
            </tr>

                <tr>
                    <td class="bodyText" align="right">
                   <% if (String.valueOf(false).equals(request.getAttribute("isRestrictedCampaign"))) {%>
                        <A HREF="JavaScript:getGraph('/corp/graph?c=rating_history_graph&cr=<%=request.getAttribute(TCESConstants.MEMBER_ID_PARAM)%>&<%=TCESConstants.COMPANY_ID%>=<%=request.getAttribute(TCESConstants.COMPANY_ID)%>','800','600','history')" class="bodyText">Rating History Graph</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                   <% } %>
                        <A HREF="JavaScript:getGraph('/corp/graph?c=rating_distribution_graph&<%=TCESConstants.COMPANY_ID%>=<%=request.getAttribute(TCESConstants.COMPANY_ID)%>','600','400','distribution')" class="bodyText">Overall Rating Distribution Graph</a>
                    </td>
                </tr>
            </table>
<% if (String.valueOf(false).equals(request.getAttribute("hasInfo"))) {%>
            <p class="bodyText">Sorry, this candidate has not provided their skill set information.</p>
            <% } else { %>
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0px 30px 0px 0px;">
    <tr>
        <td valign="top" width="30%">
            <table border="0" width="100%" cellpadding="0" cellspacing="5" align="left">
                <tr>
                    <td align="right" class="bodyText"><b>Preferences</b></td>
                    <td class="bodyText"></td>
                </tr>
                <tc-webtag:listIterator id="prefGroup" list="<%=prefList%>">
                    <tr>
                        <td align="right" class="bodyText"><b><%=((ContractingResponseGroup)prefGroup).getName()%></b></td>
                        <td valign="top" class="bodyText">&#160;</td>
                     </tr>
                    <tc-webtag:listIterator id="pref" list="<%=((ContractingResponseGroup)prefGroup).getResponses()%>">
                        <tr>
                            <td align="right" class="bodyText"><%=((ContractingResponse)pref).getName()%>:</td>
                            <td valign="top" class="bodyText"><%=((ContractingResponse)pref).getVal()%></td>
                        </tr>
                    </tc-webtag:listIterator>
                    <tr><td>&#160;</td></tr>
                </tc-webtag:listIterator>
                <tr>
                    <td align="right" class="bodyText"><b>Technology Skills</b></td>
                    <td></td>
                </tr>
                <tc-webtag:listIterator id="tech" list="<%=techList%>">
                    <tr>
                        <td align="right" class="bodyText"><%=((ContractingResponse)tech).getName()%>:</td>
                        <td valign="top" class="bodyText"><%=((ContractingResponse)tech).getVal()%></td>
                    </tr>
                </tc-webtag:listIterator>
                <tr><td align="right" class="bodyText">Comment:</td><td></td></tr>
                <tr><td align="center" colspan="2" class="bodyText"><table cellpadding=3 cellspacing=5><tr><td bgcolor="#eeeeee"><%=StringUtils.htmlEncode((String)request.getAttribute("techNote"))%></td></tr></table></td></tr>

                <tr><td>&#160;</td></tr>

                <tr>
                    <td align="right" class="bodyText"><b>Databases</b></td>
                    <td valign="top" class="bodyText"></td>
                </tr>
                <tc-webtag:listIterator id="db" list="<%=dbList%>">
                    <tr>
                        <td align="right" class="bodyText"><%=((ContractingResponse)db).getName()%>:</td>
                        <td valign="top" class="bodyText"><%=((ContractingResponse)db).getVal()%></td>
                    </tr>
                </tc-webtag:listIterator>
                <tr><td align="right" class="bodyText">Comment:</td><td></td></tr>
                <tr><td align="center" colspan="2" class="bodyText"><table cellpadding=3 cellspacing=5><tr><td bgcolor="#eeeeee"><%=StringUtils.htmlEncode((String)request.getAttribute("dbNote"))%></td></tr></table></td></tr>
            </table>
        </td>
        
<td valign="top" width="5%">&#160;</td>

<td valign="top" width="30%">
<table border="0" width="100%" cellpadding="0" cellspacing="5" align="left">
    <tr>
        <td align="right" class="bodyText"><b>Language Skills</b></td>
        <td valign="top" class="bodyText"></td>
    </tr>
    <tc-webtag:listIterator id="lang" list="<%=langList%>">
      <tr>
        <td align="right" class="bodyText"><%=((ContractingResponse)lang).getName()%>:</td>
        <td valign="top" class="bodyText"><%=((ContractingResponse)lang).getVal()%></td>
    </tr>
    </tc-webtag:listIterator>
    <tr><td align="right" class="bodyText">Comment:</td><td></td></tr>
    <tr><td align="center" colspan="2" class="bodyText"><table cellpadding=3 cellspacing=5><tr><td bgcolor="#eeeeee"><%=StringUtils.htmlEncode((String)request.getAttribute("langNote"))%></td></tr></table></td></tr>

    <tr><td>&#160;</td></tr>

    <tr>
        <td align="right" class="bodyText"><b>Operating Systems</b></td>
        <td valign="top" class="bodyText"></td>
    </tr>
    <tc-webtag:listIterator id="os" list="<%=osList%>">
      <tr>
        <td align="right" class="bodyText"><%=((ContractingResponse)os).getName()%>:</td>
        <td valign="top" class="bodyText"><%=((ContractingResponse)os).getVal()%></td>
    </tr>
    </tc-webtag:listIterator>
    <tr><td align="right" class="bodyText">Comment:</td><td></td></tr>
    <tr><td align="center" colspan="2" class="bodyText"><table cellpadding=3 cellspacing=5><tr><td bgcolor="#eeeeee"><%=StringUtils.htmlEncode((String)request.getAttribute("osNote"))%></td></tr></table></td></tr>
    <tr><td>&#160;</td></tr>

    <tr>
        <td align="right" class="bodyText"><b>Industries</b></td>
        <td valign="top" class="bodyText"></td>
    </tr>
    <tc-webtag:listIterator id="industry" list="<%=industryList%>">
      <tr>
        <td align="right" class="bodyText"><%=((ContractingResponse)industry).getName()%>:</td>
        <td valign="top" class="bodyText"><%=((ContractingResponse)industry).getVal()%></td>
    </tr>
    </tc-webtag:listIterator>
    <tr><td align="right" class="bodyText">Comment:</td><td></td></tr>
    <tr><td align="center" colspan="2" class="bodyText"><table cellpadding="3" cellspacing="5"><tr><td bgcolor="#eeeeee"><%=StringUtils.htmlEncode((String)request.getAttribute("industryNote"))%></td></tr></table></td></tr>
</table>
</td>
</tr>
</table>
      <% } %>
</td>
      <td class=homeRightPromos width="50%"><jsp:include page="right.jsp" /></td>

</tr>
</table>
</td>
</tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

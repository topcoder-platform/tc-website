<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants,
                 java.util.HashMap,
                 com.topcoder.web.tc.model.ContractingResponse,
                 com.topcoder.web.tc.model.ContractingResponseGroup,
                 java.util.Iterator,
                 java.util.List" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contract</title>

<%
List prefList = (List)request.getAttribute("prefs");
List techList = (List)request.getAttribute("techSkills");
List dbList = (List)request.getAttribute("dbSkills");
List langList = (List)request.getAttribute("langSkills");
List osList = (List)request.getAttribute("osSkills");
List industryList = (List)request.getAttribute("industrySkills");
%>

<jsp:usebean id="contractingInfo" class="com.topcoder.web.tc.model.ContractingInfo" scope="request" />

</head>

<body>

        <table border=0 cellpadding=0 cellspacing=0 width="100%">
            <tr>
				<td align=left><p><a href="/report?t=new_report&c=placement_people&db=OLTP"><< back to placement registrants report</a></p></td>

            </tr>

            <tr>
				<td align=left><p><a href="/stat?c=member_profile&cr=<jsp:getProperty name="contractingInfo" property="userId" />">View Member Profile</a></p></td>

            </tr>
        </table>

        <table border=0 cellpadding=0 cellspacing=0 width="100%">
		    <tr>
		        <td valign=top width="50%">
		            <table width="100%" cellpadding="0" cellspacing="5" align="center" >
                        <tr>
                            <td align=right width="65%"><b>Preferences</b></td>
                            <td width="35%"></td>
                        </tr>
                        <tc:listIterator id="prefGroup" list="<%=prefList%>">
                            <tr>
                                <td align=right><b><%=((ContractingResponseGroup)prefGroup).getName()%></b></td>
                                <td valign=top>&#160;</td>
                             </tr>
                            <tc:listIterator id="pref" list="<%=((ContractingResponseGroup)prefGroup).getResponses()%>">
                                <tr>
                                    <td align=right><%=((ContractingResponse)pref).getName()%>:</td>
                                    <td valign=top><%=((ContractingResponse)pref).getVal()%></td>
                                </tr>
                            </tc:listIterator>
                        </tc:listIterator>
                        <tr>
                                <td align=right><b>Resume</b></td>
                                <td valign=top>&#160;</td>
                        </tr>
                        <tr>
                            <td valign=top align=center colspan=2>
                                <%if("true".equals(request.getAttribute("has_resume"))) {%>
                                    <a href="/tc?module=DownloadResume&<%=Constants.USER_ID%>=<jsp:getProperty name="contractingInfo" property="userId" />">Download resume</a>
                                <%} else { %>
                                    No resume on file.
                                <% } %>
                            </td>
                        </tr>
			            <tr><td>&#160;</td></tr>

                        <tr>
                            <td align=right><b>Technology Skills</b></td>
                            <td></td>
                        </tr>
                        <tc:listIterator id="tech" list="<%=techList%>">
                            <tr>
                                <td align=right><%=((ContractingResponse)tech).getName()%>:</td>
                                <td valign=top><%=((ContractingResponse)tech).getVal()%></td>
                            </tr>
                        </tc:listIterator>

            			<tr><td>&#160;</td></tr>

                        <tr>
                            <td align=right><b>Databases</b></td>
                            <td valign=top></td>
                        </tr>
                        <tc:listIterator id="db" list="<%=dbList%>">
                            <tr>
                                <td align=right><%=((ContractingResponse)db).getName()%>:</td>
                                <td valign=top><%=((ContractingResponse)db).getVal()%></td>
                            </tr>
                        </tc:listIterator>
		            </table>
		        </td>
		<td valign=top width="50%">
		<table width="100%" cellpadding="0" cellspacing="5" align="center" >
            <tr>
				<td align=right width="65%"><b>Language Skills</b></td>
				<td valign=top width="35%"></td>
            </tr>
            <tc:listIterator id="lang" list="<%=langList%>">
              <tr>
                <td align=right><%=((ContractingResponse)lang).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)lang).getVal()%></td>
            </tr>
            </tc:listIterator>

			<tr><td>&#160;</td></tr>

            <tr>
				<td align=right><b>Operating Systems</b></td>
				<td valign=top></td>
            </tr>
            <tc:listIterator id="os" list="<%=osList%>">
              <tr>
                <td align=right><%=((ContractingResponse)os).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)os).getVal()%></td>
            </tr>
            </tc:listIterator>
            <tr><td>&#160;</td></tr>

            <tr>
				<td align=right><b>Industries</b></td>
				<td valign=top></td>
            </tr>
            <tc:listIterator id="industry" list="<%=industryList%>">
              <tr>
                <td align=right><%=((ContractingResponse)industry).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)industry).getVal()%></td>
            </tr>
            </tc:listIterator>
		</table>
		</tr>
		</table>

</body>

</html>

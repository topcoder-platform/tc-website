<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants,
                 java.util.HashMap,
                 com.topcoder.web.tc.model.ContractingResponse,
                 com.topcoder.web.tc.model.ContractingResponseGroup,
                 java.util.Iterator,
                 com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Placement Registration</title>

<jsp:include page="../../../script.jsp" />

<%
List prefList = (List)request.getAttribute("prefs");
List techList = (List)request.getAttribute("techSkills");
List dbList = (List)request.getAttribute("dbSkills");
List langList = (List)request.getAttribute("langSkills");
List osList = (List)request.getAttribute("osSkills");
List industryList = (List)request.getAttribute("industrySkills");
%>

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="employmentOpps"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        <div class="myTCBody">

        <jsp:include page="../../page_title.jsp" >
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="registration"/>
        </jsp:include>

<!-- Breadcrumb-->
<script language="javascript">
        function goToPage(s)
        {
            document.frmConfirm.module.value = s;
            document.frmConfirm.submit();
        }
    </script>

		<FORM ACTION="/tc" METHOD=POST onSubmit="" name="frmConfirm">
		<input type="hidden" name="module" value="ContractingConfirm"/>
		<input type="hidden" name="previouspage" value="confirm" />

        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Confirm selections</span>
				<br/><br/>
				Please confirm that the information below is correct, then click SUBMIT.
				<br/><br/>
                <% if (!"true".equals(request.getAttribute("isEdit"))) { %>
				    <span class=bigRed>NOTE: You are not registered yet.  You MUST click SUBMIT at the bottom of this page to complete the registration.</span>
                <% }%>
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="confirm"/>
				</jsp:include>
				</td>
			</tr>
		</table>


        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
		<tr>
		<td valign=top width="50%">
		<table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center" >
            <tr>
				<td align=right width="65%"><b>Preferences</b></td>
				<td width="35%"><a href="javascript:goToPage('ContractingPreferences');">edit<a/></td>
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
                <td valign=top align=center colspan=2><%=request.getAttribute("resume")%></td>
            </tr>
			<tr><td>&#160;</td></tr>

            <tr>
				<td align=right><b>Technology Skills</b></td>
				<td><a href="javascript:goToPage('ContractingTechnologies');">edit<a/></td>
            </tr>
            <tc:listIterator id="tech" list="<%=techList%>">
              <tr>
                <td align=right><%=((ContractingResponse)tech).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)tech).getVal()%></td>
            </tr>
            </tc:listIterator>
            <% if (request.getAttribute("techNote")!=null && !request.getAttribute("techNote").equals("")) { %>
            <tr>
                <td align=left colspan=2 class=contractNote><strong>Comment:</strong><br/><%=StringUtils.htmlEncode((String)request.getAttribute("techNote"))%></td>
            </tr>
            <% } %>


			<tr><td>&#160;</td></tr>

            <tr>
				<td align=right><b>Databases</b></td>
				<td valign=top><a href="javascript:goToPage('ContractingDatabases');">edit<a/></td>
            </tr>
            <tc:listIterator id="db" list="<%=dbList%>">
              <tr>
                <td align=right><%=((ContractingResponse)db).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)db).getVal()%></td>
            </tr>
            </tc:listIterator>
            <% if (request.getAttribute("dbNote")!=null && !request.getAttribute("dbNote").equals("")) { %>
            <tr>
                <td align=left colspan=2 class=contractNote><strong>Comment:</strong><br/><%=StringUtils.htmlEncode((String)request.getAttribute("dbNote"))%></td>
            </tr>
            <% } %>
		</table>
		</td>
		<td valign=top width="50%">
		<table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center" >
            <tr>
				<td align=right width="65%"><b>Language Skills</b></td>
				<td valign=top width="35%"><a href="javascript:goToPage('ContractingLanguages');">edit<a/></td>
            </tr>
            <tc:listIterator id="lang" list="<%=langList%>">
              <tr>
                <td align=right><%=((ContractingResponse)lang).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)lang).getVal()%></td>
            </tr>
            </tc:listIterator>
            <% if (request.getAttribute("langNote")!=null && !request.getAttribute("langNote").equals("")) { %>
            <tr>
                <td align=left colspan=2 class=contractNote><strong>Comment:</strong><br/><%=StringUtils.htmlEncode((String)request.getAttribute("langNote"))%></td>
            </tr>
            <% } %>

			<tr><td>&#160;</td></tr>

            <tr>
				<td align=right><b>Operating Systems</b></td>
				<td valign=top><a href="javascript:goToPage('ContractingOS');">edit<a/></td>
            </tr>
            <tc:listIterator id="os" list="<%=osList%>">
              <tr>
                <td align=right><%=((ContractingResponse)os).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)os).getVal()%></td>
            </tr>
            </tc:listIterator>
            <% if (request.getAttribute("osNote")!=null && !request.getAttribute("osNote").equals("")) { %>
            <tr>
                <td align=left colspan=2 class=contractNote><strong>Comment:</strong><br/><%=StringUtils.htmlEncode((String)request.getAttribute("osNote"))%></td>
            </tr>
            <% } %>

            <tr><td>&#160;</td></tr>

            <tr>
				<td align=right><b>Industries</b></td>
				<td valign=top><a href="javascript:goToPage('ContractingIndustries');">edit<a/></td>
            </tr>
            <tc:listIterator id="industry" list="<%=industryList%>">
              <tr>
                <td align=right><%=((ContractingResponse)industry).getName()%>:</td>
                <td valign=top><%=((ContractingResponse)industry).getVal()%></td>
            </tr>
            </tc:listIterator>
            <% if (request.getAttribute("industryNote")!=null && !request.getAttribute("industryNote").equals("")) { %>
            <tr>
                <td align=left colspan=2 class=contractNote><strong>Comment:</strong><br/><%=StringUtils.htmlEncode((String)request.getAttribute("industryNote"))%></td>
            </tr>
            <% } %>
		</table>
		</tr>
		<tr><td colspan=2 align=center><br/><br/><a href="javascript:goToPage('ContractingSubmit');"><img src="/i/submit.jpg" border=0/></a></td></tr>
		</table>
		</form>

        </div>
		<p align=center class=bodyText><b>Please check to make sure that your information is up-to-date.</b></p>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>

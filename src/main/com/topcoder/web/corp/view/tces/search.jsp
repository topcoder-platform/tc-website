<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="java.util.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>

<%@ taglib uri="tces-taglib.tld" prefix="tces" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute("resultMap");
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
    ResultSetContainer demographic_questions = (ResultSetContainer)m.get("demographics_questions");
    ResultSetContainer skill_types = (ResultSetContainer)m.get("skill_types");
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer country = (ResultSetContainer)m.get("country_list_usa");
    ResultSetContainer notifications = (ResultSetContainer)m.get("notifications");
    Map selectedMap = (Map)request.getAttribute("selected");
    Map demoMap = (Map)request.getAttribute("demoMap");
    Map skillMap = (Map)request.getAttribute("skillMap");
    Map skillSetMap = (Map)request.getAttribute("skillSetMap");
%>

<jsp:useBean id="ProblemSubmissionsTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.ProblemSubmissionsTask"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <jsp:include page="script.jsp"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<!-- Header Begins -->
<jsp:include page="top.jsp">
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Header Ends -->

<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
<TR valign="top">
<td width="50%">
    <jsp:include page="left.jsp"/>
</td>
<!-- Center Column Begins -->
<td class=recruitingBody>
<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>


<FORM name="search" ACTION="/tc" METHOD="GET">
<input type="hidden" name="module" value="ProfileSearch"/>
<input type="hidden" name="t" value=""/>
<input type="hidden" name="order" value="1"/>
<input type="hidden" name="sort" value="1"/>
<table class="search">
<tr><td align="center" colspan="3">
    <a href="JavaScript:submitForm()">Submit</a>
</td></tr>
<tr>
<td valign="top" class="lefttop">
    <table class="search">
        <tr><td class="left">Show count only:</td><td class="right"><tc-webtag:chkBox name="count"/>
        </td></tr>
        <tr><td class="left">Case Sensitive:</td><td class="right">
            <tc-webtag:chkBox name="casesensitive"/></td></tr>
        <tr><td class="left">Handle: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="handle" size="15"/></td></tr>
        <tr><td class="left">E-Mail: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="email" size="15"/></td></tr>
        <tr><td class="left">First Name: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="firstname" size="15"/></td></tr>
        <tr><td class="left">Last Name: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="lastname" size="15"/></td></tr>
        <tr><td class="left">Zipcode: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="zipcode" size="5"/></td></tr>
        <tr><td class="left">City: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="city" size="15"/></td></tr>
        <tr><td class="left">Company: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="company" size="15"/></td></tr>
        <tr><td class="left">School: </td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="school" size="15"/></td></tr>
        <tr><td class="left">State:<br/><a href="JavaScript:deselect('states')">Deselect</a></td>
            <td class="right">
                <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="state_code" fieldText="state_name" name="states" multiple="true" size="5" useTopValue="false" list="<%=states%>" selected='<%=(Set)selectedMap.get("states")%>'/>
            </td></tr>
        <tr><td class="left">Country:<br/><a href="JavaScript:deselect('country')">Deselect</a></td>
            <td class="right">
                <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="country_code" fieldText="country_name" name="country" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("country")%>'/>
            </td></tr>
        <tr><td class="left">Country of origin:<br/><a href="JavaScript:deselect('countryoforigin')">Deselect</a>
        </td><td class="right">
            <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="country_code" fieldText="country_name" name="countryoforigin" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("countryoforigin")%>'/>
        </td></tr>
        <tr><td class="left">Professional: </td><td class="right"><tc-webtag:chkBox name="pro"/></td></tr>
        <tr><td class="left"> Student: </td><td class="right"><tc-webtag:chkBox name="stud"/></td></tr>
        <tr><td class="left">Languages: </td><td class="right">
            <rsc:iterator list="<%=languages%>" id="resultRow">
                <rsc:item name="language_name" row="<%=resultRow%>"/>:
                <tc-webtag:chkBox name='<%="lang_"+resultRow.getIntItem("language_id")%>'/>
                <br/>
            </rsc:iterator>
        </td></tr>
        <tr><td class="left">Max days since last rating:</td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdayssincerating" size="5"/></td>
        </tr>
        <tr><td class="left">Min events:</td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minevents" size="5"/></td></tr>
        <tr><td class="left">Days since registration:</td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindays" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdays" size="5"/></td></tr>
        <tr><td class="left">Algorithm Rating range:</td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxrating" size="5"/></td></tr>
        <tr><td class="left">Design Rating range:</td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindesrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdesrating" size="5"/></td></tr>
        <tr><td class="left">Dev. Rating range:</td><td class="right">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindevrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdevrating" size="5"/></td></tr>
        <tr><td class="left">Placement Indicator: </td><td class="right"><select name="placement">
            <option value="none"<%= "none".equals(request.getParameter("placement")) ? " selected" : "" %>>
                No preference</option>
            <option value="either"<%= "either".equals(request.getParameter("placement")) ? " selected" : "" %>>
                Either</option>
            <option value="contract"<%= "contract".equals(request.getParameter("placement")) ? " selected" : "" %>>
                Contract</option>
            <option value="full"<%= "full".equals(request.getParameter("placement")) ? " selected" : "" %>>
                Full time</option>
        </select>
        </td></tr>
        <tr><td class="left">Resume:</td><td class="right"><tc-webtag:chkBox name="resume"/></td></tr>
        <tr><td class="left">Willing to travel/relocate:</td><td class="right">
            <tc-webtag:chkBox name="travel"/></td></tr>
        <tr><td class="left">US Authorization:</td><td class="right"><tc-webtag:chkBox name="auth"/></td>
        </tr>
        <tr><td class="left">Notifications:<br/><a href="JavaScript:deselect('notifications')">Deselect</a>
        </td><td class="right">
            <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="notify_id" fieldText="name" name="notifications" size="5" useTopValue="false" list="<%=notifications%>" multiple="true" selected='<%=(Set)selectedMap.get("notifications")%>'/>
        </td></tr>
    </table>
</td>
<td valign="top" class="centertop">
    <table class="search">
        <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
            <tr><td class="left">
                <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:<br/>
                <a href="JavaScript:deselect('demo_<rsc:item name=" demographic_question_id" row="<%=resultRow%>"/>')">Deselect</a>
            </td><td class="right">
                <% int questionId = resultRow.getIntItem("demographic_question_id");%>
                <tc-webtag:listSelect styleClass="multiSel2" name='<%="demo_"+questionId%>' size="<%=String.valueOf(Math.min(4,((List)demoMap.get(new Integer(questionId))).size()))%>" useTopValue="false" multiple="true" list="<%=(List)demoMap.get(new Integer(questionId))%>"/>
            </td></tr>
        </rsc:iterator>
    </table>
</td>
<td class="righttop" valign="top">
    <table class="search">
        <rsc:iterator list="<%=skill_types%>" id="resultRow">
            <tr><td nowrap>
                <rsc:item name="skill_type_desc" row="<%=resultRow%>"/>:<br/>
                <% int skillType = resultRow.getIntItem("skill_type_id");%>
                <tc-webtag:listSelect styleClass="multiSel3" name='<%="skilltype"+skillType%>' useTopValue="false" multiple="true" size="12" list="<%=(List)skillMap.get(new Integer(skillType))%>"/>
                <select size="12" name="skilllevel<rsc:item name=" skill_type_id" row="<%=resultRow%>"/>">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                <tc-webtag:listSelect styleClass="multiSel3" name='<%="skillset"+skillType%>' multiple="true" useTopValue="false" multiple="true" size="12" list='<%=(List)skillSetMap.get("skillset"+skillType)%>'/>
            </td>
                <td>
                    <a href="JavaScript:itemAdd('skilltype<rsc:item name=" skill_type_id" row="<%=resultRow%>"/>','skilllevel< rsc:item name=" skill_type_id" row="<%=resultRow%>"/>','skillset
                        <rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</ a>
                        <br/>
                        <a href="JavaScript:remove('skillset<rsc:item name=" skill_type_id" row="<%=resultRow%>"/>')">Remove
                            skills</a>
                        <br/>
                        <a href="JavaScript:clear('skillset<rsc:item name=" skill_type_id" row="<%=resultRow%>"/>')">Clear</a>
                </td>
            </tr>
        </rsc:iterator>
        <tr><td></td></tr>
    </table>
</td>
<tr><td align="center" colspan="3">
    <a href="/tc?module=ProfileSearch&t=profile_search">Start over</a> |
    <a href="JavaScript:submitForm()">Submit</a>
</td></tr></table>
</FORM>


<p><br></p>
</td>
<!-- Center Column Ends -->
<td class=homeRightPromos width="50%">
    <jsp:include page="right.jsp"/>
</td>
</tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

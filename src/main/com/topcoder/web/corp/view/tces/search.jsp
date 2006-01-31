<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="java.util.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="com.topcoder.web.corp.common.TCESConstants"%>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%
    Map m = (Map)request.getAttribute("resultMap");
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
    ResultSetContainer demographic_questions = (ResultSetContainer)m.get("tces_demographic_questions");
    ResultSetContainer skill_types = (ResultSetContainer)m.get("skill_types");
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer country = (ResultSetContainer)m.get("country_list_usa");
    Map selectedMap = (Map)request.getAttribute("selected");
    Map demoMap = (Map)request.getAttribute("demoMap");
    Map skillMap = (Map)request.getAttribute("skillMap");
    Map skillSetMap = (Map)request.getAttribute("skillSetMap");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>TopCoder | Recruiting Reports</title>
    <jsp:include page="script.jsp"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script language="javascript">
<!--
    function remove( a ){
        var i;
        var j = 0;
        for(i = 0; i<document.search[a].length; i++){
            if(document.search[a].options[i].selected){
                document.search[a].options[i] = null;
                i--;
            }
        }
    }
    function itemAdd( a, b, c)
    {
        var i;
        var j = document.search[b].selectedIndex;
        for(i = 0; i<document.search[a].length; i++){
            if(document.search[a].options[i].selected){
                var len = document.search[c].length;
                var val1 = document.search[a].options[i].value;
                var text1 = document.search[a].options[i].text;
                var text2 = document.search[b].options[j].text;
                op = new Option();
                op.value = val1+"_"+text2+"_"+text1;
                op.text = text1+" >= "+text2;
                document.search[c].options[len] = op;
            }
        }
    }
    function submitForm(){
        var list;
        <rsc:iterator list="<%=skill_types%>" id="resultRow">
        list = document.search.skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>;
        for (i=0; i<list.options.length; i++){
            list.options[i].selected=true;
        }
        </rsc:iterator>
        <rsc:iterator list="<%=skill_types%>" id="resultRow">
        deselect('skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>');
        deselect('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>');
        </rsc:iterator>
        document.search.submit();
    }F
    function deselect( a ){
        var i;
        for(i = 0; i<document.search[a].length; i++){
            document.search[a].options[i].selected = false;
        }
    }
    function clear( a ){
        var i;
        for(; document.search[a].length; ){
            document.search[a].options[0] = null;
        }
    }
    function submitEnter(e) {
      var keycode;
      if (window.event) keycode = window.event.keyCode;
      else if (e) keycode = e.which;
      else return true;
      if (keycode == 13) {
        submitForm();
        return false;
      } else return true;
    }

    -->
</script>
</head>

<body>

<!-- Header Begins -->
<jsp:include page="top.jsp">
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Header Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<TR valign="top">

<!-- Center Column Begins -->
<td style="padding: 11px 40px 0px 40px;" class="bodyText">
<p>
    <tces:trailIterator id="trailItem" trailList="<%=(List)request.getAttribute("trail")%>">
        <a href="<jsp:getProperty name="trailItem" property="href" />" class="bodyText"><jsp:getProperty name="trailItem" property="name" /></a> &gt;
    </tces:trailIterator>
</p>
<p>
    <span class=testHead>Campaign:</span>&#160;<%=request.getAttribute("campaignName")%>

</p>

<FORM name="search" ACTION="<jsp:getProperty name="sessionInfo" property="servletPath"/>" METHOD="GET">
<tc-webtag:hiddenInput name="<%=TCESConstants.TASK_PARAM%>" value="SearchTask"/>
<tc-webtag:hiddenInput name="<%=TCESConstants.CAMPAIGN_ID_PARAM%>"/>

<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tr><td align="center" colspan="5" class="bodyText" style="padding: 0px 0px 10px 0px;">
    <a href="JavaScript:submitForm()"><strong>Submit</strong></a>
</td></tr>
<tr class="bodyText">
<td valign="top" width="29%">
   <table cellspacing="0" cellpadding="2" class="screeningFrameNB">
        <tr><td class="bodyText">Case Sensitive:</td><td >
            <tc-webtag:chkBox name="casesensitive"/></td></tr>
        <tr><td class="bodyText">Handle: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="handle" size="15"/></td></tr>
        <tr><td class="bodyText">E-Mail: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="email" size="15"/></td></tr>
        <tr><td class="bodyText">First Name: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="firstname" size="15"/></td></tr>
        <tr><td class="bodyText">Last Name: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="lastname" size="15"/></td></tr>
        <tr><td class="bodyText">Zipcode: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="zipcode" size="5"/></td></tr>
        <tr><td class="bodyText">City: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="city" size="15"/></td></tr>
        <tr><td class="bodyText">School: </td><td >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="school" size="15"/></td></tr>
        <tr><td class="bodyText">State:<br/><a href="JavaScript:deselect('states')">Deselect</a></td>
            <td class="bodyText" >
                <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="state_code" fieldText="state_name" name="states" multiple="true" size="5" useTopValue="false" list="<%=states%>" selected='<%=(Set)selectedMap.get("states")%>'/>
            </td></tr>
        <tr><td class="bodyText">Country:<br/><a href="JavaScript:deselect('country')">Deselect</a></td>
            <td class="bodyText" >
                <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="country_code" fieldText="country_name" name="country" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("country")%>'/>
            </td></tr>
        <tr><td class="bodyText">Country of origin:<br/><a href="JavaScript:deselect('countryoforigin')">Deselect</a>
        </td><td class="bodyText" >
            <tc-webtag:multiRSCSelect styleClass="multiSel1" fieldValue="country_code" fieldText="country_name" name="countryoforigin" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("countryoforigin")%>'/>
        </td></tr>
        <tr><td class="bodyText">Professional: </td><td class="bodyText" ><tc-webtag:chkBox name="pro"/></td></tr>
        <tr><td class="bodyText">Student: </td><td class="bodyText" ><tc-webtag:chkBox name="stud"/></td></tr>
        <tr><td class="bodyText">Languages: </td>
        <td class="bodyText" >
            <rsc:iterator list="<%=languages%>" id="resultRow">
                <rsc:item name="language_name" row="<%=resultRow%>"/>:
                <tc-webtag:chkBox name='<%="lang_"+resultRow.getIntItem("language_id")%>'/>
                <br/>
            </rsc:iterator>
        </td></tr>
        <tr><td class="bodyText" style="padding: 2px 0px 3px 0px;">Max days since last rating:</td><td class="bodyText" >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdayssincerating" size="5"/></td>
        </tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Min events:</td><td class="bodyText" >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minevents" size="5"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Days since registration:</td>
            <td class="bodyText" >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindays" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdays" size="5"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Algorithm Rating range:</td>
            <td class="bodyText" >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxrating" size="5"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Design Rating range:</td>
            <td class="bodyText" >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindesrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdesrating" size="5"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Dev. Rating range:</td>
            <td class="bodyText" >
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindevrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdevrating" size="5"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Resume:</td><td ><tc-webtag:chkBox name="resume"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">Willing to travel/relocate:</td><td >
            <tc-webtag:chkBox name="travel"/></td></tr>
        <tr><td class="bodyText" style="padding: 3px 0px 3px 0px;">US Authorization:</td><td ><tc-webtag:chkBox name="auth"/></td>
        </tr>
    </table>
</td>

<td valign="top" class="bodyText" width="1%">&#160;&#160;&#160;&#160;&#160;</td>

<td valign="top" class="bodyText" width="29%">
   <table cellspacing="0" cellpadding="2" class="screeningFrameNB">
        <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
            <tr><td class="bodyText">
                <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:<br/>
                <a href="JavaScript:deselect('demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>')">Deselect</a>
            </td><td class="bodyText">
                <% long questionId = resultRow.getIntItem("demographic_question_id");%>
                <tc-webtag:listSelect styleClass="multiSel2" name='<%="demo_"+questionId%>' size="<%=String.valueOf(Math.min(4,((List)demoMap.get(new Long(questionId))).size()))%>" useTopValue="false" multiple="true" list="<%=(List)demoMap.get(new Long(questionId))%>"/>
            </td></tr>
        </rsc:iterator>
    </table>
</td>

<td valign="top" class="bodyText" width="1%">&#160;&#160;&#160;&#160;&#160;</td>

<td valign="top" width="40%">
   <table cellspacing="0" cellpadding="2" class="screeningFrameNB">
        <rsc:iterator list="<%=skill_types%>" id="resultRow">
            <tr><td nowrap class="bodyText">
                <rsc:item name="skill_type_desc" row="<%=resultRow%>"/>:<br/>
                <% int skillType = resultRow.getIntItem("skill_type_id");%>
                <tc-webtag:listSelect styleClass="multiSel3" name='<%="skilltype"+skillType%>' useTopValue="false" multiple="true" size="12" list="<%=(List)skillMap.get(new Integer(skillType))%>"/>
                <select size="12" name="skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                <tc-webtag:listSelect styleClass="multiSel3" name='<%="skillset"+skillType%>' multiple="true" useTopValue="false" multiple="true" size="12" list='<%=(List)skillSetMap.get("skillset"+skillType)%>'/>
            </td>
               <td class="bodyText">
                    <a href="JavaScript:itemAdd('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skilllevel< rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</ a>
                        <br/>
                        <a href="JavaScript:remove('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Remove
                            skills</a>
                        <br/>
                        <a href="JavaScript:clear('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Clear</a>
                </td>
            </tr>
        </rsc:iterator>
        <tr><td></td></tr>
    </table>
</td>
<tr><td align="center" colspan="5" class="bodyText">
    <a href="/tc?module=ProfileSearch&t=profile_search"><strong>Start over</strong></a> |
    <a href="JavaScript:submitForm()"><strong>Submit</strong></a>
</td></tr></table>
</FORM>


<p><br></p>
</td>
<!-- Center Column Ends -->
</tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

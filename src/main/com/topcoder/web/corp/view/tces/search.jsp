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
    }
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
<style type="text/css">
.multiChoice
{
   color: #000;
   font-size: 11px;
   font-weight: normal;
}
.multiChoice2
{
   color: #000;
   font-size: 11px;
   font-weight: normal;
}
.multiChoice3
{
   width: 350px;
   color: #000;
   font-size: 11px;
   font-weight: normal;
}
.select1, .select2, .select3
{
color: #000;
font-size: 10px;
font-weight: normal;
}
.select1{ width: 300px; }
.select3{ width: 320px; }
</style>
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
    <a href="<%=sessionInfo.getServletPath()%>?module=ViewSearchTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>"><strong>Start Over</strong></a> |
    <a href="JavaScript:submitForm()"><strong>Submit</strong></a>
</td></tr>
<tr class="bodyText">
<td valign="top" width="33%">
   <table cellspacing="0" cellpadding="0" class="screeningFrame" width="100%">
        <tr><td class="screeningCellEven" width="50%">Case Sensitive:</td><td class="screeningCellEven" width="50%">
            <tc-webtag:chkBox name="casesensitive"/></td></tr>
        <tr><td class="screeningCellOdd">Handle: </td><td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="handle" size="15"/></td></tr>
        <tr><td class="screeningCellEven">E-Mail: </td><td class="screeningCellEven">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="email" size="15"/></td></tr>
        <tr><td class="screeningCellOdd">First Name: </td><td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="firstname" size="15"/></td></tr>
        <tr><td class="screeningCellEven">Last Name: </td><td class="screeningCellEven">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="lastname" size="15"/></td></tr>
        <tr><td class="screeningCellOdd">Zipcode: </td><td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="zipcode" size="5"/></td></tr>
        <tr><td class="screeningCellEven">City: </td><td class="screeningCellEven">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="city" size="15"/></td></tr>
        <tr><td class="screeningCellOdd">School: </td><td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="school" size="15"/></td></tr>
        <tr><td class="screeningCellEven">State:<br/><a href="JavaScript:deselect('states')">Deselect</a></td>
            <td class="screeningCellEven">
                <tc-webtag:multiRSCSelect styleClass="multiChoice" fieldValue="state_code" fieldText="state_name" name="states" multiple="true" size="5" useTopValue="false" list="<%=states%>" selected='<%=(Set)selectedMap.get("states")%>'/>
            </td></tr>
        <tr><td class="screeningCellOdd">Country:<br/><a href="JavaScript:deselect('country')">Deselect</a></td>
            <td class="screeningCellOdd">
                <tc-webtag:multiRSCSelect styleClass="multiChoice" fieldValue="country_code" fieldText="country_name" name="country" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("country")%>'/>
            </td></tr>
        <tr><td class="screeningCellEven">Country of origin:<br/><a href="JavaScript:deselect('countryoforigin')">Deselect</a>
        </td><td class="screeningCellEven">
            <tc-webtag:multiRSCSelect styleClass="multiChoice" fieldValue="country_code" fieldText="country_name" name="countryoforigin" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("countryoforigin")%>'/>
        </td></tr>
        <tr><td class="screeningCellOdd">Professional: </td><td class="screeningCellOdd"><tc-webtag:chkBox name="pro"/></td></tr>
        <tr><td class="screeningCellEven">Student: </td><td class="screeningCellEven"><tc-webtag:chkBox name="stud"/></td></tr>
        <tr><td class="screeningCellOdd">Languages: </td>
            <td class="screeningCellOdd">
            <rsc:iterator list="<%=languages%>" id="resultRow">
                <rsc:item name="language_name" row="<%=resultRow%>"/>:
                <tc-webtag:chkBox name='<%="lang_"+resultRow.getIntItem("language_id")%>'/>
                <br/>
            </rsc:iterator>
        </td></tr>
        <tr><td class="screeningCellEven">Max days since last rating:</td><td class="screeningCellEven">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdayssincerating" size="5"/></td>
        </tr>
        <tr><td class="screeningCellOdd">Min events:</td><td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minevents" size="5"/></td></tr>
        <tr><td class="screeningCellEven">Days since registration:</td>
            <td class="screeningCellEven">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindays" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdays" size="5"/></td></tr>
        <tr><td class="screeningCellOdd">Algorithm Rating range:</td>
            <td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxrating" size="5"/></td></tr>
        <tr><td class="screeningCellEven">Design Rating range:</td>
            <td class="screeningCellEven">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindesrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdesrating" size="5"/></td></tr>
        <tr><td class="screeningCellOdd">Dev. Rating range:</td>
            <td class="screeningCellOdd">
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindevrating" size="5"/> to
            <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdevrating" size="5"/></td></tr>
        <tr><td class="screeningCellEven">Resume:</td><td class="screeningCellEven"><tc-webtag:chkBox name="resume"/></td></tr>
        <tr><td class="screeningCellOdd">Willing to travel/relocate:</td><td class="screeningCellOdd">
            <tc-webtag:chkBox name="travel"/></td></tr>
        <tr><td class="screeningCellEven">US Authorization:</td><td class="screeningCellEven"><tc-webtag:chkBox name="auth"/></td>
        </tr>
    </table>
</td>
<td valign="top" class="bodyText" width="33%" style="padding: 0px 15px 0px 15px;">
   <table cellspacing="0" cellpadding="0" class="screeningFrame" width="100%">
        <%boolean even = true;%>
        <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
            <tr><td class="<%=even?"screeningCellEven":"screeningCellOdd"%>">
                <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:<br/>
                <a href="JavaScript:deselect('demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>')">Deselect</a>
                <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>">
                <% long questionId = resultRow.getIntItem("demographic_question_id");%>
                <tc-webtag:listSelect styleClass="multiChoice2" name='<%="demo_"+questionId%>' size="<%=String.valueOf(Math.min(4,((List)demoMap.get(new Long(questionId))).size()))%>" useTopValue="false" multiple="true" list="<%=(List)demoMap.get(new Long(questionId))%>"/>
            </td></tr>
        <%even=!even;%>
        </rsc:iterator>
    </table>
    </div>
</td>
<td valign="top" width="33%">
   <table cellspacing="0" cellpadding="0" class="screeningFrame" width="100%">
        <%even = true;%>
        <rsc:iterator list="<%=skill_types%>" id="resultRow">
            <tr><td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" colspan="2">
               <strong><rsc:item name="skill_type_desc" row="<%=resultRow%>"/>:</strong>
            </td></tr>
            <tr valign="top">
                <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>">
                <span class="smallText">Skill</span><br>
                <% int skillType = resultRow.getIntItem("skill_type_id");%>
                <tc-webtag:listSelect styleClass="select1" name='<%="skilltype"+skillType%>' useTopValue="false" multiple="true" size="5" list="<%=(List)skillMap.get(new Integer(skillType))%>"/>
                </td>
                <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" nowrap="nowrap" align="center">
                <span class="smallText">Min Level</span><br>
                <select class="select2" size="5" name="skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                </td>
            </tr>
            <tr>
                <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" colspan="2" align="center">
                  <span class="smallText">Your criteria:</span><br>
                <tc-webtag:listSelect styleClass="select3" name='<%="skillset"+skillType%>' multiple="true" useTopValue="false" multiple="true" size="3" list='<%=(List)skillSetMap.get("skillset"+skillType)%>'/>
                </td>
            </tr>
            <tr>
                <td class="<%=even?"screeningCellEven":"screeningCellOdd"%>" colspan="2" align="center" valign="top">
                    <a href="JavaScript:itemAdd('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skilllevel< rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</a>&#160;|&#160;
                    <a href="JavaScript:remove('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Remove selected skill(s)</a>&#160;|&#160;
                    <a href="JavaScript:clear('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Clear all</a>
                </td>
            </tr>
        <%even=!even;%>
        </rsc:iterator>
    </table>
</td>
<tr><td align="center" colspan="5" class="bodyText">
    <a href="<%=sessionInfo.getServletPath()%>?module=ViewSearchTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=request.getAttribute(TCESConstants.CAMPAIGN_ID_PARAM)%>"><strong>Start Over</strong></a> |
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



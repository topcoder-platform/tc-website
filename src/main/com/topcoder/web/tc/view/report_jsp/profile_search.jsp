<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
    ResultSetContainer demographic_questions = (ResultSetContainer)m.get("demographics_questions");
    ResultSetContainer skill_types = (ResultSetContainer)m.get("skill_types");
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer country = (ResultSetContainer)m.get("country_list_usa");
    Map selectedMap = (Map)request.getAttribute("selected");
    Map demoMap = (Map)request.getAttribute("demoMap");
    Map skillMap = (Map)request.getAttribute("skillMap");
    Map skillSetMap = (Map)request.getAttribute("skillSetMap");
%>


<html>
  <head>
<style type="text/css">
	.search {font-size: 8pt; }
	.search SELECT{font-size: 8pt; }
	.search INPUT{font-size: 8pt; }
	.left{text-align: right; BORDER-RIGHT: #DDDDDD 1px solid; padding-right: 3px;}
	.right{text-align: left; padding-left: 2px; }
	.lefttop{text-align: right; BORDER-RIGHT: #999999 2px solid; padding-right: 10px;}
	.centertop{text-align: right; padding-right: 8px; padding-left: 10px}
	.righttop{text-align: right; BORDER-LEFT: #999999 2px solid; padding-left: 10px;}
	.multiSel1{width:12em;}
	.multiSel2{width:15em;}
	.multiSel3{width:12em;}
    A:link {
	    COLOR: #4444bb; TEXT-DECORATION: none
    }
    A:visited {
	    COLOR: #4444bb; TEXT-DECORATION: none
    }
    A:active {
	    COLOR: #7777FF; TEXT-DECORATION: none
    }
    A:hover {
	    COLOR: #7777FF; TEXT-DECORATION: none
    }

</style>
    <title>TopCoder Reporting</title>
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
  </head>
  <body>
<h4 align="center">Advanced Member Search</h4>
  <FORM name="search" ACTION="/tc" METHOD="GET">
    <input type="hidden" name="module" value="ProfileSearch"/>
    <input type="hidden" name="t" value=""/>
    <input type="hidden" name="order" value="1"/>
    <input type="hidden" name="sort" value="1"/>
<table class="search"><tr><td align="center" colspan="3">
  <A HREF="<%=Constants.SERVLET_ADDR%>">&lt;&lt; back to main menu</A> |
  <a href="/tc?module=LegacyReport&t=profile_search">Start over</a> |
  <a href="JavaScript:submitForm()">Submit</a>
</td></tr><tr><td valign="top" class="lefttop">
    <table class="search">
      <tr><td class="left">Show count only:</td><td class="right"> <tc-webtag:chkBox onKeyPress="submitEnter(event)" name="count"/></td></tr>
      <tr><td class="left">Handle: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="handle" size="15"/></td></tr>
      <tr><td class="left">E-Mail: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="email" size="15"/></td></tr>
      <tr><td class="left">First Name: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="firstname" size="15"/></td></tr>
      <tr><td class="left">Last Name: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="lastname" size="15"/></td></tr>
      <tr><td class="left">Zipcode: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="zipcode" size="5"/></td></tr>
      <tr><td class="left">City: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="city" size="15"/></td></tr>
      <tr><td class="left">Company: </td><td class="right"><tc-webtag:textInput onKeyPress="submitEnter(event)" name="company" size="15"/></td></tr>
      <tr><td class="left">State:<br/><a href="JavaScript:deselect('states')">Deselect</a> </td><td class="right"><tc-webtag:multiRSCSelect class="multiSel1" fieldValue="state_code" fieldText="state_name" name="states" multiple="true" size="5" useTopValue="false" list="<%=states%>" selected='<%=(Set)selectedMap.get("states")%>'/></td></tr>
      <tr><td class="left">Country:<br/><a href="JavaScript:deselect('country')">Deselect</a> </td><td class="right"><tc-webtag:multiRSCSelect class="multiSel1" fieldValue="country_code" fieldText="country_name" name="country" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("country")%>'/></td></tr>
      <tr><td class="left">Country of origin:<br/><a href="JavaScript:deselect('countryoforigin')">Deselect</a> </td><td class="right"><tc-webtag:multiRSCSelect class="multiSel1" fieldValue="country_code" fieldText="country_name" name="countryoforigin" multiple="true" size="5" useTopValue="false" list="<%=country%>" selected='<%=(Set)selectedMap.get("countryoforigin")%>'/></td></tr>
      <tr><td class="left">Professional: </td><td class="right"><tc-webtag:chkBox name="pro"/></tr></tr>
      <tr><td class="left"> Student: </td><td class="right"><tc-webtag:chkBox name="stud"/></td></tr>
      <tr><td class="left">Languages: </td><td class="right">
        <rsc:iterator list="<%=languages%>" id="resultRow">
          <rsc:item name="language_name" row="<%=resultRow%>"/>:
          <tc-webtag:chkBox name='<%="lang_"+resultRow.getIntItem("language_id")%>'/>
          <br/>
        </rsc:iterator>
      </td></tr>
      <tr><td class="left">Max days since last rating:</td><td class="right"> <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdayssincerating" size="5"/></td></tr>
      <tr><td class="left">Min events:</td><td class="right"> <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minevents" size="5"/></td></tr>
      <tr><td class="left">Days since registration:</td><td class="right"> <tc-webtag:textInput onKeyPress="submitEnter(event)" name="mindays" size="5"/> to <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxdays" size="5"/></td></tr>
      <tr><td class="left">Algorithm Rating range:</td><td class="right"> <tc-webtag:textInput onKeyPress="submitEnter(event)" name="minrating" size="5"/> to <tc-webtag:textInput onKeyPress="submitEnter(event)" name="maxrating" size="5"/></td></tr>
      <tr><td class="left">Placement Indicator: </td><td class="right"><select name="placement">
      <option value="none"<%= "none".equals(request.getParameter("placement")) ? " selected" : "" %>>No preference</option>
      <option value="either"<%= "either".equals(request.getParameter("placement")) ? " selected" : "" %>>Either</option>
      <option value="contract"<%= "contract".equals(request.getParameter("placement")) ? " selected" : "" %>>Contract</option>
      <option value="full"<%= "full".equals(request.getParameter("placement")) ? " selected" : "" %>>Full time</option>
      </select>
      </td></tr>
      <tr><td class="left">Resume:</td><td class="right"> <tc-webtag:chkBox name="resume"/></td></tr>
      <tr><td class="left">Willing to travel/relocate:</td><td class="right"> <tc-webtag:chkBox name="travel"/></td></tr>
      <tr><td class="left">US Authorization:</td><td class="right"> <tc-webtag:chkBox name="auth"/></td></tr>
</table></td><td valign="top" class="centertop">
<table class="search">
      <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
        <tr><td class="left">
        <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:<br/>
        <a href="JavaScript:deselect('demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>')">Deselect</a>
        </td><td class="right">
        <% int questionId = resultRow.getIntItem("demographic_question_id");%>
        <tc-webtag:listSelect class="multiSel2" name='<%="demo_"+questionId%>' size="<%=String.valueOf(Math.min(4,((List)demoMap.get(new Integer(questionId))).size()))%>" useTopValue="false" multiple="true" list="<%=(List)demoMap.get(new Integer(questionId))%>"/>
        </td></tr>
      </rsc:iterator>
</table></td><td class="righttop" valign="top"><table class="search">
      <rsc:iterator list="<%=skill_types%>" id="resultRow">
        <tr><td nowrap>
        <rsc:item name="skill_type_desc" row="<%=resultRow%>"/>:<br/>
        <% int skillType = resultRow.getIntItem("skill_type_id");%>
        <tc-webtag:listSelect class="multiSel3" name='<%="skilltype"+skillType%>' useTopValue="false" multiple="true" size="12" list="<%=(List)skillMap.get(new Integer(skillType))%>"/>
        <select size="12" name="skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        </select>
        <tc-webtag:listSelect class="multiSel3" name='<%="skillset"+skillType%>' multiple="true" useTopValue="false" multiple="true" size="12" list='<%=(List)skillSetMap.get("skillset"+skillType)%>'/>
        </td><td>
        <a href="JavaScript:itemAdd('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</a><br/>
        <a href="JavaScript:remove('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Remove skills</a><br/>
        <a href="JavaScript:clear('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Clear</a>
        </td></tr>
      </rsc:iterator>
      <tr><td></td></tr>
    </table>
</td><tr><td align="center" colspan="3">
  <A HREF="<%=Constants.SERVLET_ADDR%>">&lt;&lt; back to main menu</A> |
  <a href="/tc?module=LegacyReport&t=profile_search">Start over</a> |
  <a href="JavaScript:submitForm()">Submit</a>
</td></tr></table>
  </FORM>
  </body>
</html>




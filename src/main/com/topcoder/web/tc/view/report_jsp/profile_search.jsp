<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="web" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
    ResultSetContainer demographic_questions = (ResultSetContainer)m.get("demographics_questions");
    ResultSetContainer skill_types = (ResultSetContainer)m.get("skill_types");
    Map selected = (Map)request.getAttribute("selected");
    Map demoMap = (Map)request.getAttribute("demoMap");
    Map skillMap = (Map)request.getAttribute("skillMap");
    Map skillSetMap = (Map)request.getAttribute("skillSetMap");
%>
  <FORM name="search" ACTION="/tc" METHOD="GET">


<html>
  <head>
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
    -->
</script>
  </head>
  <body>
    <input type="hidden" name="module" value="ProfileSearch"/>
    <input type="hidden" name="t" value=""/>
    <input type="hidden" name="order" value="1"/>
    <input type="hidden" name="sort" value="1"/>

    <table cellpadding="0" cellspacing="0" border="0">
      <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>">&lt;&lt; back to main menu</A></TD></TR>
      <tr><td>Show count only: <web:chkBox name="count"/></td></tr>
      <tr><td>Handle: <web:textInput name="handle" size="15"/></td></tr>
      <tr><td>E-Mail: <web:textInput name="email" size="15"/></td></tr>
      <tr><td>First Name: <web:textInput name="firstname" size="15"/></td></tr>
      <tr><td>Last Name: <web:textInput name="lastname" size="15"/></td></tr>
      <tr><td>Zipcode: <web:textInput name="zipcode" size="5"/></td></tr>
      <tr><td>City: <web:textInput name="city" size="15"/></td></tr>
      <tr><td>Company: <web:textInput name="company" size="15"/></td></tr>
      <tr><td>State: <web:multiRSCSelect name="states" multiple="true" size="5" list="<%=states%>" selected="<%=selected.get("states")%>"><a href="JavaScript:deselect('states')">Deselect</a></td></tr>
      <tr><td>Country: <web:multiRSCSelect name="country" multiple="true" size="5" list="<%=country%>" selected="<%=selected.get("country")%>"><a href="JavaScript:deselect('country')">Deselect</a></td></tr>
      <tr><td>Country of origin: <web:multiRSCSelect name="countryoforigin" multiple="true" size="5" list="<%=country%>" selected="<%=selected.get("countryoforigin")%>"><a href="JavaScript:deselect('countryoforigin')">Deselect</a></td></tr>
      <tr><td>Professional: <web:chkBox name="pro"/>
      Student: <web:chkBox name="stud"/></td></tr>
      <tr><td>Languages: 
        <rsc:iterator list="<%=languages%>" id="resultRow">
          <rsc:item name="language_name" row="<%=resultRow%>"/>: 
            <web:chkBox name="lang_<rsc:item name="language_id" row="<%=resultRow%>"/>"/>
        </rsc:iterator>
      </td></tr>
      <tr><td>Max days since last rating: <web:textInput name="maxdayssincerating" size="5"/></td></tr>
      <tr><td>Min events: <web:textInput name="minevents" size="5"/></td></tr>
      <tr><td>Days since registration: <web:textInput name="mindays" size="5"/> to <web:textInput name="maxdays" size="5"/></td></tr>
      <tr><td>Rating range: <web:textInput name="minrating" size="5"/> to <web:textInput name="maxrating" size="5"/></td></tr>
      <tr><td><hr/><center><h2>Demographics</h2></center></td></tr>
      <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
        <tr><td>
        <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:
        <% int questionId = resultRow.getIntItem("demographic_question_id");%>
        <web:listSelect name="<%="demo_"+questionId"%>" list="<%=demoMap.get(new Integer(questionId))%>
        <a href="JavaScript:deselect('demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>')">Deselect</a>
        </td></tr>
      </rsc:iterator>
      <%idx=0;%>
      <tr><td><hr/><center><h2>Placement Information</h2></center></td></tr>
      <tr><td>Placement Indicator: <select name="placement">
      <option value="none"<%= "none".equals(request.getParameter("placement")) ? " selected" : "" %>>No preference</option>
      <option value="either"<%= "either".equals(request.getParameter("placement")) ? " selected" : "" %>>Either</option>
      <option value="contract"<%= "contract".equals(request.getParameter("placement")) ? " selected" : "" %>>Contract</option>
      <option value="full"<%= "full".equals(request.getParameter("placement")) ? " selected" : "" %>>Full time</option>
      </select>
      </td></tr>
      <tr><td>Resume: <web:chkBox name="resume"/></td></tr>
      <tr><td>Willing to travel/relocate: <web:chkBox name="travel"/></td></tr>
      <tr><td>US Authorization: <web:chkBox name="auth"/></td></tr>
      <tr><td><hr/><center><h2>Skills</h2></center></td></tr>


      
      <rsc:iterator list="<%=skill_types%>" id="resultRow">
        <tr><td>
        <rsc:item name="skill_type_desc" row="<%=resultRow%>"/>:<br/>
        <% int skillType = resultRow.getIntItem("skill_type_id");%>
        <web:listSelect name="<%="skills"+skillType%>" list="<%=skillMap.get(new Integer(skillType))%">
        <select size=10 name="skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        </select>
        <web:listSelect name="<%="skillset"+skillType%>" multiple="true" list="<%=skillSetMap.get(new Integer(skillType))%">
        <a href="JavaScript:itemAdd('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</a><br/>
        <a href="JavaScript:remove('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Remove skills</a>
        <a href="JavaScript:clear('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Clear</a>
        </td></tr>
      </rsc:iterator>
      <tr><td></td></tr>
    </table>
  </FORM>
  <a href="JavaScript:submitForm()">Submit</a>
  <a href="/tc?module=LegacyReport&t=profile_search">Clear</a>
  </body>
</html>




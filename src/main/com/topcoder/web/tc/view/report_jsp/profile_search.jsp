<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer countries = (ResultSetContainer)m.get("country_list");
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
    ResultSetContainer demographic_questions = (ResultSetContainer)m.get("demographics_questions");
    ResultSetContainer demographic_answers = (ResultSetContainer)m.get("demographics_answers");
    ResultSetContainer skill_types = (ResultSetContainer)m.get("skill_types");
    ResultSetContainer skills = (ResultSetContainer)m.get("skills");

    ResultSetContainer.ResultSetRow answer;
    ResultSetContainer.ResultSetRow skill;
    int idx = 0;
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
                j++;
            }else{
                document.search[a].options[i-j] = document.search[a].options[i];
                document.search[a].options[i] = null;
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
                op.value = val1+"_"+text2;
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
        document.search.submit();
    }
    -->
</script>
  </head>
  <body>
    <input type="hidden" name="module" value="ProfileSearch"/>

    <table cellpadding="0" cellspacing="0" border="0">
      <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>">&lt;&lt; back to main menu</A></TD></TR>
      <tr><td>Handle: <input type="text" name="handle" size="15"></td></tr>
      <tr><td>E-Mail: <input type="text" name="email" size="15"></td></tr>
      <tr><td>First Name: <input type="text" name="firstname" size="15"></td></tr>
      <tr><td>Last Name: <input type="text" name="lastname" size="15"></td></tr>
      <tr><td>Zipcode: <input type="text" name="zipcode" size="5"></td></tr>
      <tr><td>City: <input type="text" name="city" size="15"></td></tr>
      <tr><td>Company: <input type="text" name="company" size="15"></td></tr>
      <tr><td>State: <select name="states" multiple size=5>
        <rsc:iterator list="<%=states%>" id="resultRow">
          <option value="<rsc:item name="state_code" row="<%=resultRow%>"/>"><rsc:item name="state_code" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Country: <select name="country" multiple size=5>
        <option value="840">United States</option>
        <rsc:iterator list="<%=countries%>" id="resultRow">
          <% 
            String countryCode = resultRow.getStringItem("country_code");
            if(countryCode == null || countryCode.equals("840") || countryCode.equals(""))continue;//put the US first for convenience 
          %>
          <option value="<rsc:item name="country_code" row="<%=resultRow%>"/>"><rsc:item name="country_name" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Country of Origin: <select name="countryoforigin" multiple size=5>
        <option value="840">United States</option>
        <rsc:iterator list="<%=countries%>" id="resultRow">
          <% 
            String countryCode = resultRow.getStringItem("country_code");
            if(countryCode == null || countryCode.equals("840") || countryCode.equals(""))continue;//put the US first for convenience 
          %>
          <option value="<rsc:item name="country_code" row="<%=resultRow%>"/>"><rsc:item name="country_name" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Professional: <INPUT type="checkbox" name="pro" checked/>
      Student: <INPUT type="checkbox" name="stud" checked/></td></tr>
      <tr><td>Languages: 
        <rsc:iterator list="<%=languages%>" id="resultRow">
          <rsc:item name="language_name" row="<%=resultRow%>"/>: <input type="checkbox" name="lang_<rsc:item name="language_id" row="<%=resultRow%>"/>" checked>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Max days since last rating: <input type="textbox" size="5" name="maxdayssincerating"></td></tr>
      <tr><td>Min events: <input type="textbox" size="5" name="minevents"></td></tr>
      <tr><td>Days since registration: <input type="textbox" size="5" name="mindays"> to <input type="textbox" size="5" name="maxdays"></td></tr>
      <tr><td>Rating range: <input type="textbox" size="5" name="minrating"> to <input type="textbox" size="5" name="maxrating"></td></tr>
      <tr><td><hr/><center><h2>Demographics</h2></center></td></tr>
      <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
        <tr><td>
        <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:
        <select size="3" multiple name="demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>">
        <%
        while(idx < demographic_answers.getRowCount()){
            answer = demographic_answers.getRow(idx);
            if(answer.getIntItem("demographic_question_id") == resultRow.getIntItem("demographic_question_id")){
              %>
                <option value="<rsc:item name="demographic_answer_id" row="<%=answer%>"/>"><rsc:item name="demographic_answer_text" row="<%=answer%>"/></option>
              <%
              idx++;
            }else{
                break;
            }
        }
        %>
        </select>
        </td></tr>
      </rsc:iterator>
      <%idx=0;%>
      <tr><td><hr/><center><h2>Placement Information</h2></center></td></tr>
      <tr><td>Placement Indicator: <select name="placement">
      <option name="contract">Contract</option>
      <option name="full">Full time</option>
      <option name="either" selected>Either</option>
      <option name="none">No preference</option>
      </select>
      </td></tr>
      <tr><td>Resume: <INPUT type="checkbox" name="resume"/></td></tr>
      <tr><td>Willing to travel/relocate: <INPUT type="checkbox" name="travel"/></td></tr>
      <tr><td>US Authorization: <INPUT type="checkbox" name="auth"/></td></tr>
      <tr><td><hr/><center><h2>Skills</h2></center></td></tr>


      
      <rsc:iterator list="<%=skill_types%>" id="resultRow">
        <tr><td>
        <rsc:item name="skill_type_desc" row="<%=resultRow%>"/>:<br/>
        <select size=10 multiple name="skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
        <%
        while(idx < skills.getRowCount()){
            skill = skills.getRow(idx);
            if(skill.getIntItem("skill_type_id") == resultRow.getIntItem("skill_type_id")){
              %>
                <option value="<rsc:item name="skill_id" row="<%=skill%>"/>"><rsc:item name="skill_desc" row="<%=skill%>"/></option>
              <%
              idx++;
            }else{
                break;
            }
        }
        %>
        </select>
        <select size=10 name="skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        </select>
        <select multiple size=10 name="skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>">
        </select>
        <a href="JavaScript:itemAdd('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</a><br/>
        <a href="JavaScript:remove('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Remove skills</a>
        </td></tr>
      </rsc:iterator>
      <tr><td></td></tr>
    </table>
  </FORM>
  <a href="JavaScript:submitForm()">Submit</a>
  </body>
</html>




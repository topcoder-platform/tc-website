<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    String s;
    String[] sa;
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
    Map skillNames = new HashMap();
    boolean revise = "on".equals(request.getParameter("revise"));
    Set states = new HashSet(); 
    Set country = new HashSet(); 
    Set coo= new HashSet(); 
    sa = request.getParameterValues("states");
    if(sa!=null)states.addAll(Arrays.asList(sa));
    sa = request.getParameterValues("country");
    if(sa!=null)country.addAll(Arrays.asList(sa));
    sa = request.getParameterValues("countryoforigin");
    if(sa!=null)coo.addAll(Arrays.asList(sa));

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
                op.value = val1+"_"+text2;
                op.text = text1+" >= "+text2;
                document.search[c].options[len] = op;
                document.search['skill_names'].value = document.search['skill_names'].value + val1 + "\n" + text1 + "\n";
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
    <input type="hidden" name="skill_names" value="<%=request.getParameter("skill_names")%>"/>

    <table cellpadding="0" cellspacing="0" border="0">
      <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>">&lt;&lt; back to main menu</A></TD></TR>
      <tr><td>Handle: <input type="text" name="handle" size="15" value="<%=request.getParameter("handle")%>"></td></tr>
      <tr><td>E-Mail: <input type="text" name="email" size="15" value="<%=request.getParameter("email")%>"></td></tr>
      <tr><td>First Name: <input type="text" name="firstname" size="15" value="<%=request.getParameter("firstname")%>"></td></tr>
      <tr><td>Last Name: <input type="text" name="lastname" size="15" value="<%=request.getParameter("lastname")%>"></td></tr>
      <tr><td>Zipcode: <input type="text" name="zipcode" size="5" value="<%=request.getParameter("zipcode")%>"></td></tr>
      <tr><td>City: <input type="text" name="city" size="15" value="<%=request.getParameter("city")%>"></td></tr>
      <tr><td>Company: <input type="text" name="company" size="15" value="<%=request.getParameter("company")%>"></td></tr>
      <tr><td>State: <select name="states" multiple size=5>
        <rsc:iterator list="<%=states%>" id="resultRow">
          <option value="<rsc:item name="state_code" row="<%=resultRow%>"/>"<%=states.contains(resultRow.getStringItem("state_code")) ? " selected" : ""%><rsc:item name="state_code" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
        <a href="JavaScript:deselect('states')">Deselect</a>
      </td></tr>
      <tr><td>Country: <select name="country" multiple size=5>
        <option value="840" <%=country.contains("840") ? " selected" : ""%>>United States</option>
        <rsc:iterator list="<%=countries%>" id="resultRow">
          <% 
            String countryCode = resultRow.getStringItem("country_code");
            if(countryCode == null || countryCode.equals("840") || countryCode.equals(""))continue;//put the US first for convenience 
          %>
          <option value="<rsc:item name="country_code" row="<%=resultRow%>"/>"<%=country.contains(resultRow.getStringItem("country_code")) ? " selected" : ""%>><rsc:item name="country_name" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
        <a href="JavaScript:deselect('country')">Deselect</a>
      </td></tr>
      <tr><td>Country of Origin: <select name="countryoforigin" multiple size=5>
        <option value="840" <%=coo.contains("840") ? " selected" : ""%>>United States</option>
        <rsc:iterator list="<%=countries%>" id="resultRow">
          <% 
            String countryCode = resultRow.getStringItem("country_code");
            if(countryCode == null || countryCode.equals("840") || countryCode.equals(""))continue;//put the US first for convenience 
          %>
          <option value="<rsc:item name="country_code" row="<%=resultRow%>"/>"<%=coo.contains(resultRow.getStringItem("countryoforigin")) ? " selected" : ""%>><rsc:item name="country_name" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
        <a href="JavaScript:deselect('countryoforigin')">Deselect</a>
      </td></tr>
      <tr><td>Professional: <INPUT type="checkbox" name="pro"<%=(s = request.getParameter("pro")) == null && !revise ? " checked":""%>/>
      Student: <INPUT type="checkbox" name="stud"<%=(s = request.getParameter("stud")) == null && !revise ? " checked":""%>/></td></tr>
      <tr><td>Languages: 
        <rsc:iterator list="<%=languages%>" id="resultRow">
          <rsc:item name="language_name" row="<%=resultRow%>"/>: <input type="checkbox" name="lang_<rsc:item name="language_id" row="<%=resultRow%>"/>"<%=(s = request.getParameter(resultRow.getStringItem("language_id"))) == null && !revise ? " checked":""%>>
        </rsc:iterator>
      </td></tr>
      <tr><td>Max days since last rating: <input type="textbox" size="5" name="maxdayssincerating" value="<%=request.getParameter("maxdayssincerating")%>"></td></tr>
      <tr><td>Min events: <input type="textbox" size="5" name="minevents" value="<%=request.getParameter("minevents")%>"></td></tr>
      <tr><td>Days since registration: <input type="textbox" size="5" name="mindays" value="<%=request.getParameter("mindays")%>"> to <input type="textbox" size="5" name="maxdays" value="<%=request.getParameter("maxdays")%>"></td></tr>
      <tr><td>Rating range: <input type="textbox" size="5" name="minrating" value="<%=request.getParameter("minrating")%>"> to <input type="textbox" size="5" name="maxrating" value="<%=request.getParameter("maxrating")%>"></td></tr>
      <tr><td><hr/><center><h2>Demographics</h2></center></td></tr>
      <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
        <tr><td>
        <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:
        <select size="3" multiple name="demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>">
        <%
        Set hs = new HashSet();
        sa = request.getParameterValues("demo_"+resultRow.getIntItem("demographic_question_id"));
        if(sa!=null) hs.addAll(Arrays.asList(sa));
        while(idx < demographic_answers.getRowCount()){
            answer = demographic_answers.getRow(idx);
            if(answer.getIntItem("demographic_question_id") == resultRow.getIntItem("demographic_question_id")){
              %>
                <option value="<rsc:item name="demographic_answer_id" row="<%=answer%>"/>"<%=hs.contains(resultRow.getStringItem("demographic_answer_id")) ? " selected" : ""%>>
                    <rsc:item name="demographic_answer_text" row="<%=answer%>"/>
                </option>
              <%
              idx++;
            }else{
                break;
            }
        }
        %>
        </select>
        <a href="JavaScript:deselect('demo_<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>')">Deselect</a>
        </td></tr>
      </rsc:iterator>
      <%idx=0;%>
      <tr><td><hr/><center><h2>Placement Information</h2></center></td></tr>
      <tr><td>Placement Indicator: <select name="placement">
      <option value="none"<%= request.getParameter("placement").equals("none") ? " selected" : "" %>>No preference</option>
      <option value="either"<%= request.getParameter("placement").equals("either") ? " selected" : "" %>>Either</option>
      <option value="contract"<%= request.getParameter("placement").equals("contract") ? " selected" : "" %>>Contract</option>
      <option value="full"<%= request.getParameter("placement").equals("full") ? " selected" : "" %>>Full time</option>
      </select>
      </td></tr>
      <tr><td>Resume: <INPUT type="checkbox" name="resume" <%= "on".equals(request.getParameter("resume")) ? " checked" : "" %>/></td></tr>
      <tr><td>Willing to travel/relocate: <INPUT type="checkbox" name="travel" <%= "on".equals(request.getParameter("travel")) ? " checked" : "" %>/></td></tr>
      <tr><td>US Authorization: <INPUT type="checkbox" name="auth"<%= "on".equals(request.getParameter("auth")) ? " checked" : "" %>/></td></tr>
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
              skillNames.put(new Integer(resultRow.getIntItem("skill_id")),resultRow.getStringItem("skill_desc"));
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
            <% List skillsList = Arrays.asList(request.getParameterValues("skillset"+resultRow.getStringItem("skill_type_id"))); %>
            <logic:iterate id="skill_selection" name="skillsList">
                <option value="<%=skill_selection%>">
                    <%= skillNames.get(new Integer(skill_selection.toString().substring(0,skill_selection.toString().indexOf("_")))) %>
                </option>
            </logic:iterate>
        </select>
        <a href="JavaScript:itemAdd('skilltype<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skilllevel<rsc:item name="skill_type_id" row="<%=resultRow%>"/>','skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Add skill</a><br/>
        <a href="JavaScript:remove('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Remove skills</a>
        <a href="JavaScript:clear('skillset<rsc:item name="skill_type_id" row="<%=resultRow%>"/>')">Clear</a>
        </td></tr>
      </rsc:iterator>
      <tr><td></td></tr>
    </table>
  </FORM>
  <a href="JavaScript:submitForm()">Submit</a>
  </body>
</html>




<%--
/**
 *  profile.jsp
 */
--%>
<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer countries = (ResultSetContainer)m.get("country_list");
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
    ResultSetContainer demographic_questions = (ResultSetContainer)m.get("demographic_questions");
    ResultSetContainer demographic_answers = (ResultSetContainer)m.get("demographic_answers");
    ResultSetContainer.ResultSetRow answer;
    int idx = 0;
%>
  <FORM ACTION="/tc?module=ProfileSearch" METHOD="POST">
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
      <tr><td>Placement Indicator: <INPUT type="checkbox" name="placement"/></td></tr>
      <tr><td>Languages: 
        <rsc:iterator list="<%=languages%>" id="resultRow">
          <rsc:item name="language_name" row="<%=resultRow%>"/>: <input type="checkbox" name="<rsc:item name="language_id" row="<%=resultRow%>"/>" checked>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Max days since last rating: <input type="textbox" size="5" name="maxdayssincerating"></td></tr>
      <tr><td>Min events: <input type="textbox" size="5" name="minevents"></td></tr>
      <tr><td>Days since registration: <input type="textbox" size="5" name="mindays"> to <input type="textbox" size="5" name="maxdays"></td></tr>
      <tr><td><hr/><center><h2>Demographics</h2></center></td></tr>
      <rsc:iterator list="<%=demographic_questions%>" id="resultRow">
        <tr><td>
        <rsc:item name="demographic_question_text" row="<%=resultRow%>"/>:
        <% if(resultRow.getStringItem("selectable").equals("N")) { %>
          <input type="textfield" size="20" name="<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>"/>
        <% } else if(resultRow.getStringItem("selectable").equals("Y")) { %>
          <select name="<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>">
        <% } else if(resultRow.getStringItem("selectable").equals("M")) { %>
          <select size="5" multiple name="<rsc:item name="demographic_question_id" row="<%=resultRow%>"/>">
        <% } 
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
        if(!resultRow.getStringItem("selectable").equals("N")) {
        %>
          </select>
        <%
        }
        %>
        </td></tr>
      </rsc:iterator>
    </table>
  </FORM>
  </body>
</html>




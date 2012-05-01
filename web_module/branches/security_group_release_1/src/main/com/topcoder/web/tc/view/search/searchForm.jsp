<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays search form
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />

<script language="JavaScript"><!--
                        function submitEnter(e) {
                            var keycode;
                            if (window.event) keycode = window.event.keyCode;
                            else if (e) keycode = e.which;
                            else return true;
                            if (keycode == 13) {
                                document.searchForm.submit();
                                return false;
                            } else return true;
                        }
//--></script>
<STYLE TYPE="text/css">
table.stat td{
}
</STYLE>


<p align="left">
<input type="hidden" name="module" value="AdvancedSearch"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
Enter search criteria below then click the Search button. Search results matching the criteria
selections will be returned. Click on a Handle to view information about the Coder.
</p>

<table cellspacing="0" cellpadding="0" class="stat" width="100%">
<tbody>
   <tr>
      <td class="title" colspan="5">
         Advanced Member Search
      </td>
   </tr>
   <tr>
      <td class="header" colspan="5">
         An underscore ( _ ) = one character space<br/>
         A percent sign ( % ) = any number of character spaces
      </td>
   </tr>
   <tr>
      <td class="valueR" width="50%" style="border: 0px;">
         Handle:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="20" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         State:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=memberSearch.getStateList()%>" fieldText="state_name" fieldValue="state_code"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         Country:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=memberSearch.getCountryList()%>" fieldText="country_name" fieldValue="country_code"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         School:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.SCHOOL_NAME%>" size="20" maxlength="150" onKeyPress="submitEnter(event)" escapeHtml="true"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Algorithm</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" width="50%" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         # of rated <strong>Algorithm</strong> events:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_NUM_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_NUM_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         Max time since last <strong>Algorithm</strong> competition:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <select name="<%=Constants.MAX_DAYS_SINCE_LAST_COMP%>" size="1">
         <option value="">None Specified</option>
         <option value="30" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(30))?"selected":""%>>
         30 Days
         </option>
         <option value="90" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(90))?"selected":""%>>
         90 Days
         </option>
         <option value="180" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(180))?"selected":""%>>
         180 Days
         </option>
         </select>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Conceptualization</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_CONCEPT_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_CONCEPT_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Specification</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_SPEC_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_SPEC_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Architecture</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_ARCH_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_ARCH_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Design</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_DESIGN_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_DESIGN_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Development</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_DEV_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_DEV_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Assembly</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_ASS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_ASS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Test Suites</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_TEST_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_TEST_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Test Scenarios</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_TEST_SCENARIOS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_TEST_SCENARIOS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>UI Prototype</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_UI_PROTOTYPE_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_UI_PROTOTYPE_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>RIA Build</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_RIA_BUILD_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_RIA_BUILD_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Content Creation</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_CONTENT_CREATION_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_CONTENT_CREATION_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Reporting</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_REPORTING_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_REPORTING_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>High School</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_HS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_HS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         # of rated <strong>High School</strong> events:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_NUM_HS_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_NUM_HS_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         Max time since last <strong>High School</strong> competition:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <select name="<%=Constants.MAX_DAYS_SINCE_LAST_HS_COMP%>" size="1">
         <option value="">None Specified</option>
         <option value="30" <%=memberSearch.getMaxDaysSinceLastHSComp()!=null&&memberSearch.getMaxDaysSinceLastHSComp().equals(new Integer(30))?"selected":""%>>
         30 Days
         </option>
         <option value="90" <%=memberSearch.getMaxDaysSinceLastHSComp()!=null&&memberSearch.getMaxDaysSinceLastHSComp().equals(new Integer(90))?"selected":""%>>
         90 Days
         </option>
         <option value="180" <%=memberSearch.getMaxDaysSinceLastHSComp()!=null&&memberSearch.getMaxDaysSinceLastHSComp().equals(new Integer(180))?"selected":""%>>
         180 Days
         </option>
         </select>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         <strong>Marathon Match</strong> rating:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_MAR_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_MAR_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         # of rated <strong>Marathon Match</strong> events:
      </td>
      <td class="valueR" style="border: 0px;">
         Min:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MIN_NUM_MAR_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR" style="border: 0px;">
         Max:
      </td>
      <td class="value" style="border: 0px;">
         <tc-webtag:textInput name="<%=Constants.MAX_NUM_MAR_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR" style="border: 0px;">
         Max time since last <strong>Marathon Match</strong> competition:
      </td>
      <td class="value" colspan="4" style="border: 0px;">
         <select name="<%=Constants.MAX_DAYS_SINCE_LAST_MAR_COMP%>" size="1">
         <option value="">None Specified</option>
         <option value="30" <%=memberSearch.getMaxDaysSinceLastMarComp()!=null&&memberSearch.getMaxDaysSinceLastMarComp().equals(new Integer(30))?"selected":""%>>
         30 Days
         </option>
         <option value="90" <%=memberSearch.getMaxDaysSinceLastMarComp()!=null&&memberSearch.getMaxDaysSinceLastMarComp().equals(new Integer(90))?"selected":""%>>
         90 Days
         </option>
         <option value="180" <%=memberSearch.getMaxDaysSinceLastMarComp()!=null&&memberSearch.getMaxDaysSinceLastMarComp().equals(new Integer(180))?"selected":""%>>
         180 Days
         </option>
         </select>
      </td>
   </tr>
   <tr>
      <td class="valueC" colspan="5" style="border: 0px;">
         <div style="padding:6px;">
         <A href="javascript:document.searchForm.submit()" class="bodyText"><img src="/i/search.gif" width="60" height="18" border="0"/></A>
         </div>
      </td>
   </tr>
</tbody>
</table>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
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
      <td class="valueR" width="50%">
         Handle:
      </td>
      <td class="value" colspan="4">
         <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="20" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         State:
      </td>
      <td class="value" colspan="4">
         <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=memberSearch.getStateList()%>" fieldText="state_name" fieldValue="state_code"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         Country:
      </td>
      <td class="value" colspan="4">
         <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=memberSearch.getCountryList()%>" fieldText="country_name" fieldValue="country_code"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         School:
      </td>
      <td class="value" colspan="4">
         <tc-webtag:textInput name="<%=Constants.SCHOOL_NAME%>" size="20" maxlength="150" onKeyPress="submitEnter(event)" escapeHtml="true"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         <strong>Algorithm</strong> rating:
      </td>
      <td class="valueR">
         Min:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MIN_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR">
         Max:
      </td>
      <td class="value" width="50%">
         <tc-webtag:textInput name="<%=Constants.MAX_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         # of rated <strong>Algorithm</strong> events:
      </td>
      <td class="valueR">
         Min:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MIN_NUM_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR">
         Max:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MAX_NUM_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         Max time since last <strong>Algorithm</strong> competition:
      </td>
      <td class="value" colspan="4">
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
      <td class="valueR">
         <strong>Design</strong> rating:
      </td>
      <td class="valueR">
         Min:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MIN_DESIGN_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR">
         Max:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MAX_DESIGN_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         <strong>Development</strong> rating:
      </td>
      <td class="valueR">
         Min:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MIN_DEV_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR">
         Max:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MAX_DEV_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         <strong>High School</strong> rating:
      </td>
      <td class="valueR">
         Min:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MIN_HS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR">
         Max:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MAX_HS_RATING%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         # of rated <strong>High School</strong> events:
      </td>
      <td class="valueR">
         Min:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MIN_NUM_HS_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
      <td class="valueR">
         Max:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.MAX_NUM_HS_RATINGS%>" size="6" maxlength="6" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="valueR">
         Max time since last <strong>High School</strong> competition:
      </td>
      <td class="value" colspan="4">
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
      <td class="valueC" colspan="5">
         <div style="padding:6px;">
         <A href="javascript:document.searchForm.submit()" class="bodyText"><img src="/i/search.gif" width="60" height="18" border="0"/></A>
         </div>
      </td>
   </tr>
</tbody>
</table>
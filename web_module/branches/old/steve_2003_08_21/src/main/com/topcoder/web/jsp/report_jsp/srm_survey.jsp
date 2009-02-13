<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext,
		  java.text.DecimalFormat,
		  java.math.BigInteger

		  "

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%
                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_survey_report");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
				
				           DataAccessInt dai = new DataAccess((javax.sql.DataSource)
                            TCContext.getInitial().lookup(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL)));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_survey_question");
					ResultSetContainer rsc2 = (ResultSetContainer)dataMap.get("srm_survey_groups");
					ResultSetContainer rsc3 = (ResultSetContainer)dataMap.get("srm_survey_total");
					ResultSetContainer rsc4 = (ResultSetContainer)dataMap.get("srm_survey_answers");
					ResultSetContainer rsc5 = (ResultSetContainer)dataMap.get("srm_qry_chooser");
					ResultSetContainer rsc6 = (ResultSetContainer)dataMap.get("srm_match_info");
					
					
			%>		
					
                    
<%! 
private String getPercentage (ResultSetContainer total, ResultSetContainer.ResultSetRow val, String col){
   long tot = Long.parseLong(total.getItem(0,"cnt").toString());
   long valu = Long.parseLong(val.getItem(col).toString());
   double ret = (double)valu / tot*100;
   DecimalFormat df = new DecimalFormat("0.00");
   return df.format(ret);
   
}
%>
<jsp:include page="css.jsp" />
<jsp:include page="../script.jsp" />


 <table width="100%" class="srmFrame">
 <tr><td colspan="7"><span class=sectionTitle><%= rsc6.getItem(0,"contest_name") %> on <%= rsc6.getItem(0,"contest_date") %></span></td></tr>
 <tr><td colspan="7" class="srmQuestion">QUESTION: <%= rsc.getItem(0,"question_text") %></td>
 </tr>
 <tr>
 <td>&nbsp;</td>
 <td width=115 colspan="2" class="bodyText"><strong>Overall (<%= rsc3.getItem(0,"cnt") %>)</strong></td>
 
 <rsc:iterator list="<%=rsc2%>" id="Row" >
 <td width=115 colspan="2" class="bodyText"><strong><rsc:item name='<%="coder_type_desc"%>' row="<%=Row%>"/> (<rsc:item name='<%="cnt"%>' row="<%=Row%>"/> )</strong></td>
  </rsc:iterator>
   
 </tr>
 
  <%boolean even=false;%>
  <rsc:iterator list="<%=rsc4%>" id="Row" >
  <tr>

  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="answer_text"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="all"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,Row,"all")%>%</td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="stud"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,Row,"stud")%>%</td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="prof"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,Row,"prof")%>%</td>
  
  </tr><%even=!even;%>
  </rsc:iterator>
 </table>


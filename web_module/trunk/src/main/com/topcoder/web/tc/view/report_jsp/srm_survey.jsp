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

          ,
          com.topcoder.web.common.TCRequest,
          com.topcoder.web.common.HttpObjectFactory,
          com.topcoder.web.common.TCResponse,
          com.topcoder.web.common.security.WebAuthentication,
          com.topcoder.web.common.security.BasicAuthentication,
          com.topcoder.web.common.security.SessionPersistor,
          com.topcoder.security.admin.PrincipalMgrRemote,
          com.topcoder.security.TCSubject,
          com.topcoder.web.common.SessionInfo"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%

    TCRequest tcRequest = HttpObjectFactory.createRequest(request);
    TCResponse tcResponse = HttpObjectFactory.createResponse(response);
    WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(tcRequest.getSession()),
            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
    PrincipalMgrRemote pmgr = (PrincipalMgrRemote) com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
    TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
    SessionInfo info = new SessionInfo(tcRequest, authentication, user.getPrincipals());
    if (!info.isAdmin()) {
        %> you don't have permssion to view this page <%
        return;
    }

                com.topcoder.shared.dataAccess.Request dataRequest = new com.topcoder.shared.dataAccess.Request();
				dataRequest.setContentHandle("srm_survey_report");
				dataRequest.setProperty("rd", request.getParameter("rd")==null?"4445":request.getParameter("rd"));
				
				           DataAccessInt dai = new CachedDataAccess(
                                    dataRequest.getProperty(Constants.DB_KEY, Query.TRANSACTIONAL));
                    Map dataMap = null;
                    dataMap = dai.getData(dataRequest);
					
					ResultSetContainer rsc = (ResultSetContainer)dataMap.get("srm_survey_question");
					ResultSetContainer rsc2 = (ResultSetContainer)dataMap.get("srm_survey_groups");
					ResultSetContainer rsc3 = (ResultSetContainer)dataMap.get("srm_survey_total");
					ResultSetContainer rsc4 = (ResultSetContainer)dataMap.get("srm_survey_answers");
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

 <table width="100%" class="srmFrame">
 
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


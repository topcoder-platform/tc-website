<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext,
		  java.text.NumberFormat,
		  java.text.DecimalFormat,
		  java.math.BigInteger,
		  
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
				dataRequest.setProperty("rd", request.getParameter("rd"));
				
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

private String getPercent (long subs, long succ)
{
	double ret2 = 0;
	if (succ == 0)
   {
   	ret2 = (double)succ;
   	}
   else
    {
	ret2 = (double)succ / subs;
	}
	NumberFormat df = NumberFormat.getPercentInstance();	
   	df.setMinimumFractionDigits(2);
   	df.setMaximumFractionDigits(2);
   	return df.format(ret2);
}

long StudentTotal = 0;
long ProTotal = 0;
%>

<rsc:iterator list="<%=rsc2%>" id="Row">
<%
StudentTotal =  Long.parseLong(rsc2.getItem(0,"cnt").toString());
ProTotal = Long.parseLong(rsc2.getItem(1,"cnt").toString());
%>
</rsc:iterator>
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
 
 
  <%
  int i=0;
  boolean even=false;%>
  <rsc:iterator list="<%=rsc4%>" id="Row" >
  <%
  long ItemStudentTotal = Long.parseLong(rsc4.getItem(i,"stud").toString());
  long ItemProTotal = Long.parseLong(rsc4.getItem(i,"prof").toString());
  %>
  <tr>

  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="answer_text"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="all"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,Row,"all")%>%</td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="stud"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercent(StudentTotal,ItemStudentTotal)%></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="prof"%>' row="<%=Row%>"/></td>
  <td width="40" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercent(ProTotal,ItemProTotal)%></td>
  
  </tr>
  <%
    even=!even;
    i++;
  %>
  
  </rsc:iterator>
 </table>


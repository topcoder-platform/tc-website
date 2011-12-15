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
		  java.math.BigInteger,
		  java.lang.Object,
          com.topcoder.web.common.security.WebAuthentication,
          com.topcoder.web.common.security.BasicAuthentication,
          com.topcoder.web.common.security.SessionPersistor,
          com.topcoder.security.admin.PrincipalMgrRemote,
          com.topcoder.security.TCSubject"

%>
<%@ page import="com.topcoder.web.common.*" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
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
    dataRequest.setContentHandle("srm_demo_lang");
    dataRequest.setProperty("rd", request.getParameter("rd") == null ? "4445" : request.getParameter("rd"));

    DataAccessInt dai = new com.topcoder.web.common.CachedDataAccess(
            dataRequest.getProperty(Constants.DB_KEY, Query.WAREHOUSE));
    Map dataMap = null;
    dataMap = dai.getData(dataRequest);

    ResultSetContainer rsc = (ResultSetContainer) dataMap.get("srm_demo_language_stats_count_div1");
    ResultSetContainer rsc1 = (ResultSetContainer) dataMap.get("srm_demo_language_stats_count_div2");
    ResultSetContainer rsc2 = (ResultSetContainer) dataMap.get("srm_demo_language_stats_count_new");
    ResultSetContainer rsc3 = (ResultSetContainer) dataMap.get("srm_demo_language_stats_subs_div1");
    ResultSetContainer rsc4 = (ResultSetContainer) dataMap.get("srm_demo_language_stats_subs_div2");
    ResultSetContainer rsc5 = (ResultSetContainer) dataMap.get("srm_demo_language_stats_subs_new");
    int i = 0;
    long tot_lev1_subs = 0;
    long tot_lev1_succ = 0;
    long tot_lev2_subs = 0;
    long tot_lev2_succ = 0;
    long tot_lev3_subs = 0;
    long tot_lev3_succ = 0;
    long tot_subs = 0;
    long tot_succ = 0;
    long lang_tot_subs = 0;
    long lang_tot_succ = 0;
%>
<%!
private String getPercentage (ResultSetContainer total, int total_row, String total_col, int valu_row, String valu_col){
//System.out.println(total.toString());
   long tot = Long.parseLong(total.getItem(total_row,total_col).toString());
   long valu = Long.parseLong(total.getItem(valu_row,valu_col).toString());
   double ret = 0;
   if (tot == 0)
   {
   	ret = (double)tot;
   	}
   else
    {
	ret = (double)valu / tot;
	}
	NumberFormat df = NumberFormat.getPercentInstance();
   	df.setMinimumFractionDigits(2);
   	df.setMaximumFractionDigits(2);
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
%>

<!-- DIV 1 -->
<table width="100%" class="srmFrame">
<tr>
  <td colspan="13" class="srmQuestion">Division One&nbsp;&nbsp;&nbsp;(<%= rsc.getItem(0,"(count)") %>)</td>
</tr>
<%boolean even=false;

%>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" >&nbsp;</td>
  <td colspan="3" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Easy&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc,0,"(count)",0,"lev1_subs")%></strong></td>
  <td colspan="3" class="srmTableEven"><strong>Medium&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc,0,"(count)",0,"lev2_subs")%></strong></td>
  <td colspan="3" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Difficult&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc,0,"(count)",0,"lev3_subs")%></strong></td>
  <td colspan="3" class="srmTableEven"" >&nbsp;</td>

</tr>
  <tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Language</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
</tr>
<%even=!even;
i=0;
%>
  <rsc:iterator list="<%=rsc3%>" id="Row" >
<%
lang_tot_subs=0;
lang_tot_succ=0;
lang_tot_subs = Long.parseLong(rsc3.getItem(i,"lev1_subs").toString()) + Long.parseLong(rsc3.getItem(i,"lev2_subs").toString()) + Long.parseLong(rsc3.getItem(i,"lev3_subs").toString());
lang_tot_succ = Long.parseLong(rsc3.getItem(i,"lev1_succ").toString()) + Long.parseLong(rsc3.getItem(i,"lev2_succ").toString()) + Long.parseLong(rsc3.getItem(i,"lev3_succ").toString());
%>

<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="language_name"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev1_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev1_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,i,"lev1_subs",i,"lev1_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev2_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev2_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,i,"lev2_subs",i,"lev2_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev3_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev3_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc3,i,"lev3_subs",i,"lev3_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= lang_tot_subs %></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= lang_tot_succ %></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= getPercent(lang_tot_subs, lang_tot_succ) %></td>
</tr>
<%even=!even;
tot_lev1_subs = tot_lev1_subs + Long.parseLong(rsc3.getItem(i,"lev1_subs").toString());
tot_lev1_succ = tot_lev1_succ + Long.parseLong(rsc3.getItem(i,"lev1_succ").toString());
tot_lev2_subs = tot_lev2_subs + Long.parseLong(rsc3.getItem(i,"lev2_subs").toString());
tot_lev2_succ = tot_lev2_succ + Long.parseLong(rsc3.getItem(i,"lev2_succ").toString());
tot_lev3_subs = tot_lev3_subs + Long.parseLong(rsc3.getItem(i,"lev3_subs").toString());
tot_lev3_succ = tot_lev3_succ + Long.parseLong(rsc3.getItem(i,"lev3_succ").toString());
tot_subs = tot_lev1_subs + tot_lev2_subs + tot_lev3_subs;
tot_succ = tot_lev1_succ + tot_lev2_succ + tot_lev3_succ;
i++;

%>
</rsc:iterator>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Overall</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev1_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev1_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev1_subs, tot_lev1_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev2_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev2_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev2_subs, tot_lev2_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev3_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev3_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev3_subs, tot_lev3_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= tot_subs %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= tot_succ %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_subs, tot_succ) %></strong></td>
</tr>
</table>


<!-- DIV 2 -->
<table width="100%" class="srmFrame">
<tr>
  <td colspan="13" class="srmQuestion">Division Two&nbsp;&nbsp;&nbsp;(<%= rsc1.getItem(0,"(count)") %>)</td>
</tr>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" >&nbsp;</td>
  <td colspan="3" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Easy&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc1,0,"(count)",0,"lev1_subs")%></strong></td>
  <td colspan="3" class="srmTableEven"><strong>Medium&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc1,0,"(count)",0,"lev2_subs")%></strong></td>
  <td colspan="3" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Difficult&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc1,0,"(count)",0,"lev3_subs")%></strong></td>
  <td colspan="3" class="srmTableEven">&nbsp;</td>

</tr>
 <tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Language</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
</tr>
<%even=!even;
i=0;
tot_lev1_subs = 0;
tot_lev1_succ = 0;
tot_lev2_subs = 0;
tot_lev2_succ = 0;
tot_lev3_subs = 0;
tot_lev3_succ = 0;
%>
  <rsc:iterator list="<%=rsc4%>" id="Row" >
<%
lang_tot_subs=0;
lang_tot_succ=0;
lang_tot_subs = Long.parseLong(rsc4.getItem(i,"lev1_subs").toString()) + Long.parseLong(rsc4.getItem(i,"lev2_subs").toString()) + Long.parseLong(rsc4.getItem(i,"lev3_subs").toString());
lang_tot_succ = Long.parseLong(rsc4.getItem(i,"lev1_succ").toString()) + Long.parseLong(rsc4.getItem(i,"lev2_succ").toString()) + Long.parseLong(rsc4.getItem(i,"lev3_succ").toString());
%>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="language_name"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev1_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev1_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc4,i,"lev1_subs",i,"lev1_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev2_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev2_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc4,i,"lev2_subs",i,"lev2_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev3_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev3_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc4,i,"lev3_subs",i,"lev3_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= lang_tot_subs %></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= lang_tot_succ %></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= getPercent(lang_tot_subs, lang_tot_succ) %></td>
</tr>
<%even=!even;
tot_lev1_subs = tot_lev1_subs + Long.parseLong(rsc4.getItem(i,"lev1_subs").toString());
tot_lev1_succ = tot_lev1_succ + Long.parseLong(rsc4.getItem(i,"lev1_succ").toString());
tot_lev2_subs = tot_lev2_subs + Long.parseLong(rsc4.getItem(i,"lev2_subs").toString());
tot_lev2_succ = tot_lev2_succ + Long.parseLong(rsc4.getItem(i,"lev2_succ").toString());
tot_lev3_subs = tot_lev3_subs + Long.parseLong(rsc4.getItem(i,"lev3_subs").toString());
tot_lev3_succ = tot_lev3_succ + Long.parseLong(rsc4.getItem(i,"lev3_succ").toString());
tot_subs = tot_lev1_subs + tot_lev2_subs + tot_lev3_subs;
tot_succ = tot_lev1_succ + tot_lev2_succ + tot_lev3_succ;
i++;

%>
</rsc:iterator>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Overall</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev1_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev1_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev1_subs, tot_lev1_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev2_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev2_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev2_subs, tot_lev2_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev3_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev3_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev3_subs, tot_lev3_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= tot_subs %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= tot_succ %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_subs, tot_succ) %></strong></td>
</tr>
</table>


<!-- NON RATED -->
<table width="100%" class="srmFrame">
<tr>
  <td colspan="13" class="srmQuestion">Non Rated&nbsp;&nbsp;&nbsp;(<%= rsc2.getItem(0,"(count)") %>)</td>
</tr>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" >&nbsp;</td>
  <td colspan="3" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Easy&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc2,0,"(count)",0,"lev1_subs")%></strong></td>
  <td colspan="3" class="srmTableEven" ><strong>Medium&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc2,0,"(count)",0,"lev2_subs")%></strong></td>
  <td colspan="3" class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Difficult&nbsp;&nbsp;&nbsp;<%=getPercentage(rsc2,0,"(count)",0,"lev3_subs")%></strong></td>
  <td colspan="3" class="srmTableEven" >&nbsp;</td>

</tr>
 <tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Language</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Subs</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Correct</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Accuracy</strong></td>
</tr>
<%even=!even;
i=0;
tot_lev1_subs = 0;
tot_lev1_succ = 0;
tot_lev2_subs = 0;
tot_lev2_succ = 0;
tot_lev3_subs = 0;
tot_lev3_succ = 0;
tot_subs = 0;
tot_succ = 0;
%>
  <rsc:iterator list="<%=rsc5%>" id="Row" >
<%
lang_tot_subs=0;
lang_tot_succ=0;


lang_tot_subs = Long.parseLong(rsc5.getItem(i,"lev1_subs").toString()) + Long.parseLong(rsc5.getItem(i,"lev2_subs").toString()) + Long.parseLong(rsc5.getItem(i,"lev3_subs").toString());
lang_tot_succ = Long.parseLong(rsc5.getItem(i,"lev1_succ").toString()) + Long.parseLong(rsc5.getItem(i,"lev2_succ").toString()) + Long.parseLong(rsc5.getItem(i,"lev3_succ").toString());
%>

<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="language_name"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev1_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev1_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc5,i,"lev1_subs",i,"lev1_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev2_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev2_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc5,i,"lev2_subs",i,"lev2_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev3_subs"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><rsc:item name='<%="lev3_succ"%>' row="<%=Row%>"/></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%=getPercentage(rsc5,i,"lev3_subs",i,"lev3_succ")%></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= lang_tot_subs %></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= lang_tot_succ %></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><%= getPercent(lang_tot_subs, lang_tot_succ) %></td>
</tr>
<%even=!even;
tot_lev1_subs = tot_lev1_subs + Long.parseLong(rsc5.getItem(i,"lev1_subs").toString());
tot_lev1_succ = tot_lev1_succ + Long.parseLong(rsc5.getItem(i,"lev1_succ").toString());
tot_lev2_subs = tot_lev2_subs + Long.parseLong(rsc5.getItem(i,"lev2_subs").toString());
tot_lev2_succ = tot_lev2_succ + Long.parseLong(rsc5.getItem(i,"lev2_succ").toString());
tot_lev3_subs = tot_lev3_subs + Long.parseLong(rsc5.getItem(i,"lev3_subs").toString());
tot_lev3_succ = tot_lev3_succ + Long.parseLong(rsc5.getItem(i,"lev3_succ").toString());
tot_subs = tot_lev1_subs + tot_lev2_subs + tot_lev3_subs;
tot_succ = tot_lev1_succ + tot_lev2_succ + tot_lev3_succ;
i++;

%>
</rsc:iterator>
<tr>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong>Overall</strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev1_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev1_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev1_subs, tot_lev1_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev2_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev2_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev2_subs, tot_lev2_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev3_subs%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%=tot_lev3_succ%></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_lev3_subs, tot_lev3_succ) %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= tot_subs %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= tot_succ %></strong></td>
  <td class="<%=even?"srmTableEven":"srmTableOdd"%>" ><strong><%= getPercent(tot_subs, tot_succ) %></strong></td>
</tr>


</table>

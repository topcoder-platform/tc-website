<%@ page import="com.topcoder.web.common.TCWebException" %>
<%@ page import="com.topcoder.shared.dataAccess.Request" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessInt" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.util.DBMS" %>
<%@ page import="com.topcoder.web.common.dao.DAOUtil" %>
<%@ page import="com.topcoder.web.common.HibernateUtils" %>
<%@ page import="com.topcoder.web.common.model.UserPreference" %>
<%@ page import="com.topcoder.web.common.model.Preference" %>
<%@ page import="com.topcoder.web.common.CachedDataAccess" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccess" %><%
                if(request.getParameter("cr")==null) {
                throw new TCWebException("Invalid Coder ID");
            }

            String coderId = request.getParameter("cr");

            Request r = new Request();
            r.setContentHandle("member_profile");
            r.setProperty("cr", coderId);

            DataAccessInt dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("Coder_Data");

            //here we want to get the current tab, then load data for that tab
            boolean hasAlg = false;
            boolean hasHS = false;
            boolean registeredHS = false;
            boolean hasDes = false;
            boolean hasDev = false;
            boolean hasLong = false;


            int algRating = 0;
            int hsRating = 0;
            int mmRating = 0;
            int desRating = 0;
            int devRating = 0;

            String tab = StringUtils.checkNull(request.getParameter("tab"));

            if (rsc.size() != 0) {

                if ((rsc.getItem(0, "rating").getResultData() != null) && (rsc.getIntItem(0, "rating") != 0)) {
                    hasAlg = true;
                    algRating = rsc.getIntItem(0, "rating");
                }

                if ((rsc.getItem(0, "hs_rating").getResultData() != null) && (rsc.getIntItem(0, "hs_rating") != 0)) {
                    hasHS = true;
                    hsRating = rsc.getIntItem(0, "hs_rating");
                }

                if ((rsc.getItem(0, "mm_rating").getResultData() != null) && (rsc.getIntItem(0, "mm_rating") != 0)) {
                    //hasLong = true;
                    mmRating = rsc.getIntItem(0, "mm_rating");
                }

                if (rsc.getItem(0, "design_rating").getResultData() != null) {
                    hasDes = true;
                    desRating = rsc.getIntItem(0, "design_rating");
                }

                if (rsc.getItem(0, "development_rating").getResultData() != null) {
                    hasDev = true;
                    devRating = rsc.getIntItem(0, "development_rating");
                }

                hasLong = rsc.getStringItem(0, "has_long_comp").equals("1");

                registeredHS = rsc.getIntItem(0, "hs_registered") == 1;

                //get the selected tab
                if (tab.equals("")) {
                    if (!hasAlg && !hasHS && !hasDes && !hasDev && !hasLong) {
                        tab = "";
                    } else if (!hasAlg && !hasHS && !hasDes && !hasDev && hasLong) {
                        tab = "long";
                    } else if (hasAlg && algRating >= hsRating && algRating >= desRating && algRating >= devRating && algRating >= mmRating) {
                        tab = "alg";
                    } else if (hasHS && hsRating >= algRating && hsRating >= desRating && hsRating >= devRating && hsRating >= mmRating) {
                        tab = "hs";
                    } else if (hasLong && mmRating >= algRating && mmRating >= desRating && mmRating >= devRating && mmRating >= hsRating) {
                        tab = "long";
                    } else if (hasDes && desRating >= algRating && desRating >= hsRating && desRating >= devRating && desRating >= mmRating) {
                        tab = "des";
                    } else if (hasDev) {
                        tab = "dev";
                    }
                }

                if (tab.equals("alg")) {
                    //load algo data from Coder_Alg_Data
                    r = new Request();
                    r.setContentHandle("Coder_Alg_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("ratid", "1");

                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("hs")) {
                    //load algo data from Coder_HS_Data
                    r = new Request();
                    r.setContentHandle("Coder_hs_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("ratid", "2");

                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("des")) {
                    //load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Des_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty(Constants.PHASE_ID, "112"); //design phase id

                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("dev")) {
                    //load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Dev_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty(Constants.PHASE_ID, "113"); //design phase id

                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("long")) {
                    r = new Request();
                    r.setContentHandle("Coder_Long_Data");
                    r.setProperty("cr", coderId);

                    Map longData = dai.getData(r);
                    Iterator it = longData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, longData.get(key));
                    }

                }
            }

            r = new Request();
            r.setContentHandle("member_contact_enabled");
            r.setProperty("cr", coderId);

            DataAccessInt dai2 = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Map result2 = dai2.getData(r);
            ResultSetContainer rsc2 = (ResultSetContainer) result2.get("member_contact_enabled");

            boolean memberContactEnabled = false;
            if(rsc2.size() > 0) {
                memberContactEnabled = "yes".equals(rsc2.getStringItem(0, "value"));
            }

            // check whether or not show earnings
            if (!DAOUtil.useQueryToolFactory) {
                HibernateUtils.getSession().beginTransaction();
            }

            UserPreference up = DAOUtil.getQueryToolFactory().getUserPreferenceDAO().find(Long.parseLong(coderId), Preference.SHOW_EARNINGS_PREFERENCE_ID);
            boolean hidePayments = up != null && "hide".equals(up.getValue());

            request.setAttribute("resultMap", result);

            request.setAttribute("hasAlg", new Boolean(hasAlg));
            request.setAttribute("hasHS", new Boolean(hasHS));
            request.setAttribute("registeredHS", new Boolean(registeredHS));
            request.setAttribute("hasDes", new Boolean(hasDes));
            request.setAttribute("hasDev", new Boolean(hasDev));
            request.setAttribute("hasLong", new Boolean(hasLong));
            request.setAttribute("memberContactEnabled", new Boolean(memberContactEnabled));
            request.setAttribute("hidePayments", new Boolean(hidePayments));
            request.setAttribute("tab", tab);

%>




<%@  page language="java"
    import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,com.topcoder.shared.util.ApplicationServer,
          com.topcoder.web.common.StringUtils"%>

<%@ page import="java.util.Map"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Profile</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>
<body>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Member Profile"/>
</jsp:include>


<% ResultSetContainer rscCoderData = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("Coder_Data");
%>

<% if(rscCoderData.size() == 0) {%>
This member has not yet been rated in a competition.
<% } else { %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr><td class="tableTitle" colspan="3">&#160;</td></tr>
   <tr>
      <td class="photoCell">
   <%if (rscCoderData.getItem(0,"has_image").toString().equals("1")) { %>
      <IMG SRC='<rsc:item name="image_path" set="<%=rscCoderData%>"/>' class="memberPhoto" />
   <% } else { %>
      <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto"><img src="/i/m/nophoto_login.gif" class="memberPhoto"/></a>
   <% } %>
      </td>
      <td valign="top">
         <table cellpadding="0" cellspacing="0" border="0" class="statTable">
            <tr><td class="handleCell" colspan="2">
                <tc-webtags:handle coderId='<%=rscCoderData.getStringItem(0, "coder_id")%>'/></td></tr>
            <tr><td class="cat" nowrap="nowrap">Algorithm Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "rating") != null && rscCoderData.getIntItem(0, "rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "rating")%>'>
                <rsc:item name="rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
<% if (registeredHS) { %>
            <tr><td class="cat" nowrap="nowrap">High School Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "hs_rating") != null && rscCoderData.getIntItem(0, "hs_rating") != 0) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "hs_rating")%>'>
                <rsc:item name="hs_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
<% } %>

            <tr><td class="cat" nowrap="nowrap">Design Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "design_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "design_rating")%>'>
                <rsc:item name="design_rating" set="<%=rscCoderData%>" format="####"/></tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Development Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "development_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "development_rating")%>'>
                <rsc:item name="development_rating" set="<%=rscCoderData%>" format="####"/>
                </tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" nowrap="nowrap">Marathon Matches Rating:</td><td class="stat" align="right">
            <%if(rscCoderData.getStringItem(0, "mm_rating") != null) {%>
                <tc-webtags:ratingColor rating='<%=rscCoderData.getIntItem(0, "mm_rating")%>'>
                <rsc:item name="mm_rating" set="<%=rscCoderData%>" format="####"/>
                </tc-webtags:ratingColor>
            <%} else {%>
                not rated
            <%}%>
            </td></tr>
            <tr><td class="cat" colspan="2">&#160;</td></tr>
<% if (!registeredHS || (rscCoderData.getStringItem(0, "rating") != null) || (rscCoderData.getStringItem(0, "design_rating") != null) || (rscCoderData.getStringItem(0, "development_rating") != null)) { %>
            <% if(!hidePayments) { %>
            <tr><td class="cat" nowrap="nowrap">Total Earnings:</td><td class="stat" align="right">
                <% if (rscCoderData.getItem(0, "overall_earnings").getResultData() == null || rscCoderData.getDoubleItem(0, "overall_earnings") > 0) { %>
                <A href="/tc?module=PaymentSummary&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">
                <% } %>
                    <rsc:item name="overall_earnings" set="<%=rscCoderData%>" format="$#,##0.00"/>
                <% if (rscCoderData.getItem(0, "overall_earnings").getResultData() == null || rscCoderData.getDoubleItem(0, "overall_earnings") > 0) { %>
                </A>
                <% } %>
                </td></tr>
            <% } %>
<% } %>
            <tr><td class="cat" nowrap="nowrap">Member Since:</td><td class="stat" align="right">
            <rsc:item name="member_since" set="<%=rscCoderData%>" format="MM.dd.yyyy"/></td></tr>
             <% if (rscCoderData.getItem(0, "country_name").getResultData()!=null) { %>
            <tr><td class="cat">Country:</td><td class="stat" align="right"><div style="width: 100px;">
            <rsc:item name="country_name" set="<%=rscCoderData%>"/></div></td></tr>
             <% } %>
            <% if (rscCoderData.getStringItem(0,"school_name")!=null) { %>
            <tr><td class="cat">School:</td><td class="stat" align="right">
            <rsc:item name="school_name" set="<%=rscCoderData%>"/></td></tr>
            <% }%>
            <tr><td class="cat" colspan="2">
            <% if(memberContactEnabled) { %>
                <A href="/tc?module=MemberContact&th=<%=rscCoderData.getStringItem(0, "handle")%>">[Send a message]</A><br>
            <% } %>
            <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=History&userID=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Forum post history]</A><br>
             <% if (rscCoderData.getIntItem(0, "has_achievements")>0) { %>
             <A href="/tc?module=SimpleStats&c=coder_achievements&d1=statistics&d2=coderAchievements&cr=<%=rscCoderData.getStringItem(0, "coder_id")%>">[Achievements]</A>
             <% } %>
            </td></tr>
         </table>
      </td>
      <td class="quoteCell">
        <% if(!"".equals(StringUtils.checkNull(rscCoderData.getStringItem(0,"quote")))) {%>
        <div class="quoteBox"><span class="quoteTitle">Quote:</span><br><br>
        <div align="center">"<%=StringUtils.htmlEncode(rscCoderData.getStringItem(0, "quote"))%>"</div></div>
        <%}%>
      </td>
   <tr>
</table>

<br>
<!-- Tab barlinks-->
<%
    if(tab.equals("")) {
%>
        This member has not been rated in any events.
<%    } else if(tab.equals("alg")) {%>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabAlg.jsp" />
<% } else if(tab.equals("hs")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabHS.jsp" />
<% } else if(tab.equals("des")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDes.jsp" />
<% } else if(tab.equals("dev")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabDev.jsp" />
<% } else if(tab.equals("long")) { %>
<jsp:include page="memberProfileTabs.jsp" />
<jsp:include page="memberProfileTabLong.jsp" />
<% }%>
<% }%>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>


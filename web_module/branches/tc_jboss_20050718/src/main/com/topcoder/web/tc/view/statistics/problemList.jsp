<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,
          com.topcoder.web.tc.Constants,
          com.topcoder.web.common.StringUtils,
          java.util.Hashtable,
          java.util.Iterator"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("problem_list"); %>
<% ResultSetContainer levels = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("levels"); %>
<% ResultSetContainer categories = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("categories"); %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<script language="JavaScript"><!--
  function next() {
    document.problemListForm.<%=DataAccessConstants.START_RANK%>.value=<%=rsc.getStartRow()+Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.END_RANK%>.value=<%=rsc.getEndRow()+Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    document.problemListForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    document.problemListForm.submit();
  }
  function previous() {
    document.problemListForm.<%=DataAccessConstants.START_RANK%>.value=<%=rsc.getStartRow()-Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.END_RANK%>.value=<%=rsc.getEndRow()-Constants.PROBLEM_ARCHIVE_SCROLL_SIZE%>;
    document.problemListForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    document.problemListForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    document.problemListForm.submit();
  }
//--></script>
<%!
    /**
     * Ug, can't think of any other way to do this...
     * Go through the request and pull out all the parameters that would otherwise be lost by
     * clicking on one of the sort links.
     * @param request
     * @return
     */
    String addParams(HttpServletRequest request) {
        Map h = request.getParameterMap();
        StringBuffer buf = new StringBuffer(100);
        Map.Entry me = null;
        for (Iterator it = h.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry)it.next();
            //System.out.println("key: " + me.getKey() + " valu: " + (String)me.getValue());
            String[] sArray = null;

            if (me.getValue() instanceof String) {
                add(buf, me.getKey().toString(), me.getValue().toString());
            } else if (me.getValue().getClass().isArray()) {
                sArray = (String[]) me.getValue();
                for (int i = 0; i < sArray.length; i++) {
                    add(buf, me.getKey().toString(), sArray[i]);
                }
            }
        }
        return buf.toString();
    }

    void add(StringBuffer buf, String key, String val) {
        if (key.equals(Constants.CLASS_NAME)
                || key.equals(Constants.CATEGORY)
                || key.equals(Constants.MIN_DIV1_SUCCESS)
                || key.equals(Constants.MIN_DIV2_SUCCESS)
                || key.equals(Constants.MAX_DIV1_SUCCESS)
                || key.equals(Constants.MAX_DIV2_SUCCESS)
                || key.equals(Constants.DIV1_LEVEL)
                || key.equals(Constants.DIV2_LEVEL)) {
            if (val!=null) {
                buf.append("&");
                buf.append(key);
                buf.append("=");
                buf.append(val);
            }
        }

    }
%>
<script language="JavaScript"><!--
                        function submitEnter(e) {
                            var keycode;
                            if (window.event) keycode = window.event.keyCode;
                            else if (e) keycode = e.which;
                            else return true;
                            if (keycode == 13) {
                                document.problemListForm.submit();
                                return false;
                            } else return true;
                        }
//--></script>


<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Problem Archive</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />

 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="problem_archive"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Archive&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>


              <form name="problemListForm" method="get">
               <input type="hidden" name="module" value="ProblemArchive"/>
               <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
               <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
               <input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
               <input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>

               <table border="0" cellspacing="0" cellpadding="2" bgcolor="#001B35" width="100%">
				<tr>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
					<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" align=left><span class=bodySubtitle>Search</span></TD>
				</tr>
				</table>

               <table border="0" cellspacing="0" cellpadding="2" bgcolor="#001B35" width="100%">
                <tr>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.CLASS_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.CATEGORY%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                 <tr>
                    <td align="right" class="statText">Class Name</td>
                    <td align="left" class="statText"><tc-webtag:textInput name="<%=Constants.CLASS_NAME%>"  size="15" maxlength="15" onKeyPress="submitEnter(event)"/></td>
                    <td align="right" class="statText">Category</td>
                    <td align="left" class="statText"><tc-webtag:rscSelect name="<%=Constants.CATEGORY%>" list="<%=categories%>" fieldText="category" fieldValue="category"/></td>
                 </tr>
                <tr>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.DIV1_LEVEL%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.DIV2_LEVEL%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>

                 <tr>
                    <td align="right" class="statText" width="25%">Division I Level</td>
                    <td align="left" class="statText" width="25%"><tc-webtag:rscSelect name="<%=Constants.DIV1_LEVEL%>" list="<%=levels%>" fieldText="level_desc" fieldValue="level_id"/></td>
                    <td align="right" class="statText" width="25%">Division II Level</td>
                    <td align="left" class="statText" width="25%"><tc-webtag:rscSelect name="<%=Constants.DIV2_LEVEL%>" list="<%=levels%>" fieldText="level_desc" fieldValue="level_id"/></td>
                 </tr>

                <tr>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.MIN_DIV1_SUCCESS%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.MIN_DIV2_SUCCESS%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                 <tr>
                    <td align="right" class="statText">Minimum Division I Success Rate</td>
                    <td align="left" class="statText"><tc-webtag:textInput name="<%=Constants.MIN_DIV1_SUCCESS%>"  size="15" maxlength="15" onKeyPress="submitEnter(event)"/></td>
                    <td align="right" class="statText">Minimum Division II Success Rate</td>
                    <td align="left" class="statText"><tc-webtag:textInput name="<%=Constants.MIN_DIV2_SUCCESS%>"  size="15" maxlength="15" onKeyPress="submitEnter(event)"/></td>
                 </tr>
                <tr>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.MAX_DIV1_SUCCESS%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                    <td colspan="2" class="errorText" align="center">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.MAX_DIV2_SUCCESS%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                 <tr>
                    <td align="right" class="statText">Maximum Division I Success Rate</td>
                    <td align="left" class="statText"><tc-webtag:textInput name="<%=Constants.MAX_DIV1_SUCCESS%>"  size="15" maxlength="15" onKeyPress="submitEnter(event)"/></td>
                    <td align="right" class="statText">Maximum Division II Success Rate</td>
                    <td align="left" class="statText"><tc-webtag:textInput name="<%=Constants.MAX_DIV2_SUCCESS%>"  size="15" maxlength="15" onKeyPress="submitEnter(event)"/></td>
                 </tr>

                <tr>
                    <td colspan="4" class="statText" align="center">
                         <a class=statText href="javascript: document.problemListForm.submit();">Submit</a>
                    </td>
                </tr>
               <table>

				<br/><br/>

               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD colspan="11" class="statText"><%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="13%" HEIGHT="18"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="0"/><%=addParams(request)%>" class="statText"><b>Problem&nbsp;Name</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="15%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="1"/><%=addParams(request)%>" class="statText"><b>Contest</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="10%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="2"/><%=addParams(request)%>" class="statText"><b>Date</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="20%"><b>Categories</b></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="5%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="4" ascColumn="8" descColumn="9"/><%=addParams(request)%>" class="statText"><b>Div. 1<br/>Level</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="15%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="6" ascColumn="12" descColumn="13"/><%=addParams(request)%>" class="statText"><b>Div. 1<br/>Success Rate</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="5" ascColumn="10" descColumn="11"/><%=addParams(request)%>" class="statText"><b>Div. 2<br/>Level</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="15%"><a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=ProblemArchive"%><tc-webtag:sort column="7" ascColumn="14" descColumn="15"/><%=addParams(request)%>" class="statText"><b>Div. 2<br/>Success Rate</b></a></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="5%" HEIGHT="18"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD colspan="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <rsc:iterator list="<%=rsc%>" id="resultRow">
                   <TR>
                     <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                     <TD CLASS="statText" HEIGHT="13"><A HREF="/stat?c=problem_statement&pm=<rsc:item name="problem_id" row="<%=resultRow%>"/>&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>" class="statText"><rsc:item name="problem_name" row="<%=resultRow%>"/></A></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left" NOWRAP="on"><A HREF="/stat?c=round_overview&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>" class="statText"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left"><rsc:item name="contest_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="left"><rsc:item name="categories" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div1_level" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div1_success" row="<%=resultRow%>" format="0.00%"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div2_level" row="<%=resultRow%>"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><rsc:item name="div2_success" row="<%=resultRow%>" format="0.00%"/></TD>
                     <TD CLASS="statText" HEIGHT="13" ALIGN="right"><A HREF="/tc?module=ProblemDetail&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>&pm=<rsc:item name="problem_id" row="<%=resultRow%>"/>" class="statText">details</A></TD>
                     <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   </TR>
                 </rsc:iterator>
                 <TR>
                   <TD colspan="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" colspan="10" ALIGN="center">
                   </TD>
                 </TR>
                 <TR>
                   <TD colspan="11" class="statText"><%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%></TD>
                 </TR>

                 <TR>
                   <TD colspan="11" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD colspan="11" ALIGN="center" CLASS="statText">
                   </TD>
                 </TR>
                 <TR>
                   <TD colspan="11" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
               </TABLE>
              </form>
             </TD>
           </TR>
           <TR>
             <TD VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <p><br></p>

         <!-- END BODY -->
       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>



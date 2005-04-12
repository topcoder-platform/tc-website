<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>

<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%!
  String stripQuotes(String s) {
    if (s==null || s.length()==0) return "";
    StringBuffer buf = new StringBuffer(150);
    for(int i=0; i<s.length(); i++) {
      if (s.charAt(i)!='\'')
        buf.append(s.charAt(i));
    }
    return buf.toString();
  }
%>
<%!
  boolean contains(String list, String key) {
    StringTokenizer st = new StringTokenizer(list, ",");
    HashSet hash = new HashSet();
    while (st.hasMoreTokens())
      hash.add(st.nextToken());
    if (hash.contains(key)) return true;
    else return false;
  }
%>

<%
  Map m = null;
  ResultSetContainer profiles = null;
  ResultSetContainer states = null;
  ResultSetContainer countries = null;
  ResultSetContainer relocateAnswers = null;
  ResultSetContainer.ResultSetRow rsr = null;
  Iterator it = null;
  String[] columns = null;
  m = (Map)request.getAttribute(Constants.REPORT_PROFILE_LIST_KEY);
  if (m==null) {
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_LIST_MENU_KEY);
    if (m!=null) {
      profiles = (ResultSetContainer)m.get("Profile_List");
      states = (ResultSetContainer)m.get("State_List");
      countries = (ResultSetContainer)m.get("Country_List");
      relocateAnswers = (ResultSetContainer)m.get("Relocate_Answers");
    }
  } else {
    profiles = (ResultSetContainer)m.get("Profile_List");
    states = (ResultSetContainer)m.get("State_List");
    countries = (ResultSetContainer)m.get("Country_List");
    relocateAnswers = (ResultSetContainer)m.get("Relocate_Answers");
  }
%>

<HTML>
  <HEAD>
    <title>TopCoder Reporting</title>
  </HEAD>
  <BODY>
    <A HREF="<%=Constants.SERVLET_ADDR%>"><< back to main menu</A><BR/><BR/>
    (Use % for a wildcard.)
    <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <TR><TD><FONT size="4"><b>Profile List</b></FONT></TD></TR>
      <TR>
        <TD ALIGN="left">
          <FORM name="profileListForm" method="get" action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>">
            <input type="hidden" name="module" value="LegacyReport"/>
            <INPUT type="hidden" name="<%=Constants.TASK_NAME_KEY%>" value="<%=Constants.REPORT_PROFILE_LIST_KEY%>"/>
            <INPUT type="hidden" name="<%=Constants.REPORT_RELOCATE_KEY%>" value=""/>
            <TABLE WIDTH="60%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
              <TR>
                <TD>
                  <b>Handle: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_HANDLE_KEY%>" value="<%=request.getParameter(Constants.REPORT_HANDLE_KEY)%>"/>
                </TD>
                <TD>
                  <b>Pro/Student: </b>
                  <SELECT NAME="<%=Constants.REPORT_PRO_STUDENT_KEY%>" SIZE="3" MULTIPLE="false">
<%                   String occupation = request.getParameter(Constants.REPORT_PRO_STUDENT_KEY)==null?"1,2":request.getParameter(Constants.REPORT_PRO_STUDENT_KEY);
%>
                     <OPTION value="1"<%=occupation.equals("1")?" selected=\"true\"":""%>>Student</OPTION>
                     <OPTION value="2"<%=occupation.equals("2")?" selected=\"true\"":""%>>Professional</OPTION>
                     <OPTION value="1,2"<%=occupation.equals("1,2")?" selected=\"true\"":""%>>Both</OPTION>
                  </SELECT>
                </TD>
              </TR>
              <TR>
                <TD>
                  <b>First Name: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_FIRST_NAME_KEY%>" value="<%=request.getParameter(Constants.REPORT_FIRST_NAME_KEY)%>"/>
                </TD>
                <TD>
                  <b>Last Name: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_LAST_NAME_KEY%>" value="<%=request.getParameter(Constants.REPORT_LAST_NAME_KEY)%>"/>
                </TD>
              </TR>
              <TR>
                <TD colspan="2" align="center">
                  <b>Comma separated list of states: (default is all) </b><br/>
                  <INPUT type="text" onKeyPress="submitEnter(event)" size="50%" name="<%=Constants.REPORT_STATE_KEY%>" value="<%=stripQuotes(request.getParameter(Constants.REPORT_STATE_KEY))%>"/>
                </TD>
              </TR>
              <TR>
                <TD colspan="2" align="center">
                  <b>Willing to relocate:</b><br/>
                    <SELECT NAME="relocateAnswers" SIZE="3" MULTIPLE="true">
<%
                     String willingToRelocate = request.getParameter(Constants.REPORT_RELOCATE_KEY)==null?"":request.getParameter(Constants.REPORT_RELOCATE_KEY);
                     String selectedString = null;
                     it = relocateAnswers.iterator();
                      while(it.hasNext()) {
                        rsr = (ResultSetContainer.ResultSetRow)it.next();
                        selectedString = contains(willingToRelocate, rsr.getItem("answer_id").toString())?" selected=\"true\"":"";
%>
                      <OPTION value="<%=rsr.getItem("answer_id").toString()%>"<%=selectedString%>><%=rsr.getItem("answer_text").toString()%></OPTION>
<%
                      }
%>
                    </SELECT>
                </TD>
              </TR>

              <TR><TD><BR/></TD></TR>
              <TR>
                <TD colspan="2" align="center">
                  <b>Rating</b>
                </TD>
              </TR>
              <TR>
                <TD>
                  <b>Min: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_MIN_RATING_KEY%>" value="<%=request.getParameter(Constants.REPORT_MIN_RATING_KEY)%>"/>
                </TD>
                <TD>
                  <b>Max: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_MAX_RATING_KEY%>" value="<%=request.getParameter(Constants.REPORT_MAX_RATING_KEY)%>"/>
                </TD>
              </TR>
              <TR><TD><BR/></TD></TR>
              <TR>
                <TD colspan="2" align="center">
                  <b># of Ratings</b>
                </TD>
              </TR>
              <TR>
                <TD>
                  <b>Min: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_MIN_NUM_RATINGS_KEY%>" value="<%=request.getParameter(Constants.REPORT_MIN_NUM_RATINGS_KEY)%>"/>
                </TD>
                <TD>
                  <b>Max: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_MAX_NUM_RATINGS_KEY%>" value="<%=request.getParameter(Constants.REPORT_MAX_NUM_RATINGS_KEY)%>"/>
                </TD>
              </TR>
              <TR><TD><BR/></TD></TR>
              <TR>
                <TD colspan="2" align="center">
                  <b>Graduation Year</b>
                </TD>
              </TR>
              <TR>
                <TD>
                  <b>Min: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_MIN_GRAD_YEAR_KEY%>" value="<%=request.getParameter(Constants.REPORT_MIN_GRAD_YEAR_KEY)%>"/>
                </TD>
                <TD>
                  <b>Max: </b>
                  <INPUT type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_MAX_GRAD_YEAR_KEY%>" value="<%=request.getParameter(Constants.REPORT_MAX_GRAD_YEAR_KEY)%>"/>
                </TD>
              </TR>
              <TR>
                <TD align="right">
                  <B>Available Columns</B>&#160;&#160;&#160;&#160;
                </TD>
                <TD align="left">&#160;&#160;&#160;&#160;
                  <B>Selected Columns</B>
                </TD>
              </TR>
              <TR>
                <TD align="right">
                  <SELECT NAME="availableColumns" SIZE="7" MULTIPLE="true">
<%
                    for (int k=0; k<profiles.getColumnCount(); k++) {
%>
                    <OPTION value="<%=k%>"><%=profiles.getColumnName(k)%></OPTION>
<%                  }
%>
                  </SELECT>&#160;&#160;&#160;&#160;
                </TD>
                <TD align="left">&#160;&#160;&#160;&#160;
                  <SELECT NAME="selectedColumns" SIZE="7" MULTIPLE="true">
<%
                    String[] cols = request.getParameterValues("selectedColumns");
                    if (cols!=null) {
                      for (int j=0; j<cols.length; j++) {
%>
                    <OPTION value="<%=cols[j]%>"><%=profiles.getColumnName(Integer.parseInt(cols[j]))%></OPTION>
<%
                      }
                    }
%>
                  </SELECT>
                </TD>
              </TR>
              <TR>
                <TD align="right">
                        <A HREF="JavaScript:itemMove('1','availableColumns','selectedColumns')">
                          Add >>
                        </A>&#160;&#160;&#160;&#160;
                </TD>
                <TD align="left">&#160;&#160;&#160;&#160;&#160;
                        <A HREF="JavaScript:itemMove('0','selectedColumns','availableColumns')">
                          &lt;&lt;Remove
                        </A>
                </TD>
              </TR>
              <TR>
                <TD colspan="2" align="center">
                  <A HREF="Javascript:submitForm()">Submit</A>
                </TD>
              </TR>
            </TABLE>
            <script language="javascript">
            <!--
              document.profileListForm.<%=Constants.REPORT_HANDLE_KEY%>.focus();
              function submitEnter(e) {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if (keycode == 13) {
                 submitForm();
                 return false;
                } else return true;
              }
              function submitForm() {
                 var states = document.profileListForm.<%=Constants.REPORT_STATE_KEY%>.value;
                 markSelectedColumns();
                 markUnSelectedColumns();
                 document.profileListForm.<%=Constants.REPORT_STATE_KEY%>.value=addQuotes(states);
                 if (checkRelocate()) {
                   setRelocateIds();
                   document.profileListForm.submit();
                 } else {
                   alert("You must choose at least one relocate answer.");
                 }
              }
              function addQuotes(s) {
                var ret="";
                if (s.length==0) return ret;
                var states = s.split(",");
                for(i=0; i<states.length; i++) {
                  if (states[i].charAt(0)!='\'')
                    ret+="'";
                  ret+=trim(states[i]);
                  if (states[i].charAt(states[i].length-1)!='\'')
                    ret+="'";
                  if(i<states.length-1)
                    ret+=",";
                }
                return ret;
              }
              function trim(s) {
                var ret="";
                var i;
                for (i=0; i<s.length&&s.charAt(i)==' '; i++);
                var k;
                for (k=s.length-1; k>-1&&s.charAt(k)==' '; k--);
                return s.slice(i, k+1);

              }
              function markSelectedColumns() {
                var list = document.profileListForm.selectedColumns;
                for (i=0; i<list.options.length; i++)
                  list.options[i].selected=true;
              }
              function markUnSelectedColumns() {
                var list = document.profileListForm.availableColumns;
                for (i=0; i<list.options.length; i++)
                  list.options[i].selected=false;
              }
              function setRelocateIds() {
                var ret="";
                var list = document.profileListForm.relocateAnswers;
                for (i=0; i<list.length; i++) {
                  if (list.options[i].selected==true) {
                    ret+=list[i].value+",";
                  }
                }
                if (ret.charAt(ret.length-1)==',') {
                  ret = ret.substring(0, ret.length-1);
                }
                document.profileListForm.<%=Constants.REPORT_RELOCATE_KEY%>.value=ret;
              }
              function checkRelocate() {
                var list = document.profileListForm.relocateAnswers;
                for (i=0; i<list.length; i++) {
                  if (list.options[i].selected==true)
                    return true;
                }
                return false;
              }
              function itemMove(select, col, othercol)
              {
                ocl = document.profileListForm[othercol].length;
                cl = document.profileListForm[col].length;
                var sl;
                var columnsSelected = 0;
                for(sl=0;sl< document.profileListForm[col].options.length;sl++){
                  if(!document.profileListForm[col].options[sl].selected || !document.profileListForm[col].options[sl].value > "")continue;
                  columnsSelected++;
                  pText = document.profileListForm[col].options[sl].text;
                  pValue = document.profileListForm[col].options[sl].value;
                  if (document.profileListForm[col].options[sl].value > "" && select == 0) {
                    var arrFbox = new Array();
                    var arrLookup = new Array();
                    var i;
                    for (i = 0; i < document.profileListForm[othercol].options.length; i++) {
                      arrLookup[document.profileListForm[othercol].options[i].text] = document.profileListForm[othercol].options[i].value;
                    }
                    var fLength = 0;
                    for(i = 0; i < document.profileListForm[col].options.length; i++) {
                      arrLookup[document.profileListForm[col].options[i].text] = document.profileListForm[col].options[i].value;
                      if (document.profileListForm[col].options[i].selected && document.profileListForm[col].options[i].value != "") {
                      }
                      else {
                        arrFbox[fLength] = document.profileListForm[col].options[i].text;
                        fLength++;
                      }
                    }
                    document.profileListForm[col].length = 0;
                    var c;
                    for(c = 0; c < arrFbox.length; c++) {
                      var no = new Option();
                      no.value = arrLookup[arrFbox[c]];
                      no.text = arrFbox[c];
                      document.profileListForm[col].options[c] = no;
                    }
                  } else if (document.profileListForm[col].options[sl].value > "" && select == 1) {
                    op = new Option();
                    op.value = pValue;
                    op.text = pText;
                    document.profileListForm[othercol].options[ocl++] = op;
                  }
                }
                if(columnsSelected==0){
                  alert("Please select a column");
                }
              }
            // -->
            </script>
          </FORM>
        </TD>
      </TR>
<%
          columns = request.getParameterValues("selectedColumns");
          if(profiles!=null&&columns!=null) {
%>
      <TR>
        <TD ALIGN="left">
          <TABLE WIDTH="60%" HEIGHT="100%" BORDER="1" CELLPADDING="0" CELLSPACING="0">
            <TR><TD><FONT size="4"><b>Results</b></FONT></TD></TR>
            <TR>
            <TD></TD>
<%
            for (int j=0; j<columns.length; j++) {
%>            <TD><b><%=profiles.getColumnName(Integer.parseInt(columns[j]))%></b></TD>
<%          }
            it = profiles.iterator();
            int k=0;
            while(it.hasNext()) {
              k++;
              if (k%2==1) {
%>          <TR bgcolor="#ccffcc">
<%
              } else {
%>          <TR>

<%
              rsr = (ResultSetContainer.ResultSetRow)it.next();
%>
              <TD><A HREF="<%=Constants.SERVLET_ADDR%>&<%=Constants.TASK_NAME_KEY%>=<%=Constants.REPORT_PROFILE_DETAIL_KEY%>&<%=Constants.REPORT_CODER_ID_KEY%>=<%=rsr.getItem("user_id").toString()%>">detail</A></TD>
<%
              for (int j=0; j<columns.length; j++) {
                  if (rsr.getItem(Integer.parseInt(columns[j])).getResultData() instanceof Date) {  %>
              <TD><rsc:item name="<%=profiles.getColumnName(Integer.parseInt(columns[j]))%>" row="<%=rsr%>" format="MM/dd/yyyy hh:mm a"/></TD>
<%                } else { %>
              <TD><rsc:item name="<%=profiles.getColumnName(Integer.parseInt(columns[j]))%>" row="<%=rsr%>"/></TD>

<%                }
              }
%>
            </TR>
<%           }
            }
%>

          </TABLE>
<%
            }
%>
        </TD>
      </TR>
    </TABLE
  </BODY>
</HTML>


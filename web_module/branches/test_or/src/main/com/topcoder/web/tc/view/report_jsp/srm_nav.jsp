<%@ page import="com.topcoder.shared.dataAccess.DataAccessInt,
                 com.topcoder.shared.dataAccess.CachedDataAccess,
                 com.topcoder.common.web.data.report.Query,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.common.web.data.report.Constants"%>
<%
    String round = request.getParameter("rd");

%>


<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000000" width="170">
	<tr>
		<td bgcolor="#222222" valign="top"><img border="0" src="/i/clear.gif" height="1" width="6" alt=""></td>
		<td bgcolor="#222222" class="statTextBig" height="18" valign="middle">SRM Reports:</td>
		<td bgcolor="#222222" valign="top"><img border="0" src="/i/clear.gif" height="1" width="8" alt=""></td>
	</tr>
	<tr>
	  	<td class="srmText" valign="top">&nbsp;</td>
		<td class="srmText" height="18" valign="middle"><img border="0" src="/i/arrow_white.gif" height="10" width="10" alt="">&nbsp;<a class="srmTextBig" HREF="srm_demo_questions_index.jsp?rd=<%= round %>">Demographic Questions</a></td>
		<td class="srmText" valign="top">&nbsp;</td>
	</tr>
	<tr><td bgcolor="#333333" colspan="3" valign="top"><img border="0" src="/i/clear.gif" height="1" width="1" alt=""></td></tr>
	<tr>
	  	<td class="srmText" valign="top">&nbsp;</td>
		<td class="srmText" height="18" valign="middle"><img border="0" src="/i/arrow_white.gif" height="10" width="10" alt="">&nbsp;<a class="srmTextBig" HREF="srm_demo_general.jsp?rd=<%= round %>">Participation Info</a></td>
		<td class="srmText" valign="top">&nbsp;</td>
	 </tr>
	  <tr><td bgcolor="#333333" colspan="3" valign="top"><img border="0" src="/i/clear.gif" height="1" width="1" alt=""></td></tr>
	 <tr>
	  	<td class="srmText" valign="top">&nbsp;</td>
		<td class="srmText" height="18" valign="middle"><img border="0" src="/i/arrow_white.gif" height="10" width="10" alt="">&nbsp;<a class="srmTextBig" HREF="srm_demo_general_two.jsp?rd=<%= round %>">Time Online / Logged In</a></td>
		<td class="srmText" valign="top">&nbsp;</td>
	 </tr>
	 <tr><td bgcolor="#333333" colspan="3" valign="top"><img border="0" src="/i/clear.gif" height="1" width="1" alt=""></td></tr>
	<tr>
	  	<td class="srmText" valign="top">&nbsp;</td>
		<td class="srmText" height="18" valign="middle"><img border="0" src="/i/arrow_white.gif" height="10" width="10" alt="">&nbsp;<a class="srmTextBig" HREF="srm_index.jsp?rd=<%= round %>">Survey Question</a></td>
		<td class="srmText" valign="top">&nbsp;</td>
	 </tr>
	 <tr><td bgcolor="#333333" colspan="3" valign="top"><img border="0" src="/i/clear.gif" height="1" width="1" alt=""></td></tr>
	<tr>
	  	<td class="srmText" valign="top">&nbsp;</td>
		<td class="srmText" height="18" valign="middle"><img border="0" src="/i/arrow_white.gif" height="10" width="10" alt="">&nbsp;<a class="srmTextBig" HREF="srm_demo_add.jsp?rd=<%= round %>">Schools/Employers</a></td>
		<td class="srmText" valign="top">&nbsp;</td>
	 </tr>
	 <tr><td bgcolor="#333333" colspan="3" valign="top"><img border="0" src="/i/clear.gif" height="1" width="1" alt=""></td></tr>
	<tr>
	  	<td class="srmText" valign="top">&nbsp;</td>
		<td class="srmText" height="18" valign="middle"><img border="0" src="/i/arrow_white.gif" height="10" width="10" alt="">&nbsp;<a class="srmTextBig" HREF="srm_lang_index.jsp?rd=<%= round %>">Language Stats</a></td>
		<td class="srmText" valign="top">&nbsp;</td>
	 </tr>
</table>

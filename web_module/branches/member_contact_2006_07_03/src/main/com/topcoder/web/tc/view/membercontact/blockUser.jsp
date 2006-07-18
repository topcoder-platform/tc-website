<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.common.model.*,
com.topcoder.web.common.dao.*,
com.topcoder.web.common.*
"
				 %>
 <%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%
HibernateUtils.begin();
	String handle = request.getParameter("handle");
boolean block = "true".equals(request.getParameter("block"));
User sender  = DAOUtil.getFactory().getUserDAO().find(new Long(7545675));
User blocked  = DAOUtil.getFactory().getUserDAO().find(handle, false, false);

MemberContactBlackList bl = new MemberContactBlackList();
bl.setId(new MemberContactBlackList.Identifier(sender, blocked));
bl.setBlocked(block);
HibernateUtils.getSession().saveOrUpdate(bl);

HibernateUtils.commit();

%>

<tac:taconiteRoot>

        <tac:replaceChildren contextNodeID="messageDiv" parseOnServer="true">
            <div style="font-weight:bold;color:red;">
               Done
            </div>
        </tac:replaceChildren>
</tac:taconiteRoot>
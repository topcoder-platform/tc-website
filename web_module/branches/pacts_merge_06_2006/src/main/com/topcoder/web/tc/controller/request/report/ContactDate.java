package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.TCDateResult;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import java.util.GregorianCalendar;
import java.util.Map;

public class ContactDate extends Base {
    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        try {

            User user = (User) createEJB(getInitialContext(), User.class);

            getRequest().setAttribute(Constants.HANDLE,
                    user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute(Constants.USER_ID, userId);
            Request r = new Request();
            r.setContentHandle("contact_date");
            r.setProperty(Constants.USER_ID,userId);
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            java.sql.Date date = (java.sql.Date)((TCDateResult)((ResultSetContainer)m.get("contact_date")).getItem(0,0)).getResultData();
            GregorianCalendar gc = new GregorianCalendar();
            gc.setTime(date);
            getRequest().setAttribute("date",gc.get(GregorianCalendar.MONTH)+1+"/"+gc.get(GregorianCalendar.DATE)+"/"+gc.get(GregorianCalendar.YEAR));

            setNextPage(Constants.CONTACT_DATE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

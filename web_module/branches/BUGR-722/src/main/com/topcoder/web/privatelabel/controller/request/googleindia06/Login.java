package com.topcoder.web.privatelabel.controller.request.googleindia06;

import com.topcoder.web.privatelabel.controller.request.FullLogin;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * @author dok
 * @version $Revision: 43007 $ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Login extends FullLogin {

    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        Calendar beginning = Calendar.getInstance();
        beginning.set(2006, Calendar.FEBRUARY, 14, 22, 30);
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        end.set(2006, Calendar.MARCH, 19, 22, 30);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        //log.debug("new: " + regInfo.isNew() + " now " + now + " beginning " + beginning + " end " + end);
        if (regInfo!=null && regInfo.isNew() && (now.before(beginning) || now.after(end))) {
            setNextPage(Constants.GOOGLE_INDIA_06_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE_INDIA_06_LOGIN_PAGE);
                setIsNextPageInContext(true);
            } else {
                setNextPage(Constants.GOOGLE_INDIA_06_REG_PAGE);
                setIsNextPageInContext(true);
            }
        }
    }


    protected ResultSetContainer getCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list_google");
            Map map = getDataAccess(transDb, true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list_google");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }



}

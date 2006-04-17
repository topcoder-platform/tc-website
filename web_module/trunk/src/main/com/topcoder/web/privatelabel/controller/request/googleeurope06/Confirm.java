package com.topcoder.web.privatelabel.controller.request.googleeurope06;

import com.topcoder.web.privatelabel.controller.request.ResumeRegConfirm;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class Confirm extends ResumeRegConfirm {
    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        Calendar beginning = Calendar.getInstance();
        beginning.set(2006, Calendar.FEBRUARY, 14, 22, 30);
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        end.set(2006, Calendar.MAY, 1, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (regInfo.isNew() && (now.before(beginning) || now.after(end))) {
            setNextPage(Constants.GOOGLE_EUROPE_06_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE_EUROPE_06_REG_DEMOG_PAGE);
            } else {
                setNextPage(Constants.GOOGLE_EUROPE_06_REG_CONFIRM_PAGE);
            }
            setIsNextPageInContext(true);
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

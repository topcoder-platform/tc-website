package com.topcoder.web.privatelabel.controller.request.googleindia05;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullReg;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 26, 2005
 */
public class Reg extends FullReg {
    protected void setNextPage() {
        //public final void set(int year, int month, int date, int hour, int minute)

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        //closes on february 25 at 1800 inida time
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.FEBRUARY, 25, 7, 30);

        if (now.after(end)) {
            setNextPage(Constants.GOOGLE_INDIA_05_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.GOOGLE_INDIA_05_REG_PAGE);
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

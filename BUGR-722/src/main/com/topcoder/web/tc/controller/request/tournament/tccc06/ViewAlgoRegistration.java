package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.PreferenceGroup;
import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public class ViewAlgoRegistration extends Base {

    protected void regProcessing() throws Exception {
    }

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2006, Calendar.SEPTEMBER, 12, 18, 0);
        return end;
    }

    public Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        if (ApplicationServer.ENVIRONMENT != ApplicationServer.PROD) {
            beginning.set(2006, Calendar.FEBRUARY, 13, 9, 0);
        } else {
            beginning.set(2006, Calendar.AUGUST, 28, 9, 0);
        }
        return beginning;
    }

    public String getEventName() {
        return "TCCC Alogrithm Competition";
    }

    public int getTermsId() {
        return Constants.TCCC06_ALGORITHM_TERMS_OF_USE_ID;
    }

    protected void setNextPage() throws Exception {
        if (isRegistered()) {
            setNextPage("/tournaments/tccc06/regsuccess.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tccc06/reg.jsp");
            setIsNextPageInContext(true);
        }
    }

    public boolean isEligible() throws Exception {
        Request r = new Request();
        r.setContentHandle("tccc06_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc =
                (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tccc06_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }

    public Integer getPreferenceGroupId() {
        return PreferenceGroup.TCCC06_REG;
    }
}

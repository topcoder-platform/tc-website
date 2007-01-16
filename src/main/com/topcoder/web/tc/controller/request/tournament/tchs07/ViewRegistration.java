package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistration extends RegistrationBase {
    protected void regProcessing() throws Exception {
    }

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2007, Calendar.FEBRUARY, 25, 18, 0);
        return end;
    }

    public Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        if (ApplicationServer.ENVIRONMENT != ApplicationServer.PROD) {
            //if we're not in prod, then let it be open for testing.
            beginning.set(2006, Calendar.FEBRUARY, 13, 9, 0);
        } else {
            beginning.set(2007, Calendar.FEBRUARY, 13, 9, 0);
        }
        return beginning;
    }

    public String getEventName() {
        return "2007 TopCoder High School Tournament";
    }

    public int getTermsId() {
        return Constants.TCHS07_TERMS_OF_USE_ID;
    }

    protected void setNextPage() throws Exception {
        if (isRegistered()) {
            setNextPage("/tournaments/tchs07/termsSuccess.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tchs07/terms.jsp");
            setIsNextPageInContext(true);
        }
    }

    public boolean isEligible() throws Exception {
        //how old are you?
        //are you currently pursuing your secondary (high school) education?
        //are you enrolled full time at a college or university?
        //
        Request r = new Request();
        r.setContentHandle("tchs07_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc =
                (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tchs07_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }

}

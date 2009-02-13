package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;

import java.util.Map;

/**
 * Processor that does usage type processing
 * @author rfairfax
 */
public abstract class BaseScreeningProcessor extends BaseProcessor {
    protected final static Logger log = Logger.getLogger(TestResults.class);

    private long usage;

    public long getUsageType() {
        return usage;
    }

    protected void businessProcessing() throws TCWebException {
        try {
            Long usageType;
            DataAccessInt dAccess = Util.getDataAccess(false);
            Request dr = new Request();
            dr.setContentHandle("usage_type");
            dr.setProperty("uid", String.valueOf(getUser().getId()));
            Map map = dAccess.getData(dr);

            ResultSetContainer access = (ResultSetContainer) map.get("usage_type");

            if (access.getRowCount() == 0) {
                usageType = new Long(Constants.USAGE_TYPE_TESTING);
            } else {
                usageType = new Long(access.getLongItem(0, "usage_type_id"));
            }

            log.debug("USAGE TYPE:" + usageType.longValue());
            usage = usageType.longValue();

            //maybe set attribute here?
            getRequest().setAttribute(Constants.USAGE_TYPE, usageType);

            screeningProcessing();
        } catch (TCWebException ex) {
            throw ex;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    abstract protected void screeningProcessing() throws TCWebException;

    /**
     * A helper method building the URL string for specified request processor and referrer. This method constructs an
     * relative URL in form of : <code>?module=processorName&referrer=referrerName</code>.
     *
     * @param  processorName a <code>String</code> name of a processor to redirect the request to.
     * @param  referrer a <code>String</code> name of a referrer redirecting the request to specified processor. May be
     *         <code>null</code>.
     * @return a <code>String</code> representing the URL to redirect the request to specified processor.
     * @since  Screening Tool 1.1
     */
    protected String buildProcessorURL(String processorName, String referrer) {
        StringBuffer buf = new StringBuffer();
        buf.append(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath());
        buf.append("?");
        buf.append(Constants.MODULE_KEY + "=" + processorName);
        if (referrer != null) {
            buf.append("&");
            buf.append(Constants.REFERRER + "=" + referrer);
        }
        return buf.toString();
    }


}

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 * Processor that does usage type processing
 * @author rfairfax
 */
public abstract class BaseScreeningProcessor extends BaseProcessor {
    private final static Logger log = Logger.getLogger(TestResults.class);

    private long usage;
    public long getUsageType()
    {
        return usage;
    }
    
    protected void businessProcessing() throws TCWebException {
        try
        {
            HttpSession session = getRequest().getSession();
            Long usageType = (Long)
                session.getAttribute(Constants.USAGE_TYPE);
            if(usageType == null) {
                DataAccessInt dAccess = Util.getDataAccess(true);
                Request dr = new Request();
                dr.setContentHandle("usage_type");
                dr.setProperty("uid", String.valueOf(getUser().getId()));
                Map map = dAccess.getData(dr);

                ResultSetContainer access = (ResultSetContainer) map.get("usage_type");

                usageType = new Long(access.getLongItem(0, "usage_type_id"));
                session.setAttribute(Constants.USAGE_TYPE, usageType);
            }

            log.info("USAGE TYPE:" + usageType.longValue());
            usage = usageType.longValue();
            
            //maybe set attribute here?
            getRequest().setAttribute(Constants.USAGE_TYPE, usageType);
            
            screeningProcessing();
        }
        catch(Exception e)
        {
            throw new TCWebException(e);
        }
    }
    
    abstract protected void screeningProcessing() throws TCWebException;


}

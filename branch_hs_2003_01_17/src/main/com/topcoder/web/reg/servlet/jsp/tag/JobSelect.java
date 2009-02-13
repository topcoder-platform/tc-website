package com.topcoder.web.reg.servlet.jsp.tag;

import com.topcoder.common.web.data.JobType;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.DataCache.DataCacheHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;

import javax.naming.Context;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class JobSelect
        extends Select {
    String getOptionValue(Object o) {
        return "" + ((JobType) o).getJobTypeId();
    }

    String getOptionText(Object o) {
        return ((JobType) o).getJobTypeDesc();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList jobs = new ArrayList();
        Context context = null;
        try {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            jobs = dataCache.getJobTypes();
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return jobs;
    }
}

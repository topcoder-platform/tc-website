package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.JobType;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.util.TCContext;

import javax.naming.InitialContext;
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
        InitialContext context = null;
        try {
            context = TCContext.getInitial();
            DataCache dataCache = Cache.get(context);
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

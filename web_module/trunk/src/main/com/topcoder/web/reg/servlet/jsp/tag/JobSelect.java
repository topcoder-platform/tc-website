package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class JobSelect
    extends Select  
{
    String getOptionValue(Object o)
    {
        return ""+((Job)o).getJobId();
    } 

    String getOptionText(Object o)
    {
        return ((Job)o).getJobDesc();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList jobs = new ArrayList();
        Context context = null;
        try
        {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            jobs = dataCache.getJobs();
        }
        catch (Exception e)
        {
            throw new JspException(e.toString());
        }
        finally
        {
            if (context != null)
            {
                try
                {
                    context.close();
                }
                catch (Exception e)
                {
                }
            }
        }
        return jobs;
    }
}

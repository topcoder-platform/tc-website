package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class LanguageSelect
    extends Select 
{
    String getOptionValue(Object o)
    {
        return ""+((Language)o).getLanguageId();
    } 

    String getOptionText(Object o)
    {
        return ((Language)o).getName();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList languages = new ArrayList();
        Context context = null;
        try
        {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            languages = dataCache.getLanguages();
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
        return languages;
    }
}

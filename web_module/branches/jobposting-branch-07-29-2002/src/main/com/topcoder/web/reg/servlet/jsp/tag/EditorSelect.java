package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.shared.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class EditorSelect
    extends Select  
{
    String getOptionValue(Object o)
    {
        return ""+((Editor)o).getEditorId();
    } 

    String getOptionText(Object o)
    {
        return ((Editor)o).getEditorDesc();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList editors = new ArrayList();
        Context context = null;
        try
        {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            editors = dataCache.getEditors();
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
        return editors;
    }
}

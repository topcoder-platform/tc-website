package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.*;
import com.topcoder.ejb.DataCache.*;

public class OrganizationSelect
    extends Select 
{
    Organization OTHER;

    public OrganizationSelect()
    {
        super();
        init();
    }

    void init()
    {
        OTHER = new Organization();
        OTHER.setOrganizationId(0);
        OTHER.setOrganizationDesc("Other Organization");
        OTHER.setOrganization("Other");
    }
    
    String getOptionValue(Object o)
    {
        return ""+((Organization)o).getOrganizationId();
    } 

    String getOptionText(Object o)
    {
        return ((Organization)o).getOrganizationDesc();
    }
    
    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList organizations = new ArrayList();
        organizations.add(OTHER);
        Context context = null;
        try
        {
            DataCache cache = Cache.get();
            organizations.addAll ( cache.getOrganizations() );
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
        return organizations;
    }
}

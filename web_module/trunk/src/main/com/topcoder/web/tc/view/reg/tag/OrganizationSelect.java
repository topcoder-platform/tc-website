package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.Organization;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;

import javax.naming.Context;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class OrganizationSelect
        extends Select {
    Organization OTHER;

    public OrganizationSelect() {
        super();
        init();
    }

    void init() {
        OTHER = new Organization();
        OTHER.setOrganizationId(0);
        OTHER.setOrganizationDesc("Other Organization");
        OTHER.setOrganization("Other");
    }

    String getOptionValue(Object o) {
        return "" + ((Organization) o).getOrganizationId();
    }

    String getOptionText(Object o) {
        return ((Organization) o).getOrganizationDesc();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList organizations = new ArrayList();
        organizations.add(OTHER);
        Context context = null;
        try {
            DataCache cache = Cache.get();
            organizations.addAll(cache.getOrganizations());
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
        return organizations;
    }
}

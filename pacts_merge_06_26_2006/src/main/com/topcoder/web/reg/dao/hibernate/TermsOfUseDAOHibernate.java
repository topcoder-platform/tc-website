package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.TermsOfUseDAO;
import com.topcoder.web.reg.model.TermsOfUse;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class TermsOfUseDAOHibernate extends Base implements TermsOfUseDAO {
    public TermsOfUse find(Integer id) {
        return (TermsOfUse)find(TermsOfUse.class, id);
    }
}

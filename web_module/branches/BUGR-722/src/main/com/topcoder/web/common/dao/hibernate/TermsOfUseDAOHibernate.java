package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.TermsOfUseDAO;
import com.topcoder.web.common.model.TermsOfUse;

/**
 * @author dok
 * @version $Revision: 57327 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class TermsOfUseDAOHibernate extends Base implements TermsOfUseDAO {
    public TermsOfUseDAOHibernate() {
        super();
    }
    
    public TermsOfUseDAOHibernate(Session session) {
        super(session);
    }
    
    public TermsOfUse find(Integer id) {
        return (TermsOfUse) find(TermsOfUse.class, id);
    }
}

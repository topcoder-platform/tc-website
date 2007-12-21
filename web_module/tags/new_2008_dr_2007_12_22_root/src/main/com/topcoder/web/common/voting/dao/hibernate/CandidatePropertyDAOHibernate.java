package com.topcoder.web.common.voting.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.voting.CandidateProperty;
import com.topcoder.web.common.voting.dao.CandidatePropertyDAO;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 31, 2007
 */
public class CandidatePropertyDAOHibernate extends Base implements CandidatePropertyDAO {
    public CandidateProperty find(Integer id) {
        return (CandidateProperty) super.find(CandidateProperty.class, id);
    }

    public List getProperties() {
        return super.findAll(CandidateProperty.class);
    }
}

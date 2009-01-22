package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.CandidatePropertyDAO;
import com.topcoder.web.oracle.model.CandidateProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class CandidatePropertyDAOHibernate extends Base implements CandidatePropertyDAO {


    public CandidateProperty find(Integer id) {
        return (CandidateProperty) super.find(CandidateProperty.class, id);
    }

    public List<CandidateProperty> getProperties() {
        List l = super.findAll(CandidateProperty.class);
        ArrayList<CandidateProperty> ret = new ArrayList<CandidateProperty>(l.size());
        for (Object aL : l) {
            ret.add((CandidateProperty) aL);
        }
        return ret;
    }
}

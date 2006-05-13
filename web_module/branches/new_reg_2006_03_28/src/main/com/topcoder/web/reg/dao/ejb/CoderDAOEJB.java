package com.topcoder.web.reg.dao.ejb;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.reg.dao.CoderDAO;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.reg.model.Coder;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class CoderDAOEJB implements CoderDAO {

    private static final String ds = DBMS.OLTP_DATASOURCE_NAME;
    public Coder find(Long id) {
        long lid = id.longValue();
        try {
            Coder ret = new Coder();
            com.topcoder.web.ejb.coder.Coder coderEJB =
                    (com.topcoder.web.ejb.coder.Coder) BaseProcessor.createLocalEJB(TCContext.getInitial(),
                            com.topcoder.web.ejb.coder.Coder.class);
            if (coderEJB.exists(lid, ds)) {
                ret.setCoderType(Util.getFactory().getCoderTypeDAO().find(
                        new Integer(coderEJB.getCoderTypeId(lid, ds))));
/*
                ret.setCompCountryCode(coderEJB.getCompCountryCode(lid, ds));
                ret.setCurrentSchool();
                ret.setMemberSince();
                ret.setQuote();
                ret.setNew(false);
                ret.s
*/
            }
            return ret;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void saveOrUpdate(Coder u) {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}

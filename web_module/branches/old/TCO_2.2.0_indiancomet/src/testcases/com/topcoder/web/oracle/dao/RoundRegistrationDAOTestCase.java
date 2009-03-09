package com.topcoder.web.oracle.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoundRegistrationDAOTestCase extends TCHibernateTestCase {
    public void testSaveAndFind() {

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));


        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));

        c.addRound(r);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        User dok = DAOUtil.getFactory().getUserDAO().find(132456L);
        RoundRegistration rr = new RoundRegistration();
        rr.setRound(r);
        rr.setUser(dok);
        rr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));

        OracleDAOUtil.getFactory().getRoundRegistrationDAO().saveOrUpdate(rr);

        tearDown();
        setUp();

        RoundRegistration new1 = OracleDAOUtil.getFactory().getRoundRegistrationDAO().find(r, DAOUtil.getFactory().getUserDAO().find(132456L));
        assertFalse("new round reg entry not created", new1 == null);
    }

    public void testFindById() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));


        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));

        c.addRound(r);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        User dok = DAOUtil.getFactory().getUserDAO().find(132456L);
        RoundRegistration rr = new RoundRegistration();
        rr.setRound(r);
        rr.setUser(dok);
        rr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));

        OracleDAOUtil.getFactory().getRoundRegistrationDAO().saveOrUpdate(rr);

        tearDown();
        setUp();

        RoundRegistration new1 = OracleDAOUtil.getFactory().getRoundRegistrationDAO().find(r.getId(), 132456L);
        assertFalse("new round reg entry not created", new1 == null);

    }

}

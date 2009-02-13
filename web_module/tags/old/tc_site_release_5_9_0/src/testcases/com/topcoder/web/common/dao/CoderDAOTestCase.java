package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Coder;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CoderDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Coder tomek = DAOUtil.getFactory().getCoderDAO().find(new Long(144400));

        assertTrue("could not load tomek", tomek != null);

    }

    public void testResumeLoad() {
        Coder dok = DAOUtil.getFactory().getCoderDAO().find(new Long(132456));

        /*Iterator it = dok.getResumes().iterator();
        Resume r = (Resume)it.next();
        log.debug("resume is " + r.getFileName());
        */
        assertFalse("could not find dok's resume", dok.getResumes().isEmpty());

    }


    public void testReferralLoad() {
        Coder tomek = DAOUtil.getFactory().getCoderDAO().find(new Long(144400));
        assertFalse("could not load tomek's referral", tomek.getCoderReferral() == null);
    }

    public void testMemberReferralLoad() {
        Coder somedude = DAOUtil.getFactory().getCoderDAO().find(new Long(13387370));
        assertFalse("some dude's member referral not loaded", somedude.getCoderReferral().getReferenceCoder() == null);
    }

    public void testNonCoderReference() {
        Coder somedude = DAOUtil.getFactory().getCoderDAO().find(new Long(156023));
        assertFalse("could not load some dude's referral", somedude.getCoderReferral() == null);
    }
}

package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Referral;
import com.topcoder.web.common.model.State;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class ReferralDAOTestCase extends TCHibernateTestCase {
    public void testGetReferrals() {
        State co = DAOUtil.getFactory().getStateDAO().find("CO");
        assertFalse("the list of referrals was empty", DAOUtil.getFactory().getReferralDAO().getReferrals(co).isEmpty());
    }

    public void testGetReferralsDeclineState() {
        State co = DAOUtil.getFactory().getStateDAO().find("CO");
        State vt = DAOUtil.getFactory().getStateDAO().find("VT");
        List first = DAOUtil.getFactory().getReferralDAO().getReferrals(co);
        List second = DAOUtil.getFactory().getReferralDAO().getReferrals(vt);
        assertFalse("this list of normal referrals was empty", first.isEmpty());
        assertFalse("this list of decline referrals was empty", second.isEmpty());
        assertTrue("the decline list didn't contain one extra referral", second.size() == first.size() + 1);
        assertTrue("the decline list didn't include the decline referral",
                second.contains(DAOUtil.getFactory().getReferralDAO().findDecline()));
    }

    public void testFindValid() {
        assertFalse("couldn't find the member referral", DAOUtil.getFactory().getReferralDAO().find(Referral.MEMBER_REFERRAL) == null);

    }


    public void testFindDecline() {
        assertFalse("couldn't find the decline referral", DAOUtil.getFactory().getReferralDAO().findDecline() == null);

    }


}

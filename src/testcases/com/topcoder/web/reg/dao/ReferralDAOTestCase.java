package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Referral;
import com.topcoder.web.reg.model.State;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class ReferralDAOTestCase extends TCHibernateTestCase {
    public void testGetReferrals() {
        State co = Util.getFactory().getStateDAO().find("CO");
        assertFalse("the list of referrals was empty", Util.getFactory().getReferralDAO().getReferrals(co).isEmpty());
    }

    public void testGetReferralsDeclineState() {
        State co = Util.getFactory().getStateDAO().find("CO");
        State vt = Util.getFactory().getStateDAO().find("VT");
        List first = Util.getFactory().getReferralDAO().getReferrals(co);
        List second = Util.getFactory().getReferralDAO().getReferrals(vt);
        assertFalse("this list of normal referrals was empty", first.isEmpty());
        assertFalse("this list of decline referrals was empty", second.isEmpty());
        assertTrue("the decline list didn't contain one extra referral", second.size()==first.size()+1);
        assertTrue("the decline list didn't include the decline referral",
                second.contains(Util.getFactory().getReferralDAO().findDecline()));
    }

    public void testFindValid() {
        assertFalse("couldn't find the member referral", Util.getFactory().getReferralDAO().find(Referral.MEMBER_REFERRAL)==null);

    }


    public void testFindDecline() {
        assertFalse("couldn't find the decline referral", Util.getFactory().getReferralDAO().findDecline()==null);

    }



}

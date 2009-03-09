package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Referral;
import com.topcoder.web.common.model.State;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public interface ReferralDAO {
    List getReferrals(State s);

    Referral findDecline();

    Referral find(Integer id);


}

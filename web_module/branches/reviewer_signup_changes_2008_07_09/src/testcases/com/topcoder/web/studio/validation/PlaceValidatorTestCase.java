package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;

import java.sql.Timestamp;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class PlaceValidatorTestCase extends TCHibernateTestCase {
    public void testValid() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));

/*
        ContestPrize cp1 = new ContestPrize();
        cp1.setAmount(new Float("100"));
        cp1.setPlace(new Integer(1));
        cp1.setContest(c);
        cp1.getId().setContest(c);
        cp1.getId().setPlace(new Integer(1));

        c.addPrize(cp1);
*/

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());

        assertTrue("did not validate valid place", new PlaceValidator(c1).validate(new StringInput("1")).isValid());

    }
}

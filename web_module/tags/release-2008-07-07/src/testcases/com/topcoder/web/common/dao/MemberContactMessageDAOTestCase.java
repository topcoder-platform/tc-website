package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.MemberContactMessage;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 24, 2006
 */
public class MemberContactMessageDAOTestCase extends TCHibernateTestCase {


    public void testGetAllSendersToUser() {
        List l = DAOUtil.getFactory().getMemberContactMessageDAO().getAllSendersToUser(new Long(7545675));
        assertTrue("someone should have sent a member contact message to cucu!", l != null && !l.isEmpty());
    }

    public void testFind() {
        MemberContactMessage m = DAOUtil.getFactory().getMemberContactMessageDAO().find(new Long(1));
        assertFalse("we did not find MemberContactMessage 1", m == null);
    }


}

package com.topcoder.web.common.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 57327 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class QuestionStyleDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        assertFalse("couldn't find question style", DAOUtil.getFactory().getQuestionStyleDAO().find(new Integer(1)) == null);
    }
}

/*
* LanguageDAOTestCase
*
* Created Oct 25, 2007
*/
package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.algo.Language;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class LanguageDAOTestCase extends TCHibernateTestCase {
    public void testFindAssignmentLanguages() {

        List<Language> assignmentLanguages = DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages();

        assertTrue("Assignment languages should be 4", assignmentLanguages.size() == 4);

    }
}

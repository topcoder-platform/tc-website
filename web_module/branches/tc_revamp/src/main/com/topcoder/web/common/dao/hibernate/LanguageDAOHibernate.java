package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.LanguageDAO;
import com.topcoder.web.common.model.algo.Language;
 

/**
 * @author pulky
 * @version $Revision: 66662 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class LanguageDAOHibernate extends GenericBase<Language, Integer> implements LanguageDAO {

    public List<Language> findAssignmentLanguages() {
        return getSession().createCriteria(Language.class)
            .add(Restrictions.in("id", Language.assignmentLanguages))
            .list();
    }
}

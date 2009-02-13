package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.QuestionTypeDAO;
import com.topcoder.web.common.model.QuestionType;

/**
 * @author dok
 * @version $Revision: 57327 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class QuestionTypeDAOHibernate extends Base implements QuestionTypeDAO {
    public QuestionTypeDAOHibernate() {
        super();
    }
    
    public QuestionTypeDAOHibernate(Session session) {
        super(session);
    }
    
    public QuestionType find(Integer id) {
        return (QuestionType) find(QuestionType.class, id);
    }
}

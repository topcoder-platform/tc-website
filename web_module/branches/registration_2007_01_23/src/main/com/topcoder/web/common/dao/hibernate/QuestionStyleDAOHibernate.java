package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.QuestionStyleDAO;
import com.topcoder.web.common.model.QuestionStyle;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class QuestionStyleDAOHibernate extends Base implements QuestionStyleDAO {
    public QuestionStyle find(Integer id) {
        return (QuestionStyle) find(QuestionStyle.class, id);
    }
}

package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Session;

import com.topcoder.web.common.dao.AssignmentDocumentStatusDAO;
import com.topcoder.web.common.model.AssignmentDocumentStatus;

public class AssignmentDocumentStatusDAOHibernate extends Base implements AssignmentDocumentStatusDAO {

    public AssignmentDocumentStatusDAOHibernate() {
        super();
    }
    
    public AssignmentDocumentStatusDAOHibernate(Session session) {
        super(session);
    }

    public List findAll() {
        return findAll(AssignmentDocumentStatus.class);
    }
}

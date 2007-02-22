package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Session;

import com.topcoder.web.common.dao.AssignmentDocumentTypeDAO;
import com.topcoder.web.common.model.AssignmentDocumentType;

public class AssignmentDocumentTypeDAOHibernate extends Base implements AssignmentDocumentTypeDAO {

    public AssignmentDocumentTypeDAOHibernate() {
        super();
    }
    
    public AssignmentDocumentTypeDAOHibernate(Session session) {
        super(session);
    }

    public List findAll() {
        return findAll(AssignmentDocumentType.class);
    }
}

package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.CoderDAO;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.educ.StudentClassroom;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CoderDAOHibernate extends Base implements CoderDAO {

    /**
     * Create a CoderDAO object using the default connection information.
     */
    public CoderDAOHibernate() {
        super();
    }

    public CoderDAOHibernate(Session session) {
        super(session);
    }


    public Coder find(Long id) {
        Coder ret = null;
        ret = (Coder) find(Coder.class, id);
        return ret;

    }

    public void saveOrUpdate(Coder u) {
        session.saveOrUpdate(u);
    }
    
    @SuppressWarnings("unchecked")
    public Coder getActiveStudentUsingClassroomId(Long studentId, Long classroomId) {
        Criteria c = session.createCriteria(Coder.class);
        
        c.add(Restrictions.eq("id", studentId))
             .createCriteria("studentClassrooms")
             .add(Restrictions.eq("id.classroom.id", classroomId))
             .add(Restrictions.ne("statusId", StudentClassroom.INACTIVE_STATUS));
            
        return (Coder) c.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public Coder getStudentUsingClassroomId(Long studentId, Long classroomId) {
        Criteria c = session.createCriteria(Coder.class);
        
        c.add(Restrictions.eq("id", studentId))
             .createCriteria("studentClassrooms")
             .add(Restrictions.eq("id.classroom.id", classroomId));
            
        return (Coder) c.uniqueResult();
    }
}


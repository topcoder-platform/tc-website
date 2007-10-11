package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.topcoder.web.common.dao.ClassroomDAO;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.Classroom;
 

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class ClassroomDAOHibernate extends GenericBase<Classroom, Long> implements ClassroomDAO {

    public List<Round> getAssignments(Long classroomId) {
        return getSession().createCriteria(Round.class)
            .createCriteria("roundProperties")
            .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
            .add(Restrictions.eq("intValue", classroomId))
            .addOrder(Order.asc("name"))
            .list();
    }
    
    public List<Round> getAssignmentsForStudent(Long classroomId, Long coderId) {
        Criteria c = getSession().createCriteria(Round.class);

        c.createCriteria("roundRegistrations")
            .add(Restrictions.eq("id.coder.id", coderId));

        c.createCriteria("roundProperties")
            .add(Restrictions.eq("id.typeId", RoundProperty.CLASSROOM_ID_PROPERTY_ID))
            .add(Restrictions.eq("intValue", classroomId));
        
        c.addOrder(Order.asc("name"));
            
        return c.list();
    }
}

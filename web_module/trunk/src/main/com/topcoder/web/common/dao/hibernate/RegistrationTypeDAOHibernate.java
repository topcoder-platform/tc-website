package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.model.RegistrationType;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 13, 2006
 */
public class RegistrationTypeDAOHibernate extends Base implements RegistrationTypeDAO {

    public RegistrationTypeDAOHibernate() {
        super();
    }

    public RegistrationTypeDAOHibernate(Session session) {
        super(session);
    }

    public List<RegistrationType> getRegistrationTypes() {
        StringBuffer query = new StringBuffer(100);
        query.append(" from RegistrationType t ");
        query.append(" where t.active = 1");
        query.append(" order by t.sort");
        Query q = session.createQuery(query.toString());
        return q.list();
    }

    public RegistrationType find(Integer id) {
        return (RegistrationType) find(RegistrationType.class, id);
    }

    public RegistrationType getCompetitionType() {
        //todo perhaps we should cache this
        return find(RegistrationType.COMPETITION_ID);
    }

    public RegistrationType getHighSchoolType() {
        //todo perhaps we should cache this
        return find(RegistrationType.HIGH_SCHOOL_ID);
    }

    public RegistrationType getCorporateType() {
        //todo perhaps we should cache this
        return find(RegistrationType.CORPORATE_ID);
    }

    public RegistrationType getMinimalType() {
        //todo perhaps we should cache this
        return find(RegistrationType.MINIMAL_ID);
    }

    public RegistrationType getSoftwareType() {
        //todo perhaps we should cache this
        return find(RegistrationType.SOFTWARE_ID);
    }

    public RegistrationType getStudioType() {
        //todo perhaps we should cache this
        return find(RegistrationType.STUDIO_ID);
    }

    public RegistrationType getTeacherType() {
        //todo perhaps we should cache this
        return find(RegistrationType.TEACHER_ID);
    }

    public RegistrationType getOpenAIMType() {
        //todo perhaps we should cache this
        return find(RegistrationType.OPENAIM_ID);
    }

    public RegistrationType getTruveoType() {
        //todo perhaps we should cache this
        return find(RegistrationType.TRUVEO_ID);
    }


}

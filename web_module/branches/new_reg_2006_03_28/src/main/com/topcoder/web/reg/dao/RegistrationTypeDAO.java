package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.RegistrationType;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 13, 2006
 */
public class RegistrationTypeDAO extends Base {

    public RegistrationTypeDAO() {
        super();
    }
    public RegistrationTypeDAO(Session session) {
        super(session);
    }
    
    public List getRegistrationTypes() {
        return findAll(RegistrationType.class, "active", new Integer(1));
    }

    public RegistrationType find(Integer id) {
        return (RegistrationType)find(RegistrationType.class, id);
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

}

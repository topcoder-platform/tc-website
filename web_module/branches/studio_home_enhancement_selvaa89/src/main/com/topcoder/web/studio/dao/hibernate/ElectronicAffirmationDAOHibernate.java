package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.ElectronicAffirmationDAO;
import com.topcoder.web.studio.model.ElectronicAffirmation;

import java.util.List;

/**
 * DAO Implemention class
 * @author Vitta
 */
public class ElectronicAffirmationDAOHibernate extends Base implements ElectronicAffirmationDAO {

    public void saveOrUpdate(ElectronicAffirmation entity) {
        super.saveOrUpdate(entity);
    }

    public ElectronicAffirmation find(Integer id) {
        return (ElectronicAffirmation) super.find(ElectronicAffirmation.class, id);
    }
}

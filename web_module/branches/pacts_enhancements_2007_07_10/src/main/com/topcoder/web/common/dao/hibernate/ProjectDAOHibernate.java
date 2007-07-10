package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Session;

import com.topcoder.web.common.dao.ProjectDAO;
import com.topcoder.web.common.model.comp.Project;

/**
 * @author cucu
 */
public class ProjectDAOHibernate extends Base implements ProjectDAO {

    public ProjectDAOHibernate() {
        super();
    }

    public ProjectDAOHibernate(Session session) {
        super(session);
    }

    public Project find(Long id) {        
        return (Project) find(Project.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<Project> find(Integer statusId, Integer categoryId) {
        return session.createQuery(
                "FROM com.topcoder.web.common.model.comp.Project p  " +
                "WHERE p.statusId = :statusId " +
                "AND p.categoryId = :categoryId")
                .setInteger("statusId", statusId)
                .setInteger("categoryId", categoryId)
                .list();
    }

}

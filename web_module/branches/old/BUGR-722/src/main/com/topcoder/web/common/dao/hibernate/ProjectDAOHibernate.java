package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.ProjectDAO;
import com.topcoder.web.common.model.comp.Project;
import org.hibernate.Session;

import java.util.List;

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

    public Project find(Integer id) {
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

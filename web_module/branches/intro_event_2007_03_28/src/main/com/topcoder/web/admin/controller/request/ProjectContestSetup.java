package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.comp.Project;

public class ProjectContestSetup extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {

        List<Project> projects = DAOUtil.getFactory().getProjectDAO().find(Project.STATUS_ACTIVE, 1);
        
        getRequest().setAttribute("projects" , projects);
        setNextPage("/projectContestSetup.jsp");
        setIsNextPageInContext(true);

    }

}

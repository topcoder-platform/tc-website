package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.comp.Contest;
import com.topcoder.web.common.model.comp.Project;

public class ProjectContestSetup extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        Integer catId = new Integer (getRequest().getParameter("catid"));
        
        List<Project> projects = DAOUtil.getFactory().getProjectDAO().find(Project.STATUS_ACTIVE, catId);
        List<Contest> contests = DAOUtil.getFactory().getCompContestDAO().getCurrent(catId + 111);
        
        getRequest().setAttribute("projects" , projects);
        getRequest().setAttribute("contests" , contests);
        getRequest().setAttribute("catid" , catId);
        
        setNextPage("/projectContestSetup.jsp");
        setIsNextPageInContext(true);

    }

}

package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.ProjectDAO;
import com.topcoder.web.common.model.comp.Contest;
import com.topcoder.web.common.model.comp.Project;

/**
 * Links a project for a contest, i.e. inserts a row in contest_project_xref
 * 
 * @author Cucu
 */
public class LinkProjectContest extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        String projects[] = getRequest().getParameterValues("pj");
        Long cid =  new Long(getRequest().getParameter("cid"));
            
        Contest contest = DAOUtil.getFactory().getCompContestDAO().find(cid);
        
        ProjectDAO pdao = DAOUtil.getFactory().getProjectDAO();
        
        List<Project> updatedProjects = new ArrayList<Project>();
        
        for (String pj : projects) {
            Project project = pdao.find(new Integer(pj));
            
            project.addContest(contest);
            contest.addProject(project);
            
            updatedProjects.add(project);
        }

        getRequest().setAttribute("updatedProjects", updatedProjects);
        setNextPage("/linkProjectContest.jsp");
        setIsNextPageInContext(true);

    }

}

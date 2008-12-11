package com.topcoder.web.admin.controller.request;

import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.CompContestDAO;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.ProjectDAO;
import com.topcoder.web.common.model.comp.Contest;
import com.topcoder.web.common.model.comp.Project;

/**
 * Unlinks a project for a contest, i.e. removes a row from contest_project_xref
 * 
 * @author Cucu
 */
public class UnlinkProjectContest extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        String removed[] = getRequest().getParameterValues("rmv");
            
        CompContestDAO cdao = DAOUtil.getFactory().getCompContestDAO();      
        ProjectDAO pdao = DAOUtil.getFactory().getProjectDAO();
        
        Set<Project> updatedProjects = new HashSet<Project>();
        
        for (String rmv : removed) {
            String []values = rmv.split(":"); 
            Integer pj = new Integer(values[0]);
            Long ct = new Long(values[1]);
            
            Project project = pdao.find(pj);
            Contest contest = cdao.find(ct);
            
            project.removeContest(contest);

            updatedProjects.add(project);
        }

        getRequest().setAttribute("updatedProjects", updatedProjects);
        setNextPage("/linkProjectContest.jsp");
        setIsNextPageInContext(true);

    }

}

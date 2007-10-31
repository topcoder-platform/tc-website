/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.ep.util.AssignmentOverviewRow;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelectReport extends SharedBaseProcessor {

    @Override
    protected void professorProcessing() throws Exception {
        Classroom c = validateClassroom();
        
        // check if this classroom belongs to the logged professor
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        processReport(c);
    }

    @Override
    protected void studentProcessing() throws Exception {
        Classroom c = validateClassroom();
        
        // check if the logged student belongs to this classroom 
        if (DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(getUser().getId(), c.getId()) == null) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        processReport(c);
    }
    
    protected void processReport(Classroom c) throws Exception {
        // we need active students and assignments
        getRequest().setAttribute(Constants.CLASSROOM_ID, c.getId());
        getRequest().setAttribute("students", DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.ACTIVE_STATUS));
        getRequest().setAttribute("assignments", generateAssignmentsRows(c.getId()));
        getRequest().setAttribute("schoolName", c.getSchool().getName());                

        setNextPage("/reports/selectReport.jsp");
        setIsNextPageInContext(true);
    }

    private List<AssignmentOverviewRow> generateAssignmentsRows(Long classroomId) throws TCWebException {
        List<AssignmentOverviewRow> laor = new ArrayList<AssignmentOverviewRow>();
        for (ResultSetRow rsr : getData(classroomId)) {
            laor.add(new AssignmentOverviewRow(
                    rsr.getLongItem("round_id"),
                    rsr.getStringItem("name"),
                    rsr.getIntItem("assigned"),
                    rsr.getIntItem("opened"),
                    rsr.getIntItem("finished")                    
                    ));
        }
        return laor;
    }

    private Classroom validateClassroom() throws TCWebException {
        // check if it's a valid classroom
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(getClassroomParam());
        if (c == null) {
            throw new TCWebException("Couldn't find classroom");
        }
        return c;
    }
    
    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));

        if (classroomId.equals("")) {
            throw new TCWebException("Invalid classroom id");
        }

        Long id;
        try {
            id = Long.parseLong(classroomId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid classroom id");
        }

        return id;
    }

    private ResultSetContainer getData(Long classroomId) throws TCWebException {
        try {
            Request r = new Request();
            String queryName = "classroom_assignments_overview";
            r.setProperty("clsid", classroomId.toString());
            r.setContentHandle(queryName);

            DataAccessInt dai = getDataAccess();
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);

            return rsc;
        } catch (Exception e) {
            throw new TCWebException("Could not get data from DB", e);
        }
    }

}

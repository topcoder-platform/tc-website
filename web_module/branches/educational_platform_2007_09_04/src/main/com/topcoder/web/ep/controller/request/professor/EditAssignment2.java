/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.algo.Language;
import com.topcoder.web.common.model.algo.ProblemSet;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.AssignmentScoreType;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.LongBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignment2 extends LongBase {

    private static Logger log = Logger.getLogger(EditAssignment2.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ea_";

        log.debug("Edit assignment called...");
        if (userLoggedIn()) {
            User u = getActiveUser();
            log.debug("User identified - " + u.getHandle());

            Long assignmentId = getAssignmentParam();
            Long classroomId = getClassroomParam();

            log.debug("assignmentId - " + assignmentId);
            log.debug("classroomId - " + classroomId);
            
            
            //todo change this to only count professor associations, not all
            if (u.getSchools().isEmpty()) {
                throw new TCWebException("No active schools for this professor");
            }

            Round a = null;
            if (assignmentId != null) {
                // we are editing or inserting a new one but we already have data in session

                // check if this assignment belongs to the active user
                a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);

                Object classroomProperty = a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID);

                if (classroomProperty == null) {
                    throw new TCWebException("The assignment has an invalid classroom id");
                }

                classroomId = (Long) classroomProperty;

                // check if the assignment can be edited 
                if (a != null && (new Date((new Date()).getTime() + Constants.TIME_BEFORE_EDIT)).after(a.getContest().getStartDate())) {
                    throw new NavigationException("The assignment is about to start or has already started and therefore cannot be edited");
                }
            } else {
                a = new Round();
                // this is a new assignment, we need the classroom id
                if (classroomId == null) {
                    throw new TCWebException("Invalid classroom id");
                }
            }

            // check if this classroom belongs to the active user
            Classroom c = checkValidClassroom(classroomId);

            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());

                if (assignmentId != null) {

                    setDefault("assignment_name", a.getName());
                    setDefault("assignment_start", a.getContest().getStartDate());
                    setDefault("assignment_end", a.getContest().getEndDate());
                    setDefault("assignment_coding_phase_length", (Long) a.getProperty(RoundProperty.CODING_PHASE_LENGTH_PROPERTY_ID));
                    setDefault("assignment_show_all_scores", ((Long) a.getProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID)).equals(1l) ? "true" : "false");
                    setDefault("assignment_score_type", (Long) a.getProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID));

                    Set<Integer> al = new HashSet<Integer>();
                    for (Language l : a.getLanguages()) {
                        al.add(l.getId());
                    }
                    getRequest().setAttribute("assignment_languages", al);
                }

                getRequest().setAttribute("assignment_id", a.getId());
                getRequest().setAttribute("classroom_id", c.getId());
                getRequest().setAttribute("classroom_name", c.getName());
                getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());
                getRequest().setAttribute("languages", DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages());
                getRequest().setAttribute("problem_sets", DAOUtil.getFactory().getProblemSetDAO().findAll());

                setNextPage("/professor/editAssignment2.jsp");
                setIsNextPageInContext(true);
            } else {
                log.debug("Second pass - " + getUser().getUserName());

                if (userLoggedIn()) {
                    // got a response, validate.

                    String assignmentName = StringUtils.checkNull(getRequest().getParameter("assignment_name"));
                    if (assignmentName.equals("")) {
                        addError("error", "Please enter an assignment name");
                    }

                    String assignmentStart = StringUtils.checkNull(getRequest().getParameter("assignment_start"));
                    Timestamp assignmentStartDate = null;
                    if (assignmentStart.equals("")) {
                        addError("error", "Please enter an assignment start");
                    } else if (!isValidDate(assignmentStart)) {
                        addError("error", "Invalid assignment start date");
                    } else {
                        assignmentStartDate = new Timestamp(parseDate(assignmentStart).getTime());
                    }

                    if (assignmentStartDate != null && assignmentStartDate.before(new Date())) {
                        addError("error", "Assignment start date should be in the future");
                    }

                    String assignmentEnd = StringUtils.checkNull(getRequest().getParameter("assignment_end"));
                    Timestamp assignmentEndDate = null;
                    if (assignmentEnd.equals("")) {
                        addError("error", "Please enter an assignment end");
                    } else if (!isValidDate(assignmentEnd)) {
                        addError("error", "Invalid assignment start date");
                    } else {
                        assignmentEndDate = new Timestamp(parseDate(assignmentEnd).getTime());
                    }

                    if (assignmentEndDate != null && assignmentEndDate.before(new Date())) {
                        addError("error", "Assignment end date should be in the future");
                    }

                    if (assignmentEndDate != null && assignmentStartDate != null && assignmentEndDate.before(assignmentStartDate)) {
                        addError("error", "Invalid range for Assignment start and end");
                    }

                    String codingPhaseLengthParam = StringUtils.checkNull(getRequest().getParameter("assignment_coding_phase_length"));
                    Long codingPhase = null;
                    if (codingPhaseLengthParam.equals("")) {
                        addError("error", "Please enter a coding phase length");
                    } else {
                        try {
                            codingPhase = Long.parseLong(codingPhaseLengthParam);
                        } catch (NumberFormatException e) {
                            addError("error", "Invalid coding phase length");
                        }
                    }

                    if (codingPhase != null && codingPhase < 0) {
                        addError("error", "Please enter a valid coding phase");
                    }

                    String showAllScores = StringUtils.checkNull(getRequest().getParameter("assignment_show_all_scores"));

                    String scoreType = StringUtils.checkNull(getRequest().getParameter("assignment_score_type"));
                    if (scoreType.equals("")) {
                        throw new TCWebException("Invalid score type");
                    }


                    String[] languages = getRequest().getParameterValues(Constants.LANGUAGE_ID);
                    if (languages == null || languages.length == 0) {
                        addError("error", "You must select at least one language");
                    }


                    if (DAOUtil.getFactory().getRoundDAO().findDuplicateName(c.getId(), assignmentName, assignmentId).size() > 0) {
                        addError("error", "You already have an assignment with the same name");
                    }

                    Integer problemSetId = getProblemSetParam();

                    if (assignmentId == null && problemSetId == null) {
                        addError("error", "You must select a problem set");
                    }

                    ProblemSet ps = null;
                    if (problemSetId != null) {
                        ps = getFactory().getProblemSetDAO().find(problemSetId);
                    }

                    if (problemSetId != null && ps == null) {
                        throw new TCWebException("Couldn't find problem set");
                    }



                    Set<Integer> al = new HashSet<Integer>();
                    if (languages != null) {
                        for (String language : languages) {
                            if (!Language.assignmentLanguages.contains(Integer.parseInt(language))) {
                                throw new TCWebException("Invalid language selected");
                            }
                            al.add(Integer.parseInt(language));
                        }
                    }

                    String languagesList = "";
                    for (Language l : DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages()) {
                        if (al.contains(l.getId())) {
                            languagesList += l.getName() + ((al.size() > 1) ? ", " : "");
                        }
                    }

                    getRequest().setAttribute("assignment_languages", al);
                    getRequest().setAttribute("assignment_id", a.getId());
                    getRequest().setAttribute("classroom_id", c.getId());
                    getRequest().setAttribute("classroom_name", c.getName());


                    if (!hasErrors()) {
                        getRequest().setAttribute("assignment_name", assignmentName);
                        getRequest().setAttribute("assignment_start", assignmentStart);
                        getRequest().setAttribute("assignment_end", assignmentEnd);
                        getRequest().setAttribute("assignment_coding_phase_length", codingPhaseLengthParam);
                        getRequest().setAttribute("assignment_show_all_scores", "on".equals(showAllScores) ? "true" : "false");
                        getRequest().setAttribute("assignment_score_type", AssignmentScoreType.getUsingId(Integer.parseInt(scoreType)).getDescription());
                        getRequest().setAttribute("languages", languagesList);
                        getRequest().setAttribute(Constants.PROBLEM_SET_ID, getRequest().getParameter(Constants.PROBLEM_SET_ID));

                        // next step, confirmation.
                        setNextPage("/professor/editAssignmentConfirm2.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        setDefault("assignment_name", assignmentName);
                        setDefault("assignment_start", assignmentStart);
                        setDefault("assignment_end", assignmentEnd);
                        setDefault("assignment_coding_phase_length", codingPhaseLengthParam);
                        setDefault("assignment_show_all_scores", "on".equals(showAllScores) ? "true" : "false");
                        setDefault("assignment_score_type", scoreType);
                        setDefault(Constants.PROBLEM_SET_ID, getRequest().getParameter(Constants.PROBLEM_SET_ID));

                        getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());
                        getRequest().setAttribute("languages", DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages());
                        getRequest().setAttribute("problem_sets", DAOUtil.getFactory().getProblemSetDAO().findAll());

                        setNextPage("/professor/editAssignment2.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }


    /**
     * @param classroomId
     * @return
     * @throws NavigationException
     */
    private Classroom checkValidClassroom(Long classroomId) throws NavigationException {
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);

        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }
        return c;
    }

    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));

        if (classroomId.equals("")) {
            return null;
        }

        Long id;
        try {
            id = Long.parseLong(classroomId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid classroom id");
        }

        return id;
    }

    private Long getAssignmentParam() throws TCWebException {
        String assignmentId = StringUtils.checkNull(getRequest().getParameter(Constants.ASSIGNMENT_ID));

        if (assignmentId.equals("")) {
            return null;
        }

        Long id;
        try {
            id = Long.parseLong(assignmentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid assignment (round) id");
        }

        return id;
    }

    private Integer getProblemSetParam() throws TCWebException {
        String problemSetId = StringUtils.checkNull(getRequest().getParameter(Constants.PROBLEM_SET_ID));

        if (problemSetId.equals("")) {
            return null;
        }

        Integer id;
        try {
            id = Integer.parseInt(problemSetId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid problem set id");
        }

        return id;
    }

    protected boolean isValidDate(String s) {
        return parseDate(s) != null;
    }

    protected Date parseDate(String s) {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        ParsePosition pp = new ParsePosition(0);
        return sdf.parse(s, pp);
    }

    protected String formatDate(Date d) {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        return sdf.format(d);
    }

}

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
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Language;
import com.topcoder.web.common.model.algo.ProblemSet;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundComponent;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.ShortBase;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;
import com.topcoder.web.ep.model.AssignmentScoreType;
import com.topcoder.web.ep.model.Classroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: EditAssignment.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class EditAssignment extends ShortBase {

    private static Logger log = Logger.getLogger(EditAssignment.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ea_";

        log.debug("Edit assignment called...");
        if (userLoggedIn()) {
            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());

                Long assignmentId = getAssignmentParam();
                Long classroomId = getClassroomParam();
                Boolean freshStart = StringUtils.checkNull(getRequest().getParameter(Constants.FRESH_ID)).equals("true");
                
                processFirstPass(assignmentId, classroomId, freshStart);
            } else {
                AssignmentDTO adto = getAssignment();
                getRequest().setAttribute("schoolName", adto.getSchoolName());                
                log.debug("Second pass - " + getUser().getUserName());
                if (adto == null) {
                    throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
                } else {
                    processSecondPass(adto);
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    private void processFirstPass(Long assignmentId, Long classroomId,
            Boolean freshStart) throws TCWebException, NavigationException {
        if (DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(getUser().getId()).isEmpty()) {
            throw new TCWebException("No active schools for this professor");
        }

        // check if we already have data in the session
        // this is possible if the user goes to confirmation and then hit the back button
        AssignmentDTO assignmentInSession = getAssignment();
        Boolean hasDataInSession = assignmentInSession != null;
        
        //check if the data in the session is for a different assignment
        if (freshStart || (assignmentId != null && assignmentInSession != null && !assignmentId.equals(assignmentInSession.getRoundId()))) {
            assignmentInSession = null;
            hasDataInSession = Boolean.FALSE;
        }
        
        // new or edit
        Round a = null;
        if (assignmentId != null || hasDataInSession) {
            // we are editing or inserting a new one but we already have data in session
            if (assignmentId != null) {
                a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);

                Object classroomProperty = a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID);

                if (classroomProperty == null) {
                    throw new TCWebException("The assignment has an invalid classroom id");
                }

                classroomId = (Long) classroomProperty;
            } else {
                classroomId = assignmentInSession.getClassroomId();
            }

            // check if the assignment can be edited 
            if (a != null && (new Date((new Date()).getTime() + Constants.TIME_BEFORE_EDIT)).after(a.getContest().getStartDate())) {
                throw new NavigationException("The assignment is about to start or has already started and therefore cannot be edited");
            }

            // if we have data in the session, use it.
            setDefault("assignment_name", hasDataInSession ? assignmentInSession.getAssignmentName() : a.getName());
            setDefault("assignment_start", formatDate(hasDataInSession ? assignmentInSession.getStartDate() : a.getContest().getStartDate()));
            setDefault("assignment_end", formatDate(hasDataInSession ? assignmentInSession.getEndDate() : a.getContest().getEndDate()));
            setDefault("assignment_coding_phase_length", hasDataInSession ? assignmentInSession.getCoderPhaseLength() : (Long) a.getProperty(RoundProperty.CODING_PHASE_LENGTH_PROPERTY_ID));
            setDefault("assignment_show_all_scores", hasDataInSession ? ((assignmentInSession.getShowAllScores()).equals(1l) ? "true" : "false") : 
                ((Long) a.getProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID)).equals(1l) ? "true" : "false");
            setDefault("assignment_score_type", hasDataInSession ? assignmentInSession.getScoreType() : (Long) a.getProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID));

            if (hasDataInSession) {
                getRequest().setAttribute("assignment_languages", assignmentInSession.getLanguages());
            } else {
                Set<Integer> al = new HashSet<Integer>();
                for (Language l : a.getLanguages()) {
                    al.add(l.getId());
                }
                getRequest().setAttribute("assignment_languages", al);
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
        getRequest().setAttribute("schoolName", c.getSchool().getName());                

        // prepare stuff for the long transaction
        if (!hasDataInSession) {
            clearSession();

            AssignmentDTO adto = new AssignmentDTO();

            adto.setRoundId(a.getId());
            adto.setClassroomId(c.getId());
            adto.setClassroomName(c.getName());
            adto.setSchoolName(c.getSchool().getName());

            if (a.getId() != null) {
                adto.setAssignmentName(a.getName());
                adto.setStartDate(a.getContest().getStartDate());
                adto.setEndDate(a.getContest().getEndDate());
                adto.setCoderPhaseLength((Long) a.getProperty(RoundProperty.CODING_PHASE_LENGTH_PROPERTY_ID));
                adto.setShowAllScores(((Long) a.getProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID)));
                adto.setScoreType((Long) a.getProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID));
            }
            
            // fill the components
            for (RoundComponent rc : a.getRoundComponents()) {
                adto.addComponent(new ComponentDTO(
                        rc.getId().getComponent().getId(),
                        rc.getPoints(),
                        rc.getId().getComponent().getProblem().getName()));
            }

            // fill the languages
            List<Integer> languageList = new ArrayList<Integer>();
            for (Language l : a.getLanguages()) {
                languageList.add(l.getId());
            }
            adto.setLanguages(languageList);

            setAssignment(adto);
        }

        getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());
        getRequest().setAttribute("languages", DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages());
        getRequest().setAttribute("problem_sets", DAOUtil.getFactory().getProblemSetDAO().findAll());

        setNextPage("/professor/editAssignment.jsp");
        setIsNextPageInContext(true);
    }

    private void processSecondPass(AssignmentDTO adto) throws TCWebException {
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

        if (DAOUtil.getFactory().getRoundDAO().findDuplicateName(adto.getClassroomId(), assignmentName, adto.getRoundId()).size() > 0) {
            addError("error", "You already have an assignment with the same name");
        }

        Integer problemSetId = getProblemSetParam();

        if (adto.getRoundId() == null && problemSetId == null) {
            addError("error", "You must select a problem set");
        }

        ProblemSet ps = null;
        if (problemSetId != null) {
            ps = getFactory().getProblemSetDAO().find(problemSetId);
        }

        if (problemSetId != null && ps == null) {
            throw new TCWebException("Couldn't find problem set");
        }

        if (!hasErrors()) {
            // update assignment DTO
            adto.setAssignmentName(assignmentName);
            adto.setCoderPhaseLength(codingPhase);
            adto.setShowAllScores("on".equals(showAllScores) ? 1l : 0l);
            adto.setScoreType(Long.parseLong(scoreType));

            adto.setStartDate(assignmentStartDate);
            adto.setEndDate(assignmentEndDate);

            List<Integer> languageList = new ArrayList<Integer>(languages.length);
            for (String language : languages) {
                if (!Language.assignmentLanguages.contains(Integer.parseInt(language))) {
                    throw new TCWebException("Invalid language selected");
                }
                languageList.add(Integer.parseInt(language));
            }
            adto.setLanguages(languageList);

            // build language string with the selection in order to show it to the user
            String languagesList = "";
            for (Language l : DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages()) {
                if (languageList.contains(l.getId())) {
                    languagesList += l.getName() + ((languageList.size() > 1) ? ", " : "");
                }
            }

            // only if it's a new assignment, process selected problem set
            if (adto.getRoundId() == null) {
                adto.clearComponents();
                for (Component cm : ps.getComponents()) {
                    adto.addComponent(new ComponentDTO(
                            cm.getId(),
                            cm.getProblem().getProposedDifficulty().getPointValue(),
                            cm.getProblem().getName()));
                }
            }

            if (ps != null) {
                getRequest().setAttribute("problem_set_name", ps.getName());
            }

            getRequest().setAttribute("assignment_score_type", AssignmentScoreType.getUsingId(Long.parseLong(scoreType)).getDescription());
            getRequest().setAttribute("languages", languagesList);

            // next step, confirmation.
            setNextPage("/professor/editAssignmentConfirm.jsp");
            setIsNextPageInContext(true);
        } else {
            setDefault("assignment_name", assignmentName);
            setDefault("assignment_start", assignmentStart);
            setDefault("assignment_end", assignmentEnd);
            setDefault("assignment_coding_phase_length", codingPhaseLengthParam);
            setDefault("assignment_show_all_scores", "on".equals(showAllScores) ? "true" : "false");
            setDefault("assignment_score_type", scoreType);
            setDefault(Constants.PROBLEM_SET_ID, getRequest().getParameter(Constants.PROBLEM_SET_ID));

            Set<Integer> al = new HashSet<Integer>();
            if (languages != null) {
                for (String language : languages) {
                    al.add(Integer.parseInt(language));
                }
            }

            getRequest().setAttribute("assignment_languages", al);
            getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());
            getRequest().setAttribute("languages", DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages());
            getRequest().setAttribute("problem_sets", DAOUtil.getFactory().getProblemSetDAO().findAll());

            setNextPage("/professor/editAssignment.jsp");
            setIsNextPageInContext(true);
        }
    }

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

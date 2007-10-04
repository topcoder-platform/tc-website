/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.AssignmentScoreType;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;
import com.topcoder.web.ep.dto.AssignmentDTO;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignment extends Base {

    private static Logger log = Logger.getLogger(EditAssignment.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit assignment called...");

        Long assignmentId = getAssignmentParam();
        Long classroomId = getClassroomParam();

        if (!"POST".equals(getRequest().getMethod())) {
            log.debug("First pass - " + getUser().getUserName());

            User u = getActiveUser();
            
            if (u.getProfessor().getActiveSchools().size() == 0) {
                throw new TCWebException("No active schools for this professor");
            }
            
            // new or edit
            Round a;
            if (assignmentId != null) {
                // we are editing
                
                // check if this assignment belongs to the active user
                a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);

                Object classroomProperty = a.getProperty(RoundProperty.CLASSROOM_ID);

                if (classroomProperty == null) {
                    throw new TCWebException("The assignment has an invalid classroom id");
                }

                classroomId = (Long) classroomProperty;

                setDefault("assignment_name", a.getName());
                setDefault("assignment_start", a.getContest().getStartDate());
                setDefault("assignment_end", a.getContest().getEndDate());
                setDefault("assignment_coding_phase_length", (Long)a.getProperty(RoundProperty.CODING_PHASE_LENGTH));
                setDefault("assignment_show_all_scores", ((Long)a.getProperty(RoundProperty.SHOW_ALL_SCORES)).equals(1l) ? "true" : "false");
                setDefault("assignment_score_type", (Long)a.getProperty(RoundProperty.SCORE_TYPE));

                Set<Integer> al = new HashSet<Integer>();
                for (Language l : a.getLanguages()) {
                    al.add(l.getId());
                }
                
                getRequest().setAttribute("assignment_languages", al);
            } else {
                a = new Round();
                // this is a new assignment, we need the classroom id
                if (classroomId == null) {
                    throw new TCWebException("Invalid classroom id");
                }
            }

            // check if this classroom belongs to the active user
            Classroom c = checkValidClassroom(classroomId);

            // prepare stuff for the long transaction
            clearSession();

            getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());
            getRequest().setAttribute("languages", DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages());
            
            AssignmentDTO adto = new AssignmentDTO();

            adto.setRoundId(a.getId());
            adto.setClassroomId(c.getId());
            adto.setClassroomName(c.getName());

            setAssignment(adto);

            setNextPage("/professor/editAssignment.jsp");
            setIsNextPageInContext(true);
        } else {
            log.debug("Second pass - " + getUser().getUserName());
            if (getActiveUser() == null) {
                throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
            } else if (userLoggedIn()) {
                // got a response, validate.

                String assignmentName = StringUtils.checkNull(getRequest().getParameter("assignment_name"));
                if (assignmentName == "") {
                    addError("error", "Please enter an assignment name");
                }
                
                String assignmentStart = StringUtils.checkNull(getRequest().getParameter("assignment_start"));
                if (assignmentStart == "") {
                    addError("error", "Please enter an assignment start");
                }
                
                String assignmentEnd = StringUtils.checkNull(getRequest().getParameter("assignment_end"));
                if (assignmentEnd == "") {
                    addError("error", "Please enter an assignment end");
                }
                
                String codingPhaseLengthParam = StringUtils.checkNull(getRequest().getParameter("assignment_coding_phase_length"));
                Long codingPhase = null;
                if (codingPhaseLengthParam == "") {
                    addError("error", "Please enter a coding phase length");
                } else {
                    try {
                        codingPhase = Long.parseLong(codingPhaseLengthParam);
                    } catch (NumberFormatException e) {
                        addError("error", "Invalid coding phase length");
                    }
                }

                String showAllScores = StringUtils.checkNull(getRequest().getParameter("assignment_show_all_scores"));

                log.debug("showAllScores: " + showAllScores);
                
                String scoreType = StringUtils.checkNull(getRequest().getParameter("assignment_score_type"));
                if (scoreType == "") {
                    throw new TCWebException("Invalid score type");
                }


                String[] languages = getRequest().getParameterValues(Constants.LANGUAGE_ID);
                if (languages == null || languages.length == 0) {
                    addError("error", "You must select at least one language");
                }
                
                // Todo: we don't want an assignment with the samen name alreay
                
                if (!hasErrors()) {
                    // add assignment DTO to session
                    AssignmentDTO adto = getAssignment();
                    adto.setAssignmentName(assignmentName);
                    adto.setCoderPhaseLength(codingPhase);
                    adto.setShowAllScores("true".equals(showAllScores) ? 1l : 0l);
                    adto.setScoreType(Long.parseLong(scoreType));
                    
                    // This will change when the UI gets the calendar javascript
                    adto.setStartDate(new Timestamp(Timestamp.parse(assignmentStart)));
                    adto.setEndDate(new Timestamp(Timestamp.parse(assignmentEnd)));
                    
                    List<Integer> languageList = new ArrayList<Integer>(languages.length);
                    for (String language : languages) {
                        languageList.add(Integer.parseInt(language));
                    }
                    adto.setLanguages(languageList);
                    
                    // next step, components.
                    setNextPage("/professor/selectComponents.jsp");
                    setIsNextPageInContext(true);
                } else {
                    setDefault("assignment_name", assignmentName);
                    setDefault("assignment_start", assignmentStart);
                    setDefault("assignment_end", assignmentEnd);
                    setDefault("assignment_coding_phase_length", codingPhaseLengthParam);
                    setDefault("assignment_show_all_scores", showAllScores);
                    setDefault("assignment_score_type", scoreType);

                    
                    Set<Integer> al = new HashSet<Integer>();
                    if (languages != null) {
                        for (String language : languages) {
                            al.add(Integer.parseInt(language));
                        }
                    }
                    
                    getRequest().setAttribute("assignment_languages", al);

                    getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());
                    getRequest().setAttribute("languages", DAOUtil.getFactory().getLanguageDAO().findAssignmentLanguages());

                    setNextPage("/professor/editAssignment.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }        
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
        
        if (classroomId == "") {
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
        
        if (assignmentId == "") {
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

}

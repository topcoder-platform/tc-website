/*
* Base
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.topcoder.web.common.LongHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.School;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.model.Classroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: LongBase.java 66901 2007-11-05 19:50:28Z pulky $
 */
public abstract class LongBase extends LongHibernateProcessor {
    private DAOFactory factory = null;

    /**
     * This prefix is to help distinguish different objects in the same session but for different
     * wizards. 
     */
    public String sessionPrefix = ""; 
    
    /**
     * Clears session objects
     */
    protected void clearSession() {
        getRequest().getSession().setAttribute(sessionPrefix + Constants.USER, null);
        getRequest().getSession().setAttribute(sessionPrefix + Constants.SCHOOL, null);
        getRequest().getSession().setAttribute(sessionPrefix + Constants.CLASSROOMS, null);
        getRequest().getSession().setAttribute(sessionPrefix + Constants.STUDENTS, null);
        getRequest().getSession().setAttribute(sessionPrefix + Constants.CLASSROOM, null);
        
        log.debug("Cleaning, sessionPrefix: " + sessionPrefix);
    }

    /**
     * Set the school in the current request processor.  
     *
     * @param s the school to set
     */
    protected void setSchool(School s) {
        log.debug("setting school in session : " + s.getName() + " sessionPrefix: " + sessionPrefix);
        getRequest().getSession().setAttribute(sessionPrefix + Constants.SCHOOL, s);
    }
    
    /**
     * Get the school in the current request processor. 
     */
    protected School getSchool() {
        School school = (School) getRequest().getSession().getAttribute(sessionPrefix + Constants.SCHOOL);
        if (school == null) {
                throw new RuntimeException("Couldn't find school in the session");
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got id: " + school.getId() + " name: " + school.getName() + " school from session");
            }
        }
        return school;
    }
    
    /**
     * Set the selected classrooms in the current request processor.  
     *
     * @param selectedClassrooms the selected classrooms to set
     */
    protected void setSelectedClassrooms(List<Classroom> selectedClassrooms) {
        getRequest().getSession().setAttribute(sessionPrefix + Constants.CLASSROOMS, selectedClassrooms);
    }
    
    /**
     * Get the selected classrooms in the current request processor. 
     */
    protected Set<Classroom> getSelectedClassrooms() {
        List<Classroom> selectedClassrooms = (List<Classroom>) getRequest().getSession().getAttribute(sessionPrefix + Constants.CLASSROOMS);
        if (selectedClassrooms == null) {
                throw new RuntimeException("Couldn't find selected classrooms in the session");
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got " + selectedClassrooms.size() + " selected classrooms from session");
            }
        }
        return new HashSet<Classroom>(selectedClassrooms);
    }
    
    /**
     * Set the selected students in the current request processor.  
     *
     * @param selectedStudents the selected students to set
     */
    protected void setSelectedStudents(List<Coder> selectedStudents) {
        getRequest().getSession().setAttribute(sessionPrefix + Constants.STUDENTS, selectedStudents);
    }
    
    /**
     * Get the selected students in the current request processor. 
     */
    protected Set<Coder> getSelectedStudents() {
        List<Coder> selectedStudents = (List<Coder>) getRequest().getSession().getAttribute(sessionPrefix + Constants.STUDENTS);
        if (selectedStudents == null) {
                throw new RuntimeException("Couldn't find selected students in the session");
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got " + selectedStudents.size() + " selected students from session");
            }
        }
        return new HashSet<Coder>(selectedStudents);
    }
    
    /**
     * Set the classrooms in the current request processor.  
     *
     * @param classrooms the classrooms to set
     */
    protected void setClassroom(Classroom classroom) {
        log.debug("set " + classroom.getName() + " classroom in session");
        getRequest().getSession().setAttribute(sessionPrefix + Constants.CLASSROOM, classroom);
    }

    /**
     * Get the classroomss in the current request processor. 
     */
    protected Classroom getClassroom() {
        Classroom classroom = (Classroom) getRequest().getSession().getAttribute(sessionPrefix + Constants.CLASSROOM);
        if (classroom == null) {
                throw new RuntimeException("Couldn't find classrooms in the session");
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got " + classroom.getName() + " classrooms from session");
            }
        }
        return classroom;
    }

    protected DAOFactory getFactory() {
        if (factory  == null) {
            factory = DAOUtil.getFactory();
        }
        return factory;
    }
}

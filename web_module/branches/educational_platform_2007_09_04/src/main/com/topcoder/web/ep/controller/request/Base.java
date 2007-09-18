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
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public abstract class Base extends LongHibernateProcessor {

    private User user = null;
    private DAOFactory factory = null;

    /**
     * Retrieve the user that is involved in the current registration process.
     * First see if it's cached in this request processor, then try the session
     * and finally load it from the db.
     *
     * @return the user, we'll return null if the user does not currently have an
     *         account or if <code>setRegUser</code> has not yet been called.
     */
    protected User getActiveUser() {
        if (user == null) {
            user = (User) getRequest().getSession().getAttribute(Constants.USER);
            if (user == null) {
                if (userLoggedIn()) {
                    log.debug("get user from the dao");
                    user = getFactory().getUserDAO().find(new Long(getUser().getId()));
                    if (user != null) {
                        setActiveUser(user);
                    } else {
                        throw new RuntimeException("Couldn't find user " + getUser().getId() + " in the database");
                    }
                } else {
                    log.debug("not logged in and user is null");
                }
            } else {
                if (log.isDebugEnabled()) {
                    log.debug("got id: " + user.getId() + " handle: " + user.getHandle() + " user from session");
                }
            }
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got id: " + user.getId() + " handle: " + user.getHandle() + " user from processor");
            }
        }
        return user;
    }

    protected void clearSession() {
        getRequest().getSession().setAttribute(Constants.USER, null);
    }

    /**
     * Set the  user in the current request processor.  This is generally
     * only necessary if it's a new user istering.  Existing users can be loaded
     * by <code>getUser</code>
     *
     * @param u
     */
    protected void setActiveUser(User u) {
        this.user = u;
        getRequest().getSession().setAttribute(Constants.USER, user);
    }
    
    /**
     * Set the school in the current request processor.  
     *
     * @param s the school to set
     */
    protected void setSchool(School s) {
        getRequest().getSession().setAttribute(Constants.SCHOOL, s);
    }
    
    /**
     * Get the school in the current request processor. 
     */
    protected School getSchool() {
        School school = (School) getRequest().getSession().getAttribute(Constants.SCHOOL);
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
        getRequest().getSession().setAttribute(Constants.CLASSROOMS, selectedClassrooms);
    }
    
    /**
     * Get the selected classrooms in the current request processor. 
     */
    protected Set<Classroom> getSelectedClassrooms() {
        List<Classroom> selectedClassrooms = (List<Classroom>) getRequest().getSession().getAttribute(Constants.CLASSROOMS);
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
        getRequest().getSession().setAttribute(Constants.STUDENTS, selectedStudents);
    }
    
    /**
     * Get the selected students in the current request processor. 
     */
    protected Set<Coder> getSelectedStudents() {
        List<Coder> selectedStudents = (List<Coder>) getRequest().getSession().getAttribute(Constants.STUDENTS);
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
        getRequest().getSession().setAttribute(Constants.CLASSROOM, classroom);
    }
    
    /**
     * Get the classroomss in the current request processor. 
     */
    protected Classroom getClassroom() {
        Classroom classroom = (Classroom) getRequest().getSession().getAttribute(Constants.CLASSROOM);
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

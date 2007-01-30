package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.QuestionStyle;
import com.topcoder.web.common.model.QuestionType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.tc.Constants;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    public static final String AGE = "age";
    public static final String IN_COLLEGE = "incollege";
    public static final String IN_HIGH_SCHOOL = "inhs";

    public static final List YES_NO_ANSWERS;

    static {
        YES_NO_ANSWERS = new ArrayList();
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(false), "No"));
    }


    protected void dbProcessing() throws Exception {

        Long eventId = null;

        try {
            eventId = new Long(StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID)));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid event specified in request.");
        }

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Event e = DAOUtil.getFactory().getEventDAO().find(eventId);
            getRequest().setAttribute("event", e);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            if (now.after(e.getRegistrationEnd())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " is over.");
            } else if (now.before(e.getRegistrationStart())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " has not yet begun.");
            } else {
                User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
                if (!isRegistered(e, u)) {
                    if (isEligible()) {
                        getRequest().setAttribute("questionInfo", e.getSurvey().getQuestions());
                        regProcessing(e, u);
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + e.getDescription());
                    }
                } else {
                    //dont' have anything to do really
                }
                setNextPage(e, u);
            }
        }
    }
    
    public boolean isRegistered(Event e, User u) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if " + getUser().getId() + " is registered for " + e.getId());
        }

        Event curr;
        for (Iterator it = u.getEventRegistrations().iterator(); it.hasNext();) {
            curr = ((EventRegistration) it.next()).getId().getEvent();
            if (curr.equals(e)) {
                return true;
            }
        }
/*        User curr;
        for (Iterator it = e.getUsers().iterator(); it.hasNext();) {
            curr = (User) it.next();
            if (curr.equals(u)) {
                return true;
            }
        }*/
        return false;
    }

    protected abstract void regProcessing(Event event, User user) throws Exception;

    protected abstract void setNextPage(Event event, User user) throws Exception;

    public abstract boolean isEligible() throws Exception;

}

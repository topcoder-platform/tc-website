package com.topcoder.web.tc.controller.request.introevent;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.ejb.query.Command;

/**
 * Base class for registering related tasks in Intro Events.
 * 
 * @author cucu
 */
public abstract class RegistrationBase extends Base {


    private boolean isEarly = false;
    private boolean isLate = false;
    private boolean isRegistered = false;
    
    protected abstract void regProcessing(Event event, User user) throws Exception;

    protected void introEventProcessing() throws Exception {       
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_COMP_ID) &&
            !getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        

        Event e = getEvent();
        User u = getUser().isAnonymous() ? null : DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
            
        getRequest().setAttribute("event", e);
        getRequest().setAttribute("isComp", e.getType().getId().equals(EventType.INTRO_EVENT_COMP_ID));
        getRequest().setAttribute("isAlgo", e.getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID));
        
        // find out if it's too late or too early to register
        Calendar now = Calendar.getInstance();
        now.setTime(new Date());
        Calendar regStart = new GregorianCalendar();
        regStart.setTime(e.getRegistrationStart());
        Calendar regEnd = new GregorianCalendar();
        regEnd.setTime(e.getRegistrationEnd());

        isLate = now.after(regEnd);
        isEarly = now.before(regStart);
        
        if (!isLate && !isEarly && u != null) {
            isRegistered = u.getEventRegistration(e) != null;
        }
         
        regProcessing(e, u);
    }
   
    
    /**
     * Check if the coder is eligible for registering to the event, using the command specified in the intro event.  If no command is provided,
     * it is eligible by default.
     * 
     * @return
     * @throws Exception
     */
    public boolean isEligible() throws Exception {
        Long commandId = getMainEvent().getEligibilityCommandId();
        
        // by default is eligible
        if (commandId == null) {
            return true;
        }
        
        Command cmd = (Command) createEJB(getInitialContext(), Command.class);
        String cmdName = cmd.getCommandDesc(commandId, DBMS.OLTP_DATASOURCE_NAME);
        
        Request r = new Request();
        r.setContentHandle(cmdName);
        
        r.setProperty("cr", String.valueOf(user.getId()));
        r.setProperty("eid", String.valueOf(getEvent().getId()));
        
        Iterator it = new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).values().iterator();
        
        ResultSetContainer rsc = (ResultSetContainer) it.next();
        
        return !rsc.isEmpty();        
    }


    public boolean isEarly() {
        return isEarly;
    }


    public boolean isLate() {
        return isLate;
    }


    public boolean isRegistered() {
        return isRegistered;
    }

}

package com.topcoder.web.admin.controller.request;

import java.util.List;
import java.util.Map;

import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.common.model.IntroEventConfig;

/**
 * @author cucu
 */
public class EditIntroEvent extends IntroEventBase {

    @Override
    protected void dbProcessing() throws Exception {
        Long eid = new Long(getRequest().getParameter("eid"));

        IntroEvent ie = DAOUtil.getFactory().getIntroEventDAO().find(eid);
        
        if (ie == null) {
            throw new NavigationException("Event not found: " + eid);
        }
        
        Long algoEventId = null;
        Long compEventId = null;
        
        // Check if there are algo and/or component events and get their ids
        List<Event> children = DAOUtil.getFactory().getEventDAO().getChildrenTypes(eid);
        
        for(Event child : children) {
            if (child.getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
                algoEventId = child.getId();                
            }
            if (child.getType().getId().equals(EventType.INTRO_EVENT_COMP_ID)) {
                compEventId = child.getId();                
            }
        }
        
        setDefault(EVENT_NAME, ie.getDescription());
        setDefault(EVENT_SHORT_NAME, ie.getShortDescription());
        if (ie.getSchool() == null) {
            setDefault(SCHOOL_TYPE, 0);
        } else {
            setDefault(SCHOOL_TYPE, 2);
            setDefault(SCHOOL_ID, ie.getSchool().getId());
        }
        setDefault(FORUM_ID, ie.getForumId());
        setDefault(TIMEZONE_ID, ie.getTimeZone().getId());
        setDefault(IMAGE_ID, ie.getImage().getId());
        
        for (IntroEventConfig cfg : ie.getConfig().values()) {
            setDefault("cfg" + cfg.getId(), cfg.getValue());
        }
        
        if (algoEventId != null) {
            Event algo = DAOUtil.getFactory().getEventDAO().find(algoEventId);
            setDefault(ALGO_REG_START, DateUtils.getConvertedDate(algo.getRegistrationStart(), 
                    java.util.TimeZone.getDefault().getID(), ie.getTimeZone().getDescription()));
            setDefault(ALGO_REG_END, DateUtils.getConvertedDate(algo.getRegistrationEnd(),  
                    java.util.TimeZone.getDefault().getID(), ie.getTimeZone().getDescription()));
            setDefault(ALGO_REG_USE_TIMEZONE, true);
            
            setDefault(USE_ROUND_SEL, 0);
            setDefault(ROUND_ID, ie.getRoundId());
            
        }

        if (compEventId != null) {
            Event comp = DAOUtil.getFactory().getEventDAO().find(compEventId);
            setDefault(COMP_REG_START, DateUtils.getConvertedDate(comp.getRegistrationStart(), 
                    java.util.TimeZone.getDefault().getID(), ie.getTimeZone().getDescription()));
            setDefault(COMP_REG_END, DateUtils.getConvertedDate(comp.getRegistrationEnd(),  
                    java.util.TimeZone.getDefault().getID(), ie.getTimeZone().getDescription()));
            setDefault(COMP_REG_USE_TIMEZONE, true);
            
        }
        
        setEditIntroEventSelects(algoEventId != null, compEventId != null, false);            

        getRequest().setAttribute("hasAlgo", algoEventId != null);
        getRequest().setAttribute("hasComp", compEventId != null);
        
        setNextPage("/editIntroEvent.jsp");
        setIsNextPageInContext(true);
    }


}

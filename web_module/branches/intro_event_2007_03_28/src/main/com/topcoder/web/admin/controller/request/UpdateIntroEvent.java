package com.topcoder.web.admin.controller.request;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.function.Util;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.common.model.IntroEventConfig;
import com.topcoder.web.common.model.IntroEventPropertyType;
import com.topcoder.web.common.model.TimeZone;
import com.topcoder.web.common.model.comp.Contest;
import com.topcoder.web.common.model.comp.ContestPrize;

/**
 * @author cucu
 */
public class UpdateIntroEvent extends IntroEventBase {

    
    public static final String DO_SEARCH = "ds";
    
    public static final String[] RESTORE_VALUES = {EVENT_NAME, EVENT_SHORT_NAME, SCHOOL_TYPE, SCHOOL_ID, FORUM_ID, TIMEZONE_ID, IMAGE_ID, 
        ALGO_REG_START, ALGO_REG_END, COMP_REG_START, COMP_REG_END, SCHOOL_SEARCH, USE_ROUND_SEL, ROUND_ID, ROUND_SELECT_ID,
        ALGO_REG_USE_TIMEZONE, COMP_REG_USE_TIMEZONE, COMP_FIRST_WEEK, COMP_NUMBER_WEEKS, OVERALL_PRIZES[0], OVERALL_PRIZES[1], OVERALL_PRIZES[2],
        WEEKLY_PRIZES[0], WEEKLY_PRIZES[1], WEEKLY_PRIZES[2]};
    
    
    @Override
    protected void dbProcessing() throws Exception {
        SimpleDateFormat sdfDateTime = new SimpleDateFormat("MM/dd/yyyy HH:mm");

        boolean hasAlgo = getRequest().getParameter(ALGO_REG_END) != null;
        boolean hasComp = getRequest().getParameter(COMP_REG_END) != null;
        
     
        String name = getString(EVENT_NAME, true);
        String sname = getString(EVENT_SHORT_NAME, true);
        Integer schoolType = getInteger(SCHOOL_TYPE);
        
        Long forumId = getLong(FORUM_ID);
        Integer timezoneId = getSelect(TIMEZONE_ID);
        Integer imageId = getSelect(IMAGE_ID);

        DAOFactory factory = DAOUtil.getFactory();

        TimeZone timeZone = null;
        IntroEvent ie = new IntroEvent();
        ie.setDescription(name);
        ie.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_ID));        
        ie.setShortDescription(sname);
        if (forumId != null) ie.setForumId(forumId);
        if (timezoneId != null) { 
            timeZone = factory.getTimeZoneDAO().find(timezoneId);
            ie.setTimezone(timeZone);
        }
        if (imageId != null) ie.setImage(factory.getImageDAO().find(new Long(imageId)));        

        // Fill the school field
        if (schoolType.equals(SCHOOL_TYPE_SELECT)) {
            Integer sid = getSelect(SCHOOL_SELECT_ID);
            if (sid != null)  {
                ie.setSchool(factory.getSchoolDAO().find(sid.longValue()));
            }
        } else if (schoolType.equals(SCHOOL_TYPE_ID)) {
            Integer sid = getInteger(SCHOOL_ID);
            if (sid != null) {
                ie.setSchool(factory.getSchoolDAO().find(sid.longValue()));
            }
        }
        
        List<IntroEventPropertyType> cfg = factory.getIntroEventPropertyTypeDAO().getTypes();

        for (IntroEventPropertyType prop : cfg) {
            if (prop.getType().equals(IntroEventPropertyType.GENERAL_TYPE) ||
                    (prop.getType().equals(IntroEventPropertyType.ALGO_TYPE) && hasAlgo)  ||
                    (prop.getType().equals(IntroEventPropertyType.COMP_TYPE) && hasComp)) {
                
                String value = getRequest().getParameter("cfg" + prop.getId());
                IntroEventConfig iec = new IntroEventConfig();
                iec.setId(new IntroEventConfig.Identifier(ie, prop.getId()));
                iec.setValue(value);
                ie.addConfig(iec);
            }
        }
        
        
        Event algo = null;
        if (hasAlgo) {
            if ("1".equals(getRequest().getParameter(USE_ROUND_SEL))) {
                Integer roundId = getSelect(ROUND_SELECT_ID);
                if (roundId != null) ie.setRoundId(roundId.longValue());
            } else {
                Long roundId = getLong(ROUND_ID);
                if (roundId != null) ie.setRoundId(roundId);
            }
            

            algo = new Event();
            algo.setParent(ie);
            algo.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_ALGO_ID));       
            
            TimeZone tz = getRequest().getParameter(ALGO_REG_USE_TIMEZONE) != null? timeZone : null;
            
            algo.setRegistrationStart(getDateTime(ALGO_REG_START, sdfDateTime, tz));
            algo.setRegistrationEnd(getDateTime(ALGO_REG_END, sdfDateTime, tz));
            
            algo.setDescription(ie.getDescription() + " - Algorithms");
            algo.setShortDescription(ie.getShortDescription() + "Algo");

        }

        Event comp = null;
        if (hasComp) {
            comp = new Event();

            comp.setParent(ie);
            comp.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_COMP_ID));       
            comp.setDescription(ie.getDescription() + " - Development");
            comp.setShortDescription(ie.getShortDescription() + "Algo");
            
            TimeZone tz = getRequest().getParameter(COMP_REG_USE_TIMEZONE) != null? timeZone : null;
            
            comp.setRegistrationStart(getDateTime(COMP_REG_START, sdfDateTime, tz));
            comp.setRegistrationEnd(getDateTime(COMP_REG_END, sdfDateTime, tz));
            
            // Create contests
            Timestamp firstWeek = getDateTime(COMP_FIRST_WEEK, sdfDateTime, null);
            int nweeks = new Integer(getRequest().getParameter(COMP_NUMBER_WEEKS));

            List<Double> overall = new ArrayList<Double>();
            List<Double> weekly = new ArrayList<Double>();

            for (int i = 1; i <= 3; i++) {
                Double d = getDouble(OVERALL_PRIZES[i-1], "Overall " + Util.ordinal(i) + " prize");
                if (d != null && d > 0) overall.add(d); 
                
                d = getDouble(WEEKLY_PRIZES[i-1], "Weekly " + Util.ordinal(i) + " prize");
                if (d != null && d > 0) weekly.add(d); 
            }
            
            addContest(comp, "Overall", 112, firstWeek, nweeks * 7, true, overall);
            addContest(comp, "Overall", 113, firstWeek, nweeks * 7, true, overall);
            
            Timestamp w = firstWeek;
            for (int i = 1; i <= nweeks; i++) {
                addContest(comp, "Week " + i, 112, w, nweeks * 7, false, weekly);
                addContest(comp, "Week " + i, 113, w, nweeks * 7, false, weekly);
                w = addDays(firstWeek, 7);
            }
            
        }
        
        if (hasErrors()) {
            restoreValues();
            setEditIntroEventSelects(hasAlgo, hasComp, false);            

            getRequest().setAttribute("hasAlgo", hasAlgo);
            getRequest().setAttribute("hasComp", hasComp);
            
            setNextPage("/editIntroEvent.jsp");
            setIsNextPageInContext(true);
            return;
        }
        
        factory.getIntroEventDAO().saveOrUpdate(ie);        
        if (algo != null) {
            factory.getEventDAO().saveOrUpdate(algo);
        }
        if (comp != null) {
            factory.getEventDAO().saveOrUpdate(comp);
        }
        
        setNextPage("/main.jsp");
        setIsNextPageInContext(false);
    }

    private void addContest(Event e, String contestDescr, int phase, Timestamp start, int days, boolean isOverall, List<Double> prizes) {
        String phaseStr = phase==112? "Design" : "Development";
        Contest c = new Contest();
        c.setName(e.getParent().getDescription() + " - " + phaseStr + " "+ contestDescr);
        c.setPhaseId(phase);
        c.setEvent(e);
        c.setStartDate(start);
        c.setEndDate(addDays(start, days));
        c.setTypeId(isOverall? Contest.TYPE_INTRO_EVENT_OVERALL : Contest.TYPE_INTRO_EVENT_WEEKLY);
        e.addContest(c);
        
        int place = 1;
        for(Double amount : prizes) {
            ContestPrize cp = new ContestPrize();
            cp.setContest(c);
            cp.setDescription(e.getParent().getDescription() + " - " + phaseStr + " " + contestDescr + ", " + Util.ordinal(place) + " prize");
            cp.setAmount(amount);
            cp.setPlace(place);
            cp.setPrizeTypeId(isOverall? ContestPrize.CONTEST_PRIZE_INTRO_EVENT_OVERALL : ContestPrize.CONTEST_PRIZE_INTRO_EVENT_WEEKLY);
            
            c.addPrize(cp);
            place++;
        }
    }
    
    private void restoreValues() {
        for (String s : RESTORE_VALUES) {
            setDefault(s, getRequest().getParameter(s));
        }

        List<IntroEventPropertyType> configList = DAOUtil.getFactory().getIntroEventPropertyTypeDAO().getTypes();
        
        for (IntroEventPropertyType cfg : configList) {
            setDefault("cfg" + cfg.getId(), getRequest().getParameter("cfg" + cfg.getId()));            
        }

        String ssid = getRequest().getParameter(SCHOOL_SELECT_ID);
        if (ssid !=null && ssid.trim().length() > 0) {
            getRequest().setAttribute(DO_SEARCH, true);            
            getRequest().setAttribute(SCHOOL_SELECT_ID, ssid);            
        }
        
    }
    private Timestamp addDays(Timestamp t, int days){
        Calendar cal = Calendar.getInstance();
        cal.setTime(t);
        cal.add(Calendar.DAY_OF_MONTH, days);
        
        return new Timestamp(cal.getTime().getTime());
    }
    
    private Timestamp getDateTime(String param, SimpleDateFormat sdf, TimeZone tz) {
        Date d;
        try {
            d = sdf.parse(getRequest().getParameter(param));
        } catch (ParseException e) {
            addError(param, "Please enter a valid date");
            return null;
        }
        
        if (tz != null) {
            d = DateUtils.getConvertedDate(d, tz.getDescription(),  java.util.TimeZone.getDefault().getID());
        }
        
        return new Timestamp(d.getTime());
    }
    
    private Double getDouble(String param, String displayName) {
        try {
            return new Double(getRequest().getParameter(param));
        } catch (Exception e) {
            addError(param, "Please enter a valid " + displayName);
            return null;
        }
    }

    private Integer getInteger(String param) {
        String s = getRequest().getParameter(param);
        
        if (s != null && s.trim().length() == 0) {
            addError(param, "Please enter an integer value.");
            return null;            
        }
        
        try {
            return new Integer(s);
        } catch (Exception e) {
            addError(param, "Please enter a valid integer.");
            return null;
        }
    }

    private Long getLong(String param) {
        String s = getRequest().getParameter(param);
        
        if (s != null && s.trim().length() == 0) {
            addError(param, "Please enter an integer value.");
            return null;            
        }
        
        try {
            return new Long(s);
        } catch (Exception e) {
            addError(param, "Please enter a valid integer.");
            return null;
        }
    }

    private Integer getSelect(String param) {
        try {
            Integer x = new Integer(getRequest().getParameter(param));
            if (x.intValue() <= 0) {
                addError(param,"Please select a value");
                return null;                
            }
            return x;
        } catch (Exception e) {
            addError(param, "Invalid value");
            return null;
        }
    }

    private String getString(String param, boolean required) {
        String s = getRequest().getParameter(param);
        
        if (s.trim().length() == 0 && required) {
            addError(param, "Please enter a value");            
        }
        return s;
    }
    

}

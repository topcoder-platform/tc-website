package com.topcoder.web.admin.controller.request;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.ShortHibernateProcessor;
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
public class UpdateIntroEvent extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        SimpleDateFormat sdfDateTime = new SimpleDateFormat("MM/dd/yyyy HH:mm");

        boolean hasAlgo = getRequest().getParameter("algo_reg_start") != null;
        boolean hasComp = getRequest().getParameter("comp_reg_start") != null;
        
     
        String name = getRequest().getParameter("name");
        String sname = getRequest().getParameter("sname");
        String schoolId = getRequest().getParameter("sid");
        String forumId = getRequest().getParameter("fid");
        String timezoneId = getRequest().getParameter("tz");
        String imageId = getRequest().getParameter("img");

        DAOFactory factory = DAOUtil.getFactory();

        TimeZone timeZone = factory.getTimeZoneDAO().find(new Integer(timezoneId));
        
        IntroEvent ie = new IntroEvent();
        ie.setDescription(name);
        ie.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_ID));        
        ie.setShortDescription(sname);
        ie.setSchool(factory.getSchoolDAO().find(new Long(schoolId)));
        ie.setForumId(new Long(forumId));
        ie.setTimezone(timeZone);
        ie.setImage(factory.getImageDAO().find(new Long(imageId)));        
        
        if (hasAlgo) {
            boolean sel = "1".equals(getRequest().getParameter("use_round_sel"));
            String roundId = getRequest().getParameter(sel? "round_id_sel" : "round_id");
            
            ie.setRoundId(new Long(roundId));
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
            algo = new Event();
            algo.setParent(ie);
            algo.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_ALGO_ID));       
            
            TimeZone tz = getRequest().getParameter("algo_tz") != null? timeZone : null;
            
            algo.setRegistrationStart(getDateTime("algo_reg_start", sdfDateTime, tz, "algorithm registration start date"));
            algo.setRegistrationEnd(getDateTime("algo_reg_end", sdfDateTime, tz, "algorithm registration end date"));
            
            algo.setDescription(ie.getDescription() + " - Algorithms");
            algo.setShortDescription(ie.getShortDescription() + "Algo");

        }

        Event comp = null;
        if (hasComp) {
            comp = new Event();

            comp.setParent(ie);
            comp.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_COMP_ID));       
            comp.setDescription(ie.getDescription() + " - Development");
            
            TimeZone tz = getRequest().getParameter("comp_tz") != null? timeZone : null;
            
            comp.setRegistrationStart(getDateTime("comp_reg_start", sdfDateTime, tz, "component registration start date"));
            comp.setRegistrationEnd(getDateTime("comp_reg_end", sdfDateTime, tz, "component registration end date"));
            
            // Create contests
            Timestamp firstWeek = getDateTime("comp_first_week", sdfDateTime, null,"First Week");
            int nweeks = new Integer(getRequest().getParameter("nweeks"));

            List<Double> desOverall = new ArrayList<Double>();
            List<Double> devOverall = new ArrayList<Double>();
            List<Double> desWeekly = new ArrayList<Double>();
            List<Double> devWeekly = new ArrayList<Double>();

            for (int i = 1; i <= 3; i++) {
                Double d = getDouble("prdes" + i + "ov", "Design Overall " + Util.ordinal(i) + " prize");
                if (d != null && d > 0) desOverall.add(d); 
                
                d = getDouble("prdev" + i + "ov", "Development Overall" + Util.ordinal(i) + " prize");
                if (d != null && d > 0) devOverall.add(d); 

                d = getDouble("prdes" + i + "w", "Design Weekly " + Util.ordinal(i) + " prize");
                if (d != null && d > 0) desWeekly.add(d); 

                d = getDouble("prdev" + i + "w", "Development weekly " + Util.ordinal(i) + " prize");
                if (d != null && d > 0) devWeekly.add(d); 
            }
            
            addContest(comp, "Overall", 112, firstWeek, nweeks * 7, true, desOverall);
            addContest(comp, "Overall", 113, firstWeek, nweeks * 7, true, devOverall);
            
            Timestamp w = firstWeek;
            for (int i = 1; i <= nweeks; i++) {
                addContest(comp, "Week " + i, 112, w, nweeks * 7, false, desWeekly);
                addContest(comp, "Week " + i, 113, w, nweeks * 7, false, desWeekly);
                w = addDays(firstWeek, 7);
            }
            
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
            cp.setDescription(e.getParent().getDescription() + " - " + phaseStr + " " + contestDescr + " " + Util.ordinal(place) + " prize");
            cp.setAmount(amount);
            cp.setPlace(place);
            cp.setPrizeTypeId(isOverall? ContestPrize.CONTEST_PRIZE_INTRO_EVENT_OVERALL : ContestPrize.CONTEST_PRIZE_INTRO_EVENT_WEEKLY);
            
            c.addPrize(cp);
            place++;
        }
    }
    
    private Timestamp addDays(Timestamp t, int days){
        Calendar cal = Calendar.getInstance();
        cal.setTime(t);
        cal.add(Calendar.DAY_OF_MONTH, days);
        
        return new Timestamp(cal.getTime().getTime());
    }
    
    private Timestamp getDateTime(String param, SimpleDateFormat sdf, TimeZone tz, String displayName) {
        Date d;
        try {
            d = sdf.parse(getRequest().getParameter(param));
        } catch (ParseException e) {
            addError("err", "Please enter a valid " + displayName);
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
            addError("err", "Please enter a valid " + displayName);
            return null;
        }
    }

}

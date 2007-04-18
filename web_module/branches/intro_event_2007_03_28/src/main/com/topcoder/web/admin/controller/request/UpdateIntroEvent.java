package com.topcoder.web.admin.controller.request;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.common.model.IntroEventConfig;
import com.topcoder.web.common.model.IntroEventPropertyType;
import com.topcoder.web.common.model.TimeZone;

/**
 * @author cucu
 */
public class UpdateIntroEvent extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        SimpleDateFormat sdfDateTime = new SimpleDateFormat("MM/dd/yyyy HH:mm");

        boolean hasAlgo = getRequest().getParameter("algo_reg_start") != null;
        boolean hasComp = getRequest().getParameter("algo_comp_start") != null;
        
     
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

        factory.getIntroEventDAO().saveOrUpdate(ie);        
        if (algo != null) {
            factory.getEventDAO().saveOrUpdate(algo);
        }
        
        setNextPage("/main.jsp");
        setIsNextPageInContext(false);
    }

    
    private Timestamp getDateTime(String param, SimpleDateFormat sdf, TimeZone tz, String displayName) {
        log.debug("getDateTime " + param);
        Date d;
        try {
            d = sdf.parse(getRequest().getParameter(param));
        } catch (ParseException e) {
            log.debug(e);
            addError("err", "Please enter a valid " +displayName);
            return null;
        }
        
        if (tz != null) {
            log.debug("use tz " + tz.getDescription());
            d = DateUtils.getConvertedDate(d, tz.getDescription(),  java.util.TimeZone.getDefault().getID());
        }
        
        return new Timestamp(d.getTime());
    }

}

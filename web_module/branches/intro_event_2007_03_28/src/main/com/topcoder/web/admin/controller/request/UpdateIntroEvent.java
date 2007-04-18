package com.topcoder.web.admin.controller.request;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEvent;
import com.topcoder.web.common.model.IntroEventConfig;
import com.topcoder.web.common.model.IntroEventPropertyType;

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
        
        IntroEvent ie = new IntroEvent();
        ie.setDescription(name);
        ie.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_ID));        
        ie.setShortDescription(sname);
        ie.setSchool(factory.getSchoolDAO().find(new Long(schoolId)));
        ie.setForumId(new Long(forumId));
        ie.setTimezone(factory.getTimeZoneDAO().find(new Integer(timezoneId)));
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
            ie.setType(factory.getEventTypeDAO().find(EventType.INTRO_EVENT_ALGO_ID));       
            
            String registrationStart = getRequest().getParameter("algo_reg_start");
            String registrationEnd = getRequest().getParameter("algo_reg_end");
            
            algo.setRegistrationStart(new Timestamp(sdfDateTime.parse(registrationStart).getTime()));
            algo.setRegistrationEnd(new Timestamp(sdfDateTime.parse(registrationEnd).getTime()));
            algo.setShortDescription(ie.getDescription() + " - Algorithms");

        }

        factory.getIntroEventDAO().saveOrUpdate(ie);        
        if (algo != null) {
            factory.getEventDAO().saveOrUpdate(algo);
        }
        
        setNextPage("/main.jsp");
        setIsNextPageInContext(false);
    }

    

}

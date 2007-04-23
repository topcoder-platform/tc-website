package com.topcoder.web.admin.controller.request;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Image;

/**
 * @author cucu
 */
public abstract class IntroEventBase extends ShortHibernateProcessor {

    public static final String EVENT_NAME = "name";
    public static final String EVENT_SHORT_NAME = "sname";
    public static final String SCHOOL_TYPE = "school_type";
    public static final String SCHOOL_ID = "sid";
    public static final String SCHOOL_SELECT_ID = "ssid";
    public static final String FORUM_ID = "fid";
    public static final String TIMEZONE_ID = "tz";
    public static final String IMAGE_ID = "img";
    public static final String ALGO_REG_START = "algo_reg_start";
    public static final String ALGO_REG_END = "algo_reg_end";
    public static final String COMP_REG_START = "comp_reg_start";
    public static final String COMP_REG_END = "comp_reg_end";
    public static final String SCHOOL_SEARCH = "school_search";

    public static final Integer SCHOOL_TYPE_NONE = 0;
    public static final Integer SCHOOL_TYPE_SELECT = 1;
    public static final Integer SCHOOL_TYPE_ID = 2;

    protected void setEditIntroEventSelects(boolean hasAlgo, boolean hasComp) throws Exception {
        DAOFactory factory = DAOUtil.getFactory(); 
        
        List tz = factory.getTimeZoneDAO().getTimeZones();
        getRequest().setAttribute("timezones", tz);
        
        List img = factory.getImageDAO().getImages(Image.INTRO_EVENT_TYPE);
        getRequest().setAttribute("images", img);
        
        List cfg = factory.getIntroEventPropertyTypeDAO().getTypes();
        getRequest().setAttribute("config", cfg);
        
        if (hasAlgo) {
            List rounds = factory.getRoundDAO().getRoundsAfter(new Date());            
            getRequest().setAttribute("rounds", rounds);
        }            
    }


}

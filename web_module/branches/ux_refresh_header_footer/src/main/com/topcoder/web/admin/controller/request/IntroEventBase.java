package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Image;
import com.topcoder.web.common.model.IntroEventPropertyType;

import java.util.Date;
import java.util.List;

/**
 * @author cucu
 */
public abstract class IntroEventBase extends ShortHibernateProcessor {

    public static final String HAS_ALGO = "ha";
    public static final String HAS_COMP = "hc";

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
    public static final String USE_ROUND_SEL = "use_round_sel";
    public static final String COMPETITION_USE_ROUND_SEL = "cp" + USE_ROUND_SEL;
    public static final String ROUND_ID = WebConstants.ROUND_ID;
    public static final String ROUND_SELECT_ID = "rsid";
    public static final String COMPETITION_ROUND_ID = "cp" + ROUND_ID;
    public static final String COMPETITION_ROUND_SELECT_ID = "cp" + ROUND_SELECT_ID;
    public static final String ALGO_REG_USE_TIMEZONE = "algo_tz";
    public static final String COMP_REG_USE_TIMEZONE = "comp_tz";
    public static final String COMP_FIRST_WEEK = "comp_first_week";
    public static final String COMP_NUMBER_WEEKS = "comp_number_weeks";
    public static final String[] OVERALL_PRIZES = {"prize1ov", "prize2ov", "prize3ov"};
    public static final String[] WEEKLY_PRIZES = {"prize1w", "prize2w", "prize3w"};

    public static final String EVENT_ID = "eid";
    public static final String ALGO_EVENT_ID = "algoid";
    public static final String COMP_EVENT_ID = "compid";

    public static final Integer SCHOOL_TYPE_NONE = 0;
    public static final Integer SCHOOL_TYPE_SELECT = 1;
    public static final Integer SCHOOL_TYPE_ID = 2;

    protected void setEditIntroEventSelects(boolean hasAlgo, boolean hasComp, boolean setConfigDefaults) throws Exception {
        DAOFactory factory = DAOUtil.getFactory();

        List tz = factory.getTimeZoneDAO().getTimeZones();
        getRequest().setAttribute("timezones", tz);

        List img = factory.getImageDAO().getImages(Image.INTRO_EVENT_TYPE);
        getRequest().setAttribute("images", img);


        List<IntroEventPropertyType> configList = factory.getIntroEventPropertyTypeDAO().getTypes();

        if (setConfigDefaults) {
            for (IntroEventPropertyType cfg : configList) {
                setDefault("cfg" + cfg.getId(), cfg.getDefaultValue());
            }
        }

        getRequest().setAttribute("config", configList);


        if (hasAlgo) {
            List rounds = factory.getRoundDAO().getRoundsAfter(new Date());
            getRequest().setAttribute("rounds", rounds);
        }

        Request r = new Request();
        r.setContentHandle("find_forums");
        r.setProperty("fcid", "18"); // college tour category
        getRequest().setAttribute("forums", new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("find_forums"));

    }


}

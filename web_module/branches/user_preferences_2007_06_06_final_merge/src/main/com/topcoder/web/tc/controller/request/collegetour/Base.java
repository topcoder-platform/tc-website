package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.ImageInfo;
import com.topcoder.web.tc.Constants;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
abstract public class Base extends BaseProcessor {
    private long schoolId = 0;
    private long roundId = 0;
    private long eventId = 0;
    private long forumId = 0;
    private Timestamp codingStart = null;
    private Timestamp sysTestEnd = null;
    private Timestamp regStart = null;
    private Timestamp regEnd = null;

    protected final void businessProcessing() throws Exception {
        String eid = getRequest().getParameter(Constants.COLLEGE_TOUR_EVENT_ID);
        if (eid==null) {
            throw new TCWebException("invalid request no event id specified");
        }
         eventId = Long.parseLong(eid);
         
        /*
        String eid = getRequest().getParameter(Constants.COLLEGE_TOUR_EVENT_ID);
        getRequest().setAttribute(Constants.COLLEGE_TOUR_EVENT_ID, eid);
        if (eid==null) {
            throw new TCWebException("invalid request no event id specified");
        } else {
            eventId = Long.parseLong(eid);
            Request r = new Request();
            r.setContentHandle("college_tour_event_info");
            r.setProperty(Constants.COLLEGE_TOUR_EVENT_ID, eid);
            Map m = getDataAccess(true).getData(r);
            ResultSetContainer rsc = (ResultSetContainer)m.get("college_tour_event_info");
            if (rsc.isEmpty()) {
                throw new TCWebException("Missing config info for college tour event " + eid);
            } else {
                schoolId = rsc.getLongItem(0, "school_id");
                roundId = rsc.getLongItem(0, "round_id");
                if (rsc.getItem(0, "forum_id").getResultData()!=null) {
                    forumId = rsc.getLongItem(0, "forum_id");
                    getRequest().setAttribute(Constants.FORUM_ID, String.valueOf(forumId));
                }
                getRequest().setAttribute(Constants.ROUND_ID, String.valueOf(roundId));
                getRequest().setAttribute(Constants.SCHOOL_ID, String.valueOf(schoolId));
                getRequest().setAttribute(Constants.SCHOOL_NAME, rsc.getStringItem(0, "school_name"));
                getRequest().setAttribute(Constants.ROUND_NAME, rsc.getStringItem(0, "round_name"));
                getRequest().setAttribute(Constants.TIMEZONE, rsc.getStringItem(0, "timezone_desc"));
                codingStart = (Timestamp)rsc.getItem(0, "coding_start").getResultData();
                sysTestEnd = (Timestamp)rsc.getItem(0, "sys_test_end").getResultData();
                regStart = (Timestamp)rsc.getItem(0, "reg_start").getResultData();
                regEnd = (Timestamp)rsc.getItem(0, "reg_end").getResultData();
                getRequest().setAttribute("regEnd", regEnd);

                ResultSetContainer imageInfo = (ResultSetContainer)m.get("college_tour_round_image");
                if (!imageInfo.isEmpty()) {
                    ImageInfo image = new ImageInfo();
                    if (imageInfo.getItem(0, "height").getResultData()!=null) {
                        image.setHeight(imageInfo.getIntItem(0, "height"));
                    }
                    if (imageInfo.getItem(0, "width").getResultData()!=null) {
                        image.setHeight(imageInfo.getIntItem(0, "width"));
                    }
                    image.setLink(imageInfo.getStringItem(0, "link"));
                    image.setSrc(imageInfo.getStringItem(0, "file_path"));
                    getRequest().setAttribute("image", image);
                }
            }
        }*/
        collegeTourProcessing();
    }

    protected void loadConfigInfo() throws Exception {
        Request r = new Request();
        r.setContentHandle("college_tour_event_config");
        r.setProperty(Constants.COLLEGE_TOUR_EVENT_ID, String.valueOf(eventId));
        ResultSetContainer rsc = (ResultSetContainer)getDataAccess(true).getData(r).get("college_tour_event_config");
        if (rsc.isEmpty()) {
            throw new TCWebException("no config found in db for event " + eventId);
        } else {
            ResultSetContainer.ResultSetRow row;
            HashMap map = new HashMap();
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                map.put(new Integer(row.getIntItem("property_id")), row.getStringItem("property_value"));
            }

            long startDelta = Integer.parseInt(((String)map.get(new Integer(Constants.EVENT_START_PROP_ID))));
            long endDelta = Integer.parseInt(((String)map.get(new Integer(Constants.EVENT_END_PROP_ID))));
            long resultsDelta = Integer.parseInt(((String)map.get(new Integer(Constants.RESULTS_PROP_ID))));

            map.put(new Integer(Constants.EVENT_START_PROP_ID), new Timestamp(codingStart.getTime()+(startDelta*1000*60)));
            map.put(new Integer(Constants.EVENT_END_PROP_ID), new Timestamp(codingStart.getTime()+(endDelta*1000*60)));
            map.put(new Integer(Constants.RESULTS_PROP_ID), new Timestamp(sysTestEnd.getTime()+(resultsDelta*1000*60)));
            map.put(new Integer(Constants.ROUND_START_PROP_ID), codingStart);
            map.put(new Integer(Constants.ROUND_END_PROP_ID), sysTestEnd);

            getRequest().setAttribute(Constants.COLLEGE_TOUR_CONFIG_INFO, map);

        }
    }

    public Timestamp getRegStart() {
        return regStart;
    }

    public Timestamp getRegEnd() {
        return regEnd;
    }

    public long getSchoolId() {
        return schoolId;
    }

    public long getRoundId() {
        return roundId;
    }

    public long getEventId() {
        return eventId;
    }

    public long getForumId() {
        return forumId;
    }

    protected abstract void collegeTourProcessing() throws Exception;

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }
}

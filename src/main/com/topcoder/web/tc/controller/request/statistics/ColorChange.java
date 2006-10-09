package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Equals;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 5, 2006
 */
public class ColorChange extends Base {
    protected void businessProcessing() throws Exception {
        String ratingType = StringUtils.checkNull(getRequest().getParameter(Constants.ALGO_RATING_TYPE_ID));
        String phase = StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID));
        String color = StringUtils.checkNull(getRequest().getParameter(Constants.COLOR));
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));

        if ("".equals(phase) && "".equals(ratingType)) {
            throw new NavigationException("Invalid request");
        } else if (!"".equals(phase) && !"".equals(ratingType)) {
            throw new NavigationException("Invalid request");
        } else {
            Request r = new Request();
            DataAccessInt dai;
            if (!"".equals(ratingType)) {
                //it's an algo thing
                r.setContentHandle("algo_color_change");
                r.setProperty(Constants.ALGO_RATING_TYPE_ID, ratingType);
                dai = getDataAccess(true);
                if (ratingType.equals(String.valueOf(Constants.TC_ALGO_RATING_TYPE_ID))) {
                    getRequest().setAttribute("context", HandleTag.ALGORITHM);
                } else {
                    getRequest().setAttribute("context", HandleTag.HS_ALGORITHM);
                }
                setDefault(Constants.ALGO_RATING_TYPE_ID, ratingType);
            } else {
                //it's a component thing
                r.setContentHandle("component_color_change");
                r.setProperty(Constants.PHASE_ID, phase);
                dai = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true);
                if (phase.equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
                    getRequest().setAttribute("context", HandleTag.DESIGN);
                } else {
                    getRequest().setAttribute("context", HandleTag.DEVELOPMENT);
                }
                setDefault(Constants.PHASE_ID, phase);
            }

            //the idea here is that we cache the whole set (it shouldn't be that big) and then filter
            //what we don't want in memory.  this should be a good balance between speed and memory use
            ResultSetContainer changes = (ResultSetContainer) dai.getData(r).get(r.getContentHandle());


            String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

            if (!color.equals("")) {
                changes = new ResultSetContainer(changes, new Equals(color, "new_color"));
            }

            if (!handle.equals("")) {
                setDefault(Constants.HANDLE, handle);
                changes = new ResultSetContainer(changes, new Equals(handle.toLowerCase(), "handle_lower"));
            }

            if (!"".equals(col) && !"".equals(dir)) {
                changes.sortByColumn(Integer.parseInt(col), dir.trim().toLowerCase().equals("asc"));
            }

            String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            if (start.equals(""))
                start = "1";

            String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            if (end.equals(""))
                end = String.valueOf(Constants.COLOR_CHANGE_SCROLL_SIZE);

            //make sure we like the size they they're searching for
            if (Integer.parseInt(end) - Integer.parseInt(start) > (Constants.COLOR_CHANGE_SCROLL_SIZE - 1)) {
                r.setProperty(DataAccessConstants.END_RANK, String.valueOf(Integer.parseInt(start) + Constants.COLOR_CHANGE_SCROLL_SIZE - 1));
            }

            changes = new ResultSetContainer(changes, Integer.parseInt(start), Integer.parseInt(end));

            getRequest().setAttribute("change_list", changes);

            SortInfo s = new SortInfo();
            s.addDefault(changes.getColumnIndex("new_rating"), "desc");
            s.addDefault(changes.getColumnIndex("old_rating"), "desc");
            s.addDefault(changes.getColumnIndex("color_increase"), "desc");
            s.addDefault(changes.getColumnIndex("date"), "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            setNextPage("/statistics/colorChange.jsp");
            setIsNextPageInContext(true);

        }
    }
}

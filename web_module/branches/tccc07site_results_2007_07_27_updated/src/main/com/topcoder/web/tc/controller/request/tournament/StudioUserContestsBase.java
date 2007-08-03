package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class StudioUserContestsBase extends Base {
    
    public static final int CONTEST_NAME_COL = 1;
    public static final int START_DATE_COL = 2;
    public static final int END_DATE_COL = 3;
    public static final int REGISTRANTS_COL = 4;
    public static final int SUBMISSIONS_COL = 5;
    public static final int PLACED_COL = 6;
    public static final int POINTS_COL = 7;

    protected abstract String getContestPrefix();
    
    protected abstract int getPlacementPoints(int contestPlace);

    protected abstract int getMaxContests();

    protected String getCommandName() {
        return "event_user_results";
    }

    protected String getDataSourceName() {
        return DBMS.STUDIO_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/studio/completedContests.jsp";
    }

    protected void developmentProcessing() throws TCWebException {

        Request dataRequest = new Request();
        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY) &&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN) &&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        try {
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), false);
            Map result = dai.getData(dataRequest);

            processResult(result);

            String nextPage = getPageName();
            setNextPage(nextPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void processResult(Map result) throws com.topcoder.web.common.TCWebException {
        ResultSetContainer rsc = (ResultSetContainer) result.get(getCommandName());

        String user = StringUtils.checkNull(getRequest().getParameter(Constants.USER_ID));
        Long userId;
        try {
            userId = Long.parseLong(user);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid user id parameter.");                
        }

        // first thing we need to do is calculate placement points for each contest
        List<StudioUserContestsRow> results = calculatePlacementPoints(rsc, userId);        
                
        // sort
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        sortResult(results, sortCol, "desc".equals(sortDir));
        
        getRequest().setAttribute("handle", results.get(0).getHandle());
        getRequest().setAttribute("result", results);
    }

    private List<StudioUserContestsRow> calculatePlacementPoints(ResultSetContainer rsc, Long userId) {
        long prevContestId = 0;
        int contestPlace = 1;

        ArrayList<StudioUserContestsRow> results = new ArrayList<StudioUserContestsRow>();
        for (ResultSetRow rsr: rsc) {
            if (rsr.getLongItem("contest_id") != prevContestId) {
                contestPlace = 1;
            }
            
            // keep only rows with the requested userId
            if (userId.equals(rsr.getLongItem("user_id"))) {
                StudioUserContestsRow row = new StudioUserContestsRow(
                        rsr.getLongItem("contest_id"),
                        rsr.getStringItem("name"),
                        rsr.getTimestampItem("start_time"),
                        rsr.getTimestampItem("end_time"),
                        rsr.getStringItem("handle"), 
                        rsr.getIntItem("registrants"), 
                        rsr.getIntItem("submissions"), 
                        contestPlace, 
                        getPlacementPoints(contestPlace));
                
                results.add(row);
            }

            prevContestId = rsr.getLongItem("contest_id");
            contestPlace++;
        }

        return results;
    }

    protected void sortResult(List<StudioUserContestsRow> result, String sortCol, boolean invert) {
        if (result.size() == 0) {
            return;
        }

        if (sortCol.equals(String.valueOf(START_DATE_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getStartDate().compareTo(arg1.getStartDate());
                }
            });
            
//            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
//                public int compare(PaymentHeader arg0, PaymentHeader arg1) {
//                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yy");
//                    try {
//                        return (sdf.parse(arg0.getCreateDate())).compareTo(sdf.parse(arg1.getCreateDate()));
//                    } catch (ParseException e) {
//                        return 0;
//                    }
//                }
//            });

            
        } else  if (sortCol.equals(String.valueOf(END_DATE_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getEndDate().compareTo(arg1.getEndDate());
                }
            });
        } else  if (sortCol.equals(String.valueOf(REGISTRANTS_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getRegistrants().compareTo(arg1.getRegistrants());
                }
            });
        } else  if (sortCol.equals(String.valueOf(SUBMISSIONS_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getSubmissions().compareTo(arg1.getSubmissions());
                }
            });
        } else  if (sortCol.equals(String.valueOf(PLACED_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getPlaced().compareTo(arg1.getPlaced());
                }
            });
        } else  if (sortCol.equals(String.valueOf(POINTS_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getPoints().compareTo(arg1.getPoints());
                }
            });
        } else {
            // Default, sort by contest name.

            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getContestName().compareTo(arg1.getContestName());
                }
            });
        }

        if (invert) {
            Collections.reverse(result);
        }

        SortInfo s = new SortInfo();
        s.addDefault(CONTEST_NAME_COL, "asc"); 
        s.addDefault(START_DATE_COL, "desc"); 
        s.addDefault(END_DATE_COL, "desc"); 
        s.addDefault(REGISTRANTS_COL, "desc"); 
        s.addDefault(SUBMISSIONS_COL, "desc"); 
        s.addDefault(PLACED_COL, "asc"); 
        s.addDefault(POINTS_COL, "desc"); 
        
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}

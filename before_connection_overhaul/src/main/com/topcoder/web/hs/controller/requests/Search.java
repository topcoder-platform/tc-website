package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.web.common.TCWebException;
import com.topcoder.common.web.error.NavigationException;

import java.util.*;
import javax.naming.*;
import javax.servlet.*;
import javax.sql.*;

public class Search extends Base {

    private final static String STATE_INPUT_CODE = "st";
    private final static String HANDLE_INPUT_CODE = "hap";
    private final static String SCHOOL_NAME_INPUT_CODE = "snp";
    private final static String MIN_RATING_INPUT_CODE = "minra";
    private final static String MAX_RATING_INPUT_CODE = "maxra";
    private final static String START_RANK_INPUT_CODE = "sr";
    private final static String END_RANK_INPUT_CODE = "er";
    private final static String SEARCH_BASE = "/search/";
    private final static String ADVANCED_SEARCH_PAGE = "advanced_search.jsp";
    private final static String SEARCH_CMD = "adv";
    private final static String INVALID_STATE_CODE = "Please select a state";
    private final static String INVALID_HANDLE = "Invalid handle search criteria";
    private final static String INVALID_SCHOOL_ID = "Please select a school";
    private final static String INVALID_STATE_SCHOOL = "Invalid school/state combination";
    private final static String NEGATIVE_MIN_RATING = "Ensure Min Rating non-negative";
    private final static String INVALID_MIN_RATING = "Invalid number for Min Rating";
    private final static String NEGATIVE_MAX_RATING = "Ensure Max Rating non-negative";
    private final static String INVALID_MAX_RATING = "Invalid number for Max Rating";
    private final static String INVALID_MIN_MAX = "Max Rating less than Min Rating";
    private final static Logger log = Logger.getLogger(Search.class);


    protected void businessProcessing() throws TCWebException {
        String cmd = getRequest().getParameter("cmd");
        log.info("Search: cmd=" + cmd);

        try {
            if (cmd == null || cmd.equals("")) {
                log.debug("Search processing '' command.");

                SearchBean sb = new SearchBean();
                populateSearchWithDefaults(sb);
                populateSearchFromRequest(getRequest(), sb);
                populateSearchStaticContent(sb);
                getRequest().setAttribute("search", sb);
                setNextPage(SEARCH_BASE + ADVANCED_SEARCH_PAGE);
                setIsNextPageInContext(true);
            } else if (cmd.equals(SEARCH_CMD)) {
                log.debug("Search processing 'adv' command.");

                SearchBean sb = new SearchBean();
                populateSearchWithDefaults(sb);
                populateSearchFromRequest(getRequest(), sb);
                populateSearchStaticContent(sb);
                getRequest().setAttribute("search", sb);

                HashMap errors = new HashMap();
                getRequest().setAttribute("form_errors", errors);

                if (isValidSearch(errors, sb)) {
                    int count = findMembers(sb);
                    log.debug("Search found '" + count + "' matching members");
                } else {
                    log.debug("invalid");
                }

                setNextPage(SEARCH_BASE + ADVANCED_SEARCH_PAGE);
                setIsNextPageInContext(true);

            } else {

                throw new NavigationException("invalid command to search processor", getRequest().getQueryString());

            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

    }


    private void populateSearchWithDefaults(SearchBean sb) {
        sb.setStart(new Integer(1));
        sb.setEnd(new Integer(SearchBean.getMaxResultsPerPage()));
        sb.setHandle("");
        sb.setMinRating("");
        sb.setMaxRating("");
        sb.setStateCode("");
        sb.setSchoolId(new Long(-1));
    }


    private void populateSearchFromRequest(ServletRequest request, SearchBean sb) {
        String next = getParameter(request, "next", "");

        if (!next.equals("")) {
            int start = getParameterInteger(request, "start", sb.getStart()).intValue();
            int end = getParameterInteger(request, "end", sb.getEnd()).intValue();
            if (next.equals("true")) {
                sb.setStart(new Integer(start + sb.getMaxResultsPerPage()));
                sb.setEnd(new Integer(end + sb.getMaxResultsPerPage()));
            } else if (next.equals("false")) {
                sb.setStart(new Integer(start - sb.getMaxResultsPerPage()));
                sb.setEnd(new Integer(end - sb.getMaxResultsPerPage()));
            }
        }

        sb.setHandle(getParameter(request, "handle", sb.getHandle()));
        sb.setMinRating(getParameter(request, "min_rating", sb.getMinRating()));
        sb.setMaxRating(getParameter(request, "max_rating", sb.getMaxRating()));
        sb.setStateCode(getParameter(request, "state_code", sb.getStateCode()));
        sb.setSchoolId(getParameterLong(request, "school_id", sb.getSchoolId()));

    }


    private void populateSearchStaticContent(SearchBean sb) throws Exception {
        Context ctx = TCContext.getInitial();
        DataSource ds = (DataSource) ctx.lookup(DBMS.HS_OLTP_DATASOURCE_NAME);
        DataAccessInt dai = new CachedDataAccess(ds);

        Request req = new Request();
        req.setContentHandle("state_list");
        Map data = dai.getData(req);

        ResultSetContainer states;
        states = (ResultSetContainer) data.get("state_list");
        sb.setStateList(states);

        req = new Request();
        req.setContentHandle("state_schools");
        req.setProperty(STATE_INPUT_CODE, sb.getStateCode());
        Map schools = dai.getData(req);
        sb.setSchoolList((ResultSetContainer) schools.get("state_schools"));
    }


    private String getParameter(ServletRequest request, String param, String def) {
        String value = request.getParameter(param);
        return (value == null || value.trim().length() == 0 ? def : value.trim());
    }

    private Long getParameterLong(ServletRequest request, String param, Long _default) {
        Long value = _default;
        try {
            value = new Long(request.getParameter(param));
        } catch (NumberFormatException nfe) {
            /* do nothing */
        }
        return (value);
    }

    private Integer getParameterInteger(ServletRequest request, String param, Integer def) {
        Integer value = def;
        try {
            value = new Integer(request.getParameter(param));
        } catch (NumberFormatException nfe) {
            /* do nothing */
        }
        return (value);
    }


    private boolean isValidListValue(Object value, ResultSetContainer list, String col) {
        if (value == null) {
            return (false);
        }
        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) iterator.next();
            if (value.equals(rsr.getItem(col).getResultData())) {
                return (true);
            }
        }
        return (false);
    }


    private Object getListTextFromValue(Object value, ResultSetContainer list, String valCol, String textCol) {
        if (value == null) {
            return (null);
        }

        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) iterator.next();
            if (value.equals(rsr.getItem(valCol).getResultData())) {
                return (rsr.getItem(textCol).getResultData());
            }
        }
        return (null);
    }


    private boolean isValidSearch(Map errors, SearchBean sb) {
        boolean valid = true;
        valid &= checkValidHandle(errors, sb.getHandle());
        valid &= (checkValidState(errors, sb.getStateCode(), sb.getStateList()) &&
                checkValidSchool(errors, sb.getSchoolId(), sb.getSchoolList()));
        valid &= checkValidStateSchool(errors, sb.getStateCode(), sb.getSchoolId());
        valid &= checkValidMinRating(errors, sb.getMinRating());
        valid &= checkValidMaxRating(errors, sb.getMaxRating());
        valid &= checkValidMinMax(errors, sb.getMinRating(), sb.getMaxRating());
        return (valid);
    }


    private void addErrorMessage(Map errors, String key, String message) {
        List msgs = (List) errors.get(key);
        if (msgs == null) {
            msgs = new ArrayList();
            errors.put(key, msgs);
        }
        log.debug("error added " + message);
        msgs.add(message);
    }


    private boolean checkValidHandle(Map errors, String handle) {
        if (handle == null) {
            addErrorMessage(errors, "Handle", INVALID_HANDLE);
            return (false);
        }
        return (true);
    }


    /**
     * Check for valid state code
     */
    private boolean checkValidState(Map errors, String stateCode, ResultSetContainer list) {
        if (!stateCode.equals("") && !isValidListValue(stateCode, list, "state_code")) {
            addErrorMessage(errors, "StateCode", INVALID_STATE_CODE);
            return (false);
        }
        return (true);
    }


    /**
     * Check for valid school
     */
    private boolean checkValidSchool(Map errors, Long schoolId, ResultSetContainer list) {
        if (!schoolId.equals(new Long(-1)) && !isValidListValue(schoolId, list, "school_id")) {
            addErrorMessage(errors, "SchoolId", INVALID_SCHOOL_ID);
            return (false);
        }
        return (true);
    }


    /**
     * Check for valid state/school combination
     */
    private boolean checkValidStateSchool(Map errors, String stateCode, Long schoolId) {
        if (stateCode.equals("") && schoolId.longValue() != -1) {
            addErrorMessage(errors, "StateCode", INVALID_STATE_SCHOOL);
            return (false);
        }
        return (true);
    }


    private boolean checkValidMinRating(Map errors, String minRating) {
        if ("".equals(minRating)) {
            return (true);
        }

        try {
            Integer min_rating = new Integer(minRating);
            if (min_rating.intValue() < 0) {
                addErrorMessage(errors, "MinRating", NEGATIVE_MIN_RATING);
                return (false);
            }
        } catch (NumberFormatException _nfe) {
            addErrorMessage(errors, "MinRating", INVALID_MIN_RATING);
            return (false);
        }
        return (true);
    }


    private boolean checkValidMaxRating(Map errors, String maxRating) {
        if ("".equals(maxRating)) {
            return (true);
        }

        try {
            Integer max_rating = new Integer(maxRating);
            if (max_rating.intValue() < 0) {
                addErrorMessage(errors, "MaxRating", NEGATIVE_MAX_RATING);
                return (false);
            }
        } catch (NumberFormatException nfe) {
            addErrorMessage(errors, "MaxRating", INVALID_MAX_RATING);
            return (false);
        }
        return (true);
    }


    private boolean checkValidMinMax(Map errors, String minRating, String maxRating) {
        try {
            Integer min = new Integer(minRating);
            Integer max = new Integer(maxRating);

            if (max.intValue() < min.intValue()) {
                addErrorMessage(errors, "MinMax", INVALID_MIN_MAX);
                return (false);
            }
        } catch (NumberFormatException nfe) {
            /* do nothing */
        }
        return (true);
    }


    private int findMembers(SearchBean sb) throws Exception {
        Context ctx = TCContext.getInitial();
        DataSource ds = (DataSource) ctx.lookup(DBMS.HS_DW_DATASOURCE_NAME);
        DataAccessInt dai = new DataAccess(ds);
        Map map = new HashMap();

        String handlePattern = "%";
        Integer minRating = new Integer(0);
        Integer maxRating = new Integer(1000000);
        String stateCodePattern = "%";
        String schoolNamePattern = "%";

        try {
            if (!"".equals(sb.getHandle())) {
                handlePattern = sb.getHandle();
            }

            if (!"".equals(sb.getMinRating())) {
                minRating = new Integer(sb.getMinRating());
            }

            if (!"".equals(sb.getMaxRating())) {
                maxRating = new Integer(sb.getMaxRating());
            }

            if (!"".equals(sb.getStateCode())) {
                stateCodePattern = sb.getStateCode();
            }

            if (-1 != sb.getSchoolId().longValue()) {
                schoolNamePattern = getListTextFromValue(sb.getSchoolId(),
                        sb.getSchoolList(), "school_id", "full_name").toString();
            }
        } catch (NumberFormatException nfe) {
            /* this should never happen */
            nfe.printStackTrace();
        }

        map.put(DataAccessConstants.COMMAND, "member_search");
        map.put(HANDLE_INPUT_CODE, handlePattern);
        map.put(MIN_RATING_INPUT_CODE, minRating.toString());
        map.put(MAX_RATING_INPUT_CODE, maxRating.toString());
        map.put(STATE_INPUT_CODE, stateCodePattern);
        map.put(SCHOOL_NAME_INPUT_CODE, schoolNamePattern);
        map.put(START_RANK_INPUT_CODE, sb.getStart().toString());
        map.put(END_RANK_INPUT_CODE, sb.getEnd().toString());
        Request req = new Request(map);
        Map data = dai.getData(req);

        ResultSetContainer rsc;

        int count = 0;
        rsc = (ResultSetContainer) data.get("member_search");

        sb.setHasPrev(rsc.croppedDataBefore());
        sb.setHasNext(rsc.croppedDataAfter());


        if (count < sb.getEnd().intValue() - sb.getStart().intValue() + 1) {
            sb.setEnd(new Integer(sb.getStart().intValue() + rsc.size() - 1));
        }

        sb.setMemberList(rsc);
        return (count);
    }
}


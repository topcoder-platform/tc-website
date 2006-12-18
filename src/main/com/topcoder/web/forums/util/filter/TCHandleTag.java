package com.topcoder.web.forums.util.filter;

import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterChain;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.tag.HandleTag;

/**
 * A filter that creates a handle tag for the username appearing between [handle][/handle] tags.
 */
public class TCHandleTag implements Filter {
    
    private final static String TAG_NAME = "handle";
    private final static String BEGIN_TAG = "[" + TAG_NAME + "]";
    private final static String END_TAG = "[/" + TAG_NAME + "]";  
    private final static int BEGIN_TAG_LEN = BEGIN_TAG.length();
    private final static int END_TAG_LEN = END_TAG.length();

    /**
     * Construct a new TCHandleTag filter.
     */
    public TCHandleTag() {
    }


    public String getName() {
        return "TCHandleTag";
    }

    public String applyFilter(String string, int currentIndex, FilterChain chain) {
        if (string == null || string.length() < 1) {
            return string;
        }

        int length = string.length();
        StringBuffer filtered = new StringBuffer(length);
        int startCodeTag = 0;
        int endCodeTag = 0;

        // short circuit this filter if no [handle] found
        if (string.indexOf(BEGIN_TAG) < 0) {
            return chain.applyFilters(currentIndex, string);
        }

        // we have something to filter
        while ((startCodeTag = string.indexOf(BEGIN_TAG, endCodeTag)) >= 0) {
            int end = string.indexOf(END_TAG, startCodeTag + BEGIN_TAG_LEN);

            if (end > 0) {
                if (endCodeTag < startCodeTag) {
                    // apply filters for content between [/handle] and [handle]
                    filtered.append(chain.applyFilters(currentIndex,
                            string.substring(endCodeTag, startCodeTag)));
                }

                endCodeTag = end + END_TAG_LEN;
            }
            else {
                filtered.append(string.substring(endCodeTag, startCodeTag) + BEGIN_TAG);
                endCodeTag = startCodeTag + BEGIN_TAG_LEN;
                continue;
            }

            // since end > 0 we must be in a code section
            String code = string.substring(startCodeTag + BEGIN_TAG_LEN, endCodeTag - END_TAG_LEN);
            code = code.replaceAll("<", "&lt;");
            code = code.replaceAll(">", "&gt;");
            
            if (code.length() <= 0) {
                continue;
            }

            try {
                filtered.append(HandleTag.getLink(getCoderId(code), null, null,
                        null, null, lightStyles, darkStyles, false));
            } catch (Exception e) {
                throw new RuntimeException("Failure loading handle tag.", e);
            }

        }

        if (endCodeTag < length) {
            filtered.append(chain.applyFilters(currentIndex, string.substring(endCodeTag, length)));
        }

        return filtered.toString();
    }
    
    private static final String[] lightStyles =
        {"coderTextOrange", "coderTextWhite", "coderTextGray",
         "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    private static final String[] darkStyles =
        {"coderTextOrange", "coderTextBlack", "coderTextGray",
         "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};
    

    private long getCoderId(String handle) throws Exception {
        CachedDataAccess da = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

        Request r = new Request();
        r.setContentHandle("user_id_using_handle");
        r.setProperty("ha", handle);
        ResultSetContainer rsc = (ResultSetContainer) da.getData(r).get("user_id");
        if (rsc.isEmpty())
            return -1;
        else
            return rsc.getLongItem(0, "user_id");
    }
}
package com.topcoder.web.forums.util.filter;

import java.util.Map;

import com.jivesoftware.base.*;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;

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

            StringBuffer output = new StringBuffer();
            try {
                //lookup ratings from cache
                CachedDataAccess da = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                da.setExpireTime(24 * 60 * 60 * 1000);

                long coderId = this.getCoderId(code, da);
                if (coderId == -1) break;
                
                Request r = new Request();
                r.setContentHandle("coder_all_ratings");
                //r.setProperty("cr", String.valueOf(coderId));
                r.setProperty("cr", String.valueOf(coderId));

                Map m = da.getData(r);

                ResultSetContainer rsc = (ResultSetContainer) m.get("coder_all_ratings");
                output.append("<a href=\"");
                output.append(DEFAULT_LINK + coderId);
                output.append("\" class=\"");
                
                // special case for admins
                int rating = 0;
                if (rsc.getIntItem(0, "algorithm_rating") < 0)
                    rating = rsc.getIntItem(0, "algorithm_rating");
                else rating = max(rsc.getIntItem(0, "algorithm_rating"),
                        rsc.getIntItem(0, "design_rating"),
                        rsc.getIntItem(0, "development_rating"));
                output.append(getRatingCSS(rating));
                
                output.append("\">");
                output.append(rsc.getStringItem(0, "handle"));
                output.append("</a>");
                
            } catch (Exception e) {
                // invalid handle - return no output
            }
            
            if (!output.toString().equals("")) {
                filtered.append(output.toString());
            }
        }

        if (endCodeTag < length) {
            filtered.append(chain.applyFilters(currentIndex, string.substring(endCodeTag, length)));
        }

        return filtered.toString();
    }
    
    public final static String DEFAULT_LINK = "http://" + ApplicationServer.SERVER_NAME + "/tc?module=MemberProfile&cr=";
    private boolean darkBG = false;
    
    private String getRatingCSS(int rating) {
        if (rating < 0)
            return darkBG ? lightStyles[0] : darkStyles[0];
        else if (rating == 0)
            return darkBG ? lightStyles[1] : darkStyles[1];
        else if (rating > 0 && rating < 900)
            return darkBG ? lightStyles[2] : darkStyles[2];
        else if (rating > 899 && rating < 1200)
            return darkBG ? lightStyles[3] : darkStyles[3];
        else if (rating > 1199 && rating < 1500)
            return darkBG ? lightStyles[4] : darkStyles[4];
        else if (rating > 1499 && rating < 2200)
            return darkBG ? lightStyles[5] : darkStyles[5];
        else if (rating > 2199) return darkBG ? lightStyles[6] : darkStyles[6];
        return "";
    }
    
    private static final String[] lightStyles =
        {"coderTextOrange", "coderTextWhite", "coderTextGray",
         "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    private static final String[] darkStyles =
        {"coderTextOrange", "coderTextBlack", "coderTextGray",
         "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};
    
    private int max(int a, int b, int c) {
        return max(max(a, b), c);
    }

    private int max(int a, int b) {
        if (a >= b) return a;
        return b;
    }
    
    private long getCoderId(String handle, CachedDataAccess da) throws Exception {
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
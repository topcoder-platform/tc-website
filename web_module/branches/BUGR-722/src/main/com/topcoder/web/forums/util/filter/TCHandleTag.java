package com.topcoder.web.forums.util.filter;

import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterChain;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.tag.HandleTag;

/**
 * A filter that creates a handle tags for the username appearing between [handle][/handle] tags.
 */
public class TCHandleTag implements Filter {

    private final static String[] TAG_NAMES = {"handle", "h"};
    private final static String[] BEGIN_TAGS = {"[" + TAG_NAMES[0] + "]", "[" + TAG_NAMES[1] + "]"};
    private final static String[] END_TAGS = {"[/" + TAG_NAMES[0] + "]", "[/" + TAG_NAMES[1] + "]"};
    private final static int[] BEGIN_TAGS_LEN = {BEGIN_TAGS[0].length(), BEGIN_TAGS[1].length()};
    private final static int[] END_TAGS_LEN = {END_TAGS[0].length(), END_TAGS[1].length()};

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
        boolean tagNotFound = true;
        for (int i = 0; i < BEGIN_TAGS.length; i++) {
            tagNotFound &= (string.indexOf(BEGIN_TAGS[i]) < 0);
        }
        if (tagNotFound) {
            return chain.applyFilters(currentIndex, string);
        }

        // we have something to filter
        while (true) {
            int tagUsed = -1;
            for (int i = 0; i < BEGIN_TAGS.length; i++) {
                int beginTagIdx = string.indexOf(BEGIN_TAGS[i], endCodeTag);
                if (beginTagIdx >= 0 && (tagUsed == -1 || beginTagIdx < startCodeTag)) {
                    tagUsed = i;
                    startCodeTag = beginTagIdx;
                }
            }
            if (tagUsed == -1) break;

            int end = string.indexOf(END_TAGS[tagUsed], startCodeTag + BEGIN_TAGS_LEN[tagUsed]);

            if (end > 0) {
                if (endCodeTag < startCodeTag) {
                    // apply filters for content between [/handle] and [handle]
                    filtered.append(chain.applyFilters(currentIndex,
                            string.substring(endCodeTag, startCodeTag)));
                }

                endCodeTag = end + END_TAGS_LEN[tagUsed];
            } else {
                filtered.append(string.substring(endCodeTag, startCodeTag) + BEGIN_TAGS[tagUsed]);
                endCodeTag = startCodeTag + BEGIN_TAGS_LEN[tagUsed];
                continue;
            }

            // since end > 0 we must be in a code section
            String code = string.substring(startCodeTag + BEGIN_TAGS_LEN[tagUsed], endCodeTag - END_TAGS_LEN[tagUsed]);
            code = code.replaceAll("<", "&lt;");
            code = code.replaceAll(">", "&gt;");

            if (code.length() <= 0) {
                continue;
            }

            try {
                long coderId = getCoderId(code);
                String link = code;
                if (coderId != -1) {
                    link = HandleTag.getLink(coderId, null, null,
                            null, null, lightStyles, darkStyles, false);
                }
                filtered.append(link);
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
        handle = handle.replaceAll("\r|\n", "");
        
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
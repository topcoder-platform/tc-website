package com.topcoder.web.tc.controller.legacy;

import java.util.StringTokenizer;

/**
 * This class changes addresses in an html document.
 *
 * @author mitalub
 */
public class HTMLLinkChanger {

    private final static String[] ADDRESS_TAGS = {"src", "href", "SRC", "HREF"};
    private final static String[] ABSOLUTE_ADDRESS_STARTERS = {"http", "ftp", "file", "HTTP", "FTP", "FILE"};

    /**
     * Prepends prepath to all addresses in the html in contents.  Very simple and
     * easily tricked algorithm.
     */
    public static String prependToAllAddresses(String prepath, String contents) {
        StringBuffer output = new StringBuffer(contents.length() + 1000);
        for (int i = 0; i < contents.length(); i++) {
            if (contents.charAt(i) == '<') {
                //opening a tag, let's do the prepending in this tag
                int endIndex = contents.indexOf(">", i);
                if (endIndex != -1) {
                    String tag = contents.substring(i, endIndex + 1);
                    output.append(prependToPathsInTag(tag, prepath));
                    i = endIndex;
                    //move on to next iteration
                    continue;
                }
            }
            output.append(contents.charAt(i));
        }

        return output.toString();
    }

    private static String prependToPathsInTag(String tag, String prepath) {
        StringBuffer output = new StringBuffer(1000);
        StringTokenizer st = new StringTokenizer(tag, "=", true);
        while (st.hasMoreTokens()) {
            String token = st.nextToken();
            output.append(token);

            //decide if we have an address token - this token ends with something like "href"
            boolean prepend = false;
            for (int i = 0; i < ADDRESS_TAGS.length; i++) {
                if (token.trim().endsWith(ADDRESS_TAGS[i])) {
                    prepend = true;
                    break;
                }
            }

            //do the prepend
            if (prepend && st.hasMoreTokens()) {
                token = st.nextToken(); //"=" sign
                output.append(token);

                if (st.hasMoreTokens()) {
                    token = st.nextToken();

                    //decide the index at which prepath should be inserted.
                    //the index is the first character after the first ' or ".
                    //If there is no ' or ", the index is the first non-whitespace character.
                    int insertIndex = 0;
                    for (int i = 0; i < token.length(); i++) {
                        if (token.charAt(i) == '\'' || token.charAt(i) == '"') {
                            insertIndex = i + 1;
                            break;
                        } else if (!Character.isWhitespace(token.charAt(i))) {
                            insertIndex = i;
                            break;
                        }
                    }

                    String before = token.substring(0, insertIndex);
                    String after = token.substring(insertIndex);

                    //Decide if the path is an absolute path, like http://...
                    //The path is absolute if the value of the path starts
                    //with one of those in ABSOLUTE_ADDRESS_STARTERS
                    boolean isAbsolute = false;
                    for (int i = 0; i < ABSOLUTE_ADDRESS_STARTERS.length; i++) {
                        if (((after.trim().charAt(0) == '\'' || after.trim().charAt(0) == '"') &&
                                after.trim().substring(1).startsWith(ABSOLUTE_ADDRESS_STARTERS[i])) ||
                                after.trim().startsWith(ABSOLUTE_ADDRESS_STARTERS[i])) {
                            isAbsolute = true;
                            break;
                        }
                    }

                    output.append(before);
                    if (!isAbsolute) {
                        output.append(prepath);
                    }
                    output.append(after);
                }
            }
        }
        return output.toString();
    }

    public static void main(String[] args) {
        String html = "<HTML><aksjd><aksjd>asdj a href=\"hello\"asjasdj<a href= hello>";
        String prepend = "PREPENDED";
        System.out.println(html);
        System.out.println(prependToAllAddresses(prepend, html));
    }
}

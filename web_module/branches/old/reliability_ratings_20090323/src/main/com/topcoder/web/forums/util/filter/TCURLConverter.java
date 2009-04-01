package com.topcoder.web.forums.util.filter;


import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterChain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

/**
 * A Filter that converts URL's to working HTML web links.<p>
 * <p/>
 * The default set of patterns recognized are <code>ftp://path-of-url</code>,
 * <code>http://path-of-url</code>, <code>https://path-of-url</code> but can be expanded upon.<p>
 * <p/>
 * In addition, the following patterns are also recognized.
 * <p/>
 * <code>[url path-of-url]descriptive text[/url]</code> and
 * <code>[url=path-of-url]descriptive text[/url]</code>.<p>
 * <p/>
 * The <code>[url]</code> allows any path to be defined as link.
 */
public class TCURLConverter implements Filter {

    private boolean newWindowEnabled = true;
    private boolean shortenLinks = false;
    private int longLinkLen = 0;
    private int charsBeforeEllipsis = 0;
    private int charsAfterEllipsis = 0;
    private ArrayList schemes = new ArrayList();

    public static int DEFAULT_LONG_LINK_LEN = 80;
    public static int DEFAULT_CHARS_BEFORE_ELLIPSIS = 25;
    public static int DEFAULT_CHARS_AFTER_ELLIPSIS = 15;

    // define a preset default set of schemes
    public TCURLConverter() {
        schemes.add("http://");
        schemes.add("https://");
        schemes.add("ftp://");

        longLinkLen = DEFAULT_LONG_LINK_LEN;
        charsBeforeEllipsis = DEFAULT_CHARS_BEFORE_ELLIPSIS;
        charsAfterEllipsis = DEFAULT_CHARS_AFTER_ELLIPSIS;
    }

    public String getName() {
        return "TCURLConverter";
    }

    public String applyFilter(String string, int currentIndex, FilterChain chain) {
        if (string == null || string.length() == 0) {
            return string;
        }

        int length = string.length();
        StringBuffer filtered = new StringBuffer((int) (length * 1.5));
        ArrayList urlBlocks = new ArrayList(5);

        // search for url's such as [url=..]text[/url] or [url ..]text[/url]
        int start = string.indexOf("[url");
        while (start != -1 && (start + 5 < length)) {
            // check to verify we're not in another block
            if (withinAnotherBlock(urlBlocks, start)) {
                start = string.indexOf("[url", start + 5);
                continue;
            }

            int end = string.indexOf("[/url]", start + 5);

            if (end == -1 || end >= length) {
                // went past end of string, skip
                break;
            }

            String u = string.substring(start, end + 6);
            int startTagClose = u.indexOf(']');
            String url;
            String description;
            if (start + startTagClose > end) {
                // broken url tags, ignore
                start = string.indexOf("[url", end + 6);
                continue;
            } else if (startTagClose > 5) {
                url = u.substring(5, startTagClose);
                description = u.substring(startTagClose + 1, u.length() - 6);

                // Check the user entered URL for a "javascript:" or "file:" link. Only
                // append the user entered link if it doesn't contain 'javascript:' and 'file:'
                if (isNotEvil(url)) {
                    URLBlock block = new URLBlock(start, end + 5, url, description);
                    urlBlocks.add(block);
                }
            } else {
                url = description = u.substring(startTagClose + 1, u.length() - 6);
                // Check the user entered URL for a "javascript:" or "file:" link. Only
                // append the user entered link if it doesn't contain 'javascript:' and 'file:'
                if (isNotEvil(url)) {
                    URLBlock block = new URLBlock(start, end + 5, url);
                    urlBlocks.add(block);
                }
            }

            start = string.indexOf("[url", end + 6);
        }

        // now handle all the other urls
        Iterator iter = schemes.iterator();

        while (iter.hasNext()) {
            String scheme = (String) iter.next();
            start = string.indexOf(scheme, 0);

            while (start != -1) {
                int end = start;

                // check context, don't handle patterns preceded by any of '"<=
                if (start > 0) {
                    char c = string.charAt(start - 1);

                    if (c == '\'' || c == '"' || c == '<' || c == '=') {
                        start = string.indexOf(scheme, start + scheme.length());
                        continue;
                    }
                }

                // check to verify we're not in another block
                if (withinAnotherBlock(urlBlocks, start)) {
                    start = string.indexOf(scheme, start + scheme.length());
                    continue;
                }

                // find the end of the url
                int cur = start + scheme.length();
                while (end == start && cur < length) {
                    char c = string.charAt(cur);

                    switch (c) {
                        case' ':
                            end = cur - 1;
                            break;
                        case'\t':
                            end = cur - 1;
                            break;
                        case'\'':
                            end = cur - 1;
                            break;
                        case'\"':
                            end = cur - 1;
                            break;
                        case'<':
                            end = cur - 1;
                            break;
                        case'[':
                            end = cur - 1;
                            break;
                        case'\n':
                            end = cur - 1;
                            break;
                        case'\r':
                            end = cur - 1;
                            break;
                        case'(':
                            end = cur - 1;
                            break;
                        case')':
                            end = cur - 1;
                            break;
                        case'{':
                            end = cur - 1;
                            break;
                        case'}':
                            end = cur - 1;
                            break;
                        case'&':
                            if (cur + 3 <= length && string.charAt(cur + 1) == 'l'
                                    && string.charAt(cur + 2) == 't' && string.charAt(cur + 3) == ';') {
                                end = cur - 1;
                                break;
                            } else if (cur + 3 <= length && string.charAt(cur + 1) == 'g'
                                    && string.charAt(cur + 2) == 't' && string.charAt(cur + 3) == ';') {
                                end = cur - 1;
                                break;
                            }
                        default:
                            // acceptable character
                    }

                    cur++;
                }

                // if this is true it means the url goes to the end of the string
                if (end == start) {
                    end = length - 1;
                }

                // We now need to test to see if the URL we've extracted ends with a '.'.
                // While this is technically legal, in the scheme of how this filter will
                // be used it is much more likely that the url is at the end of a sentence
                // and the author, being a proper english writer, ended their sentence with
                // a period. If that is the case, we'll just remove the period as being part
                // of the URL
                if (string.charAt(end) == '.') {
                    end--;
                }

                // now check to see that we don't have any other schemes embedded
                // in the url we've extracted. For example:
                // https://www.mytextron.com:443/http://txtcor05.textron.com:8080/NetletConfig?func=loadResources
                // if that is the case, cut the url down to the part prior to the next scheme
                // starting
                for (int i = 0; i < schemes.size(); i++) {
                    String url = string.substring(start, end + 1);
                    String s = (String) schemes.get(i);
                    if (url.indexOf(s) > 0) {
                        end = start + (url.indexOf(s) - 1);
                    }
                }

                if (start != end) {
                    URLBlock block = new URLBlock(start, end, string.substring(start, end + 1));
                    urlBlocks.add(block);
                }

                start = string.indexOf(scheme, end);
            }
        }

        // sort the blocks so that they are in start index order
        sortBlocks(urlBlocks);

        // now, markup the urls and pass along the filter chain the rest
        Iterator blocks = urlBlocks.iterator();
        int last = 0;

        while (blocks.hasNext()) {
            URLBlock block = (URLBlock) blocks.next();

            if (block.getStart() > 0) {
                filtered.append(chain.applyFilters(currentIndex,
                        string.substring(last, block.getStart())));
            }

            last = block.getEnd() + 1;

            filtered.append("<a href=\"").append(block.getUrl()).append('\"');
            if (newWindowEnabled) {
                filtered.append(" target=\"_blank\"");
            }
            filtered.append('>');
            if (block.getDescription().length() > 0) {
                filtered.append(chain.applyFilters(currentIndex, block.getDescription()));
            } else {
                String url = block.getUrl();
                if (isShortenLinks() && url.length() > longLinkLen) {
                    url = url.substring(0, charsBeforeEllipsis) + "....." +
                            url.substring(url.length() - charsAfterEllipsis);
                }
                filtered.append(url);
            }
            filtered.append("</a>");
        }

        if (last < string.length()) {
            filtered.append(chain.applyFilters(currentIndex, string.substring(last)));
        }

        return filtered.toString();
    }

    /**
     * Returns true if URL clicks will open in a new window.
     *
     * @return true if new window mode is enabled.
     */
    public boolean isNewWindowEnabled() {
        return newWindowEnabled;
    }

    /**
     * Enables or disables the new window mode. When active, URL clicks will
     * open in a new window.
     *
     * @param enabled true if new window mode should be enabled.
     */
    public void setNewWindowEnabled(boolean enabled) {
        this.newWindowEnabled = enabled;
    }

    public boolean isShortenLinks() {
        return shortenLinks;
    }

    public void setShortenLinks(boolean shortenLinks) {
        this.shortenLinks = shortenLinks;
    }

    public String getLongLinkLen() {
        return String.valueOf(longLinkLen);
    }

    public void setLongLinkLen(String longLinkLen) {
        try {
            this.longLinkLen = Integer.parseInt(longLinkLen);
        } catch (NumberFormatException nfe) {
            this.longLinkLen = DEFAULT_LONG_LINK_LEN;
        }
    }

    public String getCharsBeforeEllipsis() {
        return String.valueOf(charsBeforeEllipsis);
    }

    public void setCharsBeforeEllipsis(String charsBeforeEllipsis) {
        try {
            this.charsBeforeEllipsis = Integer.parseInt(charsBeforeEllipsis);
        } catch (NumberFormatException nfe) {
            this.charsBeforeEllipsis = DEFAULT_CHARS_BEFORE_ELLIPSIS;
        }
    }

    public String getCharsAfterEllipsis() {
        return String.valueOf(charsAfterEllipsis);
    }

    public void setCharsAfterEllipsis(String charsAfterEllipsis) {
        try {
            this.charsAfterEllipsis = Integer.parseInt(charsAfterEllipsis);
        } catch (NumberFormatException nfe) {
            this.charsAfterEllipsis = DEFAULT_CHARS_AFTER_ELLIPSIS;
        }
    }

    /**
     * Returns the current supported uri schemes as a comma separated string.
     *
     * @return the current supported uri schemes as a comma separated string.
     */
    public String getSchemes() {
        StringBuffer buf = new StringBuffer(50);

        for (int i = 0; i < schemes.size(); i++) {
            buf.append((String) schemes.get(i)).append(",");
        }
        buf.deleteCharAt(buf.length() - 1);

        return buf.toString();
    }

    /**
     * Sets the current supported uri schemes as a comma separated string.
     *
     * @param schemes a comma separated string of uri schemes.
     */
    public void setSchemes(String schemes) {
        if (schemes == null) {
            return;
        }

        // enpty the current list
        this.schemes.clear();

        StringTokenizer st = new StringTokenizer(schemes, ",");

        while (st.hasMoreElements()) {
            this.schemes.add(st.nextElement());
        }
    }

    private void sortBlocks(ArrayList blocks) {
        Collections.sort(blocks, new Comparator() {
            public int compare(Object object1, Object object2) {
                URLBlock b1 = (URLBlock) object1;
                URLBlock b2 = (URLBlock) object2;
                return (b1.getStart() > b2.getStart()) ? 1 : -1;
            }
        });
    }

    private boolean withinAnotherBlock(List blocks, int start) {
        for (int i = 0; i < blocks.size(); i++) {
            URLBlock block = (URLBlock) blocks.get(i);

            if (start >= block.getStart() && start < block.getEnd()) {
                return true;
            }
        }

        return false;
    }

    private boolean isNotEvil(String url) {
        String lcURL = url.toLowerCase();
        if (lcURL.indexOf("javascript:") != -1) {
            return false;
        }
        if (lcURL.indexOf("file:") != -1) {
            return false;
        }

        // check for javascript events
        if (lcURL.indexOf("onfocus") != -1) {
            return false;
        }
        if (lcURL.indexOf("onblur") != -1) {
            return false;
        }
        if (lcURL.indexOf("onclick") != -1) {
            return false;
        }
        if (lcURL.indexOf("ondblclick") != -1) {
            return false;
        }
        if (lcURL.indexOf("onmousedown") != -1) {
            return false;
        }
        if (lcURL.indexOf("onmouseup") != -1) {
            return false;
        }
        if (lcURL.indexOf("onmouseover") != -1) {
            return false;
        }
        if (lcURL.indexOf("onmousemove") != -1) {
            return false;
        }
        if (lcURL.indexOf("onmouseout") != -1) {
            return false;
        }
        if (lcURL.indexOf("onkeypress") != -1) {
            return false;
        }
        if (lcURL.indexOf("onkeydown") != -1) {
            return false;
        }
        if (lcURL.indexOf("onkeyup") != -1) {
            return false;
        }
        return true;
    }

    class URLBlock {
        int start = 0;
        int end = 0;
        String description = "";
        String url = "";

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        URLBlock(int start, int end, String url) {
            this.start = start;
            this.end = end;
            this.url = url;
        }

        URLBlock(int start, int end, String url, String description) {
            this.start = start;
            this.end = end;
            this.description = description;
            this.url = url;
        }

        public int getStart() {
            return start;
        }

        public void setStart(int start) {
            this.start = start;
        }

        public int getEnd() {
            return end;
        }

        public void setEnd(int end) {
            this.end = end;
        }
    }
}
package com.topcoder.web.forums.util.filter;

import com.jivesoftware.base.Filter;
import com.jivesoftware.base.FilterChain;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.Log;
import com.jivesoftware.base.filter.Newline;
import org.htmlparser.Attribute;
import org.htmlparser.Node;
import org.htmlparser.lexer.Lexer;
import org.htmlparser.lexer.Page;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.util.ParserException;

import java.awt.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

/**
 * This filter adds the following options to Jive's default HTML filter:
 * 1) Remove (escape/strip) attributes except for those explicitly allowed.
 * 2) Remove specific keywords in tags.
 */
public class TCHTMLFilter implements Filter {

    // Filter properties //
    private boolean onlyFilterBlocksEnabled = false;
    private boolean stripDisallowedTags = false;
    private boolean allowSymbols = true;
    private boolean restrictImageWidth = false;

    private String allowedTagsString = "";
    private String disallowedTagsString = "";
    private String allowedAttributesString = "";
    private String disallowedKeywordsString = "";
    private int maxImageWidth = 0;

    private Hashtable allowedAttributes = new Hashtable();
    private List disallowedKeywords = new ArrayList();
    private List allowedTags = new ArrayList();
    private List disallowedTags = new ArrayList();

    //  Other vars //
    private String blockStart = "<pre>";
    private String blockEnd = "</pre>";

    public static String[] DEFAULT_ALLOWED_TAGS = {"annot", "a", "abbr", "acronym", "blockquote", "b", "br", "em",
            "font", "i", "img", "li", "ol", "p", "pre", "s", "strike", "sub", "sup", "strong", "table", "td", "tr",
            "tt", "u", "ul"};
    public static String[] DEFAULT_DISALLOWED_TAGS = {"o:~", "st1:~"};
    public static String[] DEFAULT_ALLOWED_ATTRIBUTES = {"a:href", "img:src,height,width"};
    public static String[] DEFAULT_DISALLOWED_KEYWORDS = {"javascript"};
    public static int DEFAULT_MAX_IMAGE_WIDTH = 600;

    /**
     * Creates a new default HTML filter.
     */
    public TCHTMLFilter() {
        for (int i = 0; i < DEFAULT_ALLOWED_TAGS.length; i++) {
            allowedTags.add(DEFAULT_ALLOWED_TAGS[i]);
        }
        for (int i = 0; i < allowedTags.size(); i++) {
            allowedTagsString += allowedTags.get(i);
            if (i != allowedTags.size() - 1) {
                allowedTagsString += ",";
            }
        }

        for (int i = 0; i < DEFAULT_DISALLOWED_TAGS.length; i++) {
            disallowedTags.add(DEFAULT_DISALLOWED_TAGS[i]);
        }
        for (int i = 0; i < disallowedTags.size(); i++) {
            disallowedTagsString += disallowedTags.get(i);
            if (i != disallowedTags.size() - 1) {
                disallowedTagsString += ",";
            }
        }

        for (int i = 0; i < DEFAULT_ALLOWED_ATTRIBUTES.length; i++) {
            String[] ss = DEFAULT_ALLOWED_ATTRIBUTES[i].split(":");
            ArrayList values = new ArrayList(Arrays.asList(ss[1].split(",")));
            allowedAttributes.put(ss[0], values);
        }
        for (int i = 0; i < DEFAULT_ALLOWED_ATTRIBUTES.length; i++) {
            allowedAttributesString += DEFAULT_ALLOWED_ATTRIBUTES[i];
            if (i != DEFAULT_ALLOWED_ATTRIBUTES.length - 1) {
                allowedAttributesString += " ";
            }
        }

        for (int i = 0; i < DEFAULT_DISALLOWED_KEYWORDS.length; i++) {
            disallowedKeywords.add(DEFAULT_DISALLOWED_KEYWORDS[i]);
        }
        for (int i = 0; i < disallowedKeywords.size(); i++) {
            disallowedKeywordsString += disallowedKeywords.get(i);
            if (i != disallowedKeywords.size() - 1) {
                disallowedKeywordsString += ",";
            }
        }

        maxImageWidth = DEFAULT_MAX_IMAGE_WIDTH;
    }

    public String getName() {
        return "TCHTML";
    }

    public String getAllowedAttributesString() {
        return allowedAttributesString;
    }

    public void setAllowedAttributesString(String allowedAttributesString) {
        if (allowedAttributesString == null) {
            this.allowedAttributesString = "";
            allowedAttributes.clear();
            return;
        }
        this.allowedAttributesString = allowedAttributesString;
        allowedAttributes.clear();
        StringTokenizer tokens = new StringTokenizer(allowedAttributesString, " ");
        while (tokens.hasMoreTokens()) {
            String token = tokens.nextToken().toLowerCase().trim();
            String[] ss = token.split(":");
            ArrayList values = new ArrayList(Arrays.asList(ss[1].split(",")));
            allowedAttributes.put(ss[0], values);
        }
    }

    public String getDisallowedKeywordsString() {
        return disallowedKeywordsString;
    }

    public void setDisallowedKeywordsString(String disallowedKeywordsString) {
        if (disallowedKeywordsString == null) {
            this.disallowedKeywordsString = "";
            disallowedKeywords.clear();
            return;
        }
        this.disallowedKeywordsString = disallowedKeywordsString;
        disallowedKeywords.clear();
        StringTokenizer tokens = new StringTokenizer(disallowedKeywordsString, ",");
        while (tokens.hasMoreTokens()) {
            disallowedKeywords.add(tokens.nextToken().toLowerCase().trim());
        }
    }

    /**
     * Returns <tt>true</tt> if HTML filtering will only occur inside of [html] blocks or not.
     *
     * @return <tt>true</tt> if HTML filtering will only occur inside of [html] blocks or not.
     */
    public boolean isOnlyFilterBlocksEnabled() {
        return onlyFilterBlocksEnabled;
    }

    /**
     * Enables or disables the HTML filtering only inside of [html] [/html] blocks or not.
     *
     * @param enabled <tt>true</tt> if new window mode should be enabled.
     */
    public void setOnlyFilterBlocksEnabled(boolean enabled) {
        this.onlyFilterBlocksEnabled = enabled;
    }

    public boolean isStripDisallowedTags() {
        return stripDisallowedTags;
    }

    public void setStripDisallowedTags(boolean stripDisallowedTags) {
        this.stripDisallowedTags = stripDisallowedTags;
    }

    public boolean isAllowSymbols() {
        return allowSymbols;
    }

    public void setAllowSymbols(boolean allowSymbols) {
        this.allowSymbols = allowSymbols;
    }

    public boolean isRestrictImageWidth() {
        return restrictImageWidth;
    }

    public void setRestrictImageWidth(boolean restrictImageWidth) {
        this.restrictImageWidth = restrictImageWidth;
    }

    public String getMaxImageWidth() {
        return String.valueOf(maxImageWidth);
    }

    public void setMaxImageWidth(String maxImageWidth) {
        try {
            this.maxImageWidth = Integer.parseInt(maxImageWidth);
        } catch (NumberFormatException nfe) {
            this.maxImageWidth = DEFAULT_MAX_IMAGE_WIDTH;
        }
    }

    public String getAllowedTagsString() {
        return allowedTagsString;
    }

    public void setAllowedTagsString(String allowedTagsString) {
        if (allowedTagsString == null) {
            this.allowedTagsString = "";
            allowedTags.clear();
            return;
        }
        this.allowedTagsString = allowedTagsString;
        allowedTags.clear();
        StringTokenizer tokens = new StringTokenizer(allowedTagsString, ",");
        while (tokens.hasMoreTokens()) {
            allowedTags.add(tokens.nextToken().toLowerCase().trim());
        }
    }

    public String getDisallowedTagsString() {
        return disallowedTagsString;
    }

    public void setDisallowedTagsString(String allowedTagsString) {
        if (allowedTagsString == null) {
            this.disallowedTagsString = "";
            disallowedTags.clear();
            return;
        }
        this.disallowedTagsString = allowedTagsString;
        disallowedTags.clear();
        StringTokenizer tokens = new StringTokenizer(allowedTagsString, ",");
        while (tokens.hasMoreTokens()) {
            disallowedTags.add(tokens.nextToken().toLowerCase().trim());
        }
    }

    /**
     * Returns the HTML tags that starts a HTML block. For example, it could be
     * <code>&lt;pre&gt;</code>. This will only be used if we are filtering html
     * in [html] [/html] blocks.
     *
     * @return the HTML tags to start a HTML block.
     */
    public String getBlockStart() {
        return blockStart;
    }

    /**
     * Sets the HTML tags that starts a HTML block. For example, it could be
     * <code>&lt;pre&gt;</code>. This will only be used if we are filtering html
     * in [html] [/html] blocks.
     *
     * @param blockStart the HTML tags to start a HTML block.
     */

    public void setBlockStart(String blockStart) {
        this.blockStart = blockStart;
    }

    /**
     * Returns the HTML tags that ends a HTML block. For example, it could be
     * <code>&lt;/pre&gt;</code>. This will only be used if we are filtering html
     * in [html] [/html] blocks.
     *
     * @return the HTML tags to end a HTML block.
     */
    public String getBlockEnd() {
        return blockEnd;
    }

    /**
     * Sets the HTML tags that ends a HTML block. For example, it could be
     * <code>&lt;/pre&gt;</code>. This will only be used if we are filtering html
     * in [html/ [/html] blocks.
     *
     * @param blockEnd the HTML tags to end a HTML block.
     */
    public void setBlockEnd(String blockEnd) {
        this.blockEnd = blockEnd;
    }

    public String applyFilter(String string, int currentIndex, FilterChain chain) {
        if (string == null || string.length() < 1) {
            return string;
        }

        int length = string.length();
        StringBuffer filtered = new StringBuffer(length);

        if (onlyFilterBlocksEnabled && string.indexOf("[html]") < 0) {
            doFilter(string, filtered, chain, false);
            return chain.applyFilters(currentIndex, filtered.toString());
        } else if (onlyFilterBlocksEnabled) {
            int startCodeTag = 0;
            int endCodeTag = 0;

            while ((startCodeTag = string.indexOf("[html]", endCodeTag)) >= 0) {
                int end = string.indexOf("[/html]", startCodeTag + 6);

                if (end <= 0) {
                    if (end == 0 && startCodeTag > 0) {
                        // apply filters for content between 0 and [html]
                        String snippit = string.substring(endCodeTag, startCodeTag);
                        StringBuffer sb = new StringBuffer();
                        doFilter(snippit, sb, chain, false);
                        filtered.append(chain.applyFilters(currentIndex, sb.toString()));
                    }
                    endCodeTag = startCodeTag + 6;
                    continue;
                }

                if (endCodeTag < startCodeTag) {
                    // apply filters for content between [/html] and [html]
                    String snippit = string.substring(endCodeTag, startCodeTag);
                    StringBuffer sb = new StringBuffer();
                    doFilter(snippit, sb, chain, false);
                    filtered.append(chain.applyFilters(currentIndex, sb.toString()));
                }

                endCodeTag = end + 7;
                String code = string.substring(startCodeTag + 6, endCodeTag - 7);
                if (code.length() <= 0) {
                    continue;
                }

                filtered.append(blockStart);
                doFilter(code, filtered, chain, true);
                filtered.append(blockEnd);
            }

            if (endCodeTag < length) {
                // apply filters for content between [/html] and end of string
                String snippit = string.substring(endCodeTag);
                StringBuffer sb = new StringBuffer();
                doFilter(snippit, sb, chain, false);
                filtered.append(chain.applyFilters(currentIndex, sb.toString()));
            }

            return filtered.toString();
        } else {
            doFilter(string, filtered, chain, false);
        }

        return chain.applyFilters(currentIndex, filtered.toString());
    }

    private void doFilter(String toFilter, StringBuffer filtered, FilterChain chain, boolean inHtmlBlock) {
        if (toFilter == null || toFilter.length() < 1) {
            return;
        }

        // filter everything
        if (inHtmlBlock || allowedTags.size() == 0) {
            doPlainFilter(toFilter, filtered);
        }
        // only filter out tags we don't want to have displayed
        else {
            doAdvancedFilter(toFilter, filtered, chain);
        }
    }

    private void doPlainFilter(String toFilter, StringBuffer filtered) {
        int lastFoundChar = 0;
        for (int i = 0; i < toFilter.length(); i++) {
            char c = toFilter.charAt(i);
            // Left angle bracket
            if (c == '<') {
                if (lastFoundChar != i) {
                    filtered.append(toFilter.substring(lastFoundChar, i));
                }
                filtered.append("&lt;");
                lastFoundChar = i + 1;
            }
            // Right angle bracket
            else if (c == '>') {
                if ((lastFoundChar < toFilter.length() - 1) && (lastFoundChar != i)) {
                    filtered.append(toFilter.substring(lastFoundChar, i));
                }
                filtered.append("&gt;");
                lastFoundChar = i + 1;
            }
            // Ampersand symbol
            else if (c == '&') {
                if (lastFoundChar != i) {
                    filtered.append(toFilter.substring(lastFoundChar, i));
                }
                filtered.append("&#38;");
                lastFoundChar = i + 1;
            }
        }

        if (lastFoundChar < toFilter.length()) {
            filtered.append(toFilter.substring(lastFoundChar, toFilter.length()));
        }
    }

    /**
     * Handles the filtering of specific html tags. Any acceptable tags will be allowed
     * though it's attributes may be cleansed (i.e. the source attribute to the &lt;a&gt;
     * tags will be checked for proper urls). Unacceptable tags are either escaped or
     * explicitly removed depending on whether {@link #isStripDisallowedTags()} is false or not.<p>
     * <p/>
     * A few notes:
     * <ul>
     * <li>No attempt is made to 'fix' or otherwise correct improperly balanced tags.</li>
     * <li>Attribute cleaning is handled by the {@link #cleanseTag(TagNode)} method.</li>
     * <li>Attribute cleansing is limited to checking src and href tags on 'img' and 'a' tags,
     * and removing all on* attributes for handling javascript events</li>
     * </ul>
     *
     * @param toFilter the string to filter
     * @param filtered the buffer to append filtered text to
     */
    private void doAdvancedFilter(String toFilter, StringBuffer filtered, FilterChain chain) {
        StringBuffer buf = new StringBuffer(toFilter.length() + 100);
        boolean hasTag = false;
        Page page = null;
        String encoding = JiveGlobals.getCharacterEncoding();
        try {
            page = new Page(new ByteArrayInputStream(toFilter.getBytes(encoding)), encoding);
        }
        catch (IOException ioe) {
            Log.warn("Problem when creating TCHTMLFilter page.", ioe);
            page = new Page(toFilter);
        }
        Lexer lexer = new Lexer(page);

        try {
            Node node = null;
            while ((node = lexer.nextNode()) != null) {
                if (node instanceof TagNode) {
                    TagNode tagNode = (TagNode) node;
                    String tagName = tagNode.getTagName();

                    // empty tags
                    if ("".equals(tagName) || tagName == null) {
                        buf.append("&lt;").append("&gt;");
                    } else if (hasDisallowedKeywords(tagNode) || !allAttributesAllowed(tagNode)) {
                        if (!isStripDisallowedTags()) {
                            doPlainFilter(tagNode.toHtml(), buf);
                        }   // else skip
                    }
                    // acceptable tags
                    else if (isAcceptableTag(tagName)) {
                        hasTag = true;
                        buf.append(cleanseTag(tagNode));
                    } else if (isUnAcceptableTag(tagName)) {
                        // skip
                    }
                    // escape if allowed
                    else if (!isStripDisallowedTags()) {
                        doPlainFilter(tagNode.toHtml(), buf);
                    }
                } else if (node instanceof org.htmlparser.nodes.TextNode) {
                    buf.append(cleanseText(node.toHtml(), chain));
                } else {
                    // comment, escape
                    buf.append(cleanseText(node.toHtml(), chain));
                }
            }

            if (hasTag) {
                // search chain for newline filter
                // if found and nobr option enabled then wrap html with [nobr] .. [/nobr] tags
                List filters = chain.getFilters();
                boolean found = false;
                for (int i = 0; i < filters.size(); i++) {
                    Filter f = (Filter) filters.get(i);
                    if (f instanceof TCHTMLFilter) {
                        found = true;
                    } else if (found && f instanceof Newline) {
                        if (((Newline) f).isNobrEnabled()) {
                            filtered.append("[nobr]").append(buf).append("[/nobr]");
                            return;
                        }
                    }
                }
            }
        }
        catch (ParserException e) {
            Log.error(e);
        }

        filtered.append(buf);
    }

    protected String cleanseText(String text, FilterChain chain) {
        StringBuffer filtered = new StringBuffer(text.length() + 50);
        int lastFoundChar = 0;

        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            // Left angle bracket
            if (c == '<') {
                if (lastFoundChar != i) {
                    filtered.append(text.substring(lastFoundChar, i));
                }
                filtered.append("&lt;");
                lastFoundChar = i + 1;
            }
            // Right angle bracket
            else if (c == '>') {
                if ((lastFoundChar < text.length() - 1) && (lastFoundChar != i)) {
                    filtered.append(text.substring(lastFoundChar, i));
                }
                filtered.append("&gt;");
                lastFoundChar = i + 1;
            }
            // Ampersand symbol
            else if (c == '&') {
                if (lastFoundChar != i) {
                    filtered.append(text.substring(lastFoundChar, i));
                }

                if (!allowSymbols && !contentIsHtml(chain.getSourceObject())) {
                    filtered.append("&#38;");
                } else {
                    // find the next ;
                    if (text.indexOf(';', i) != -1) {
                        char[] symbol = text.substring(i, text.indexOf(';', i)).toCharArray();
                        // only numbers and letters are allowed
                        boolean ok = true;
                        for (int j = 1; j < symbol.length; j++) {
                            char c1 = symbol[j];
                            if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789#".indexOf(c1) == -1) {
                                ok = false;
                                break;
                            }
                        }
                        // looks like a symbol
                        if (ok) {
                            filtered.append('&');
                        }
                        // didn't look like a symbol - contained invalid characters
                        else {
                            filtered.append("&#38;");
                        }
                    } else {
                        filtered.append("&#38;");
                    }
                }

                lastFoundChar = i + 1;
            }
        }

        if (lastFoundChar < text.length()) {
            filtered.append(text.substring(lastFoundChar, text.length()));
        }

        return filtered.toString();
    }

    protected boolean contentIsHtml(Object sourceObject) {
        return false;
    }

    /**
     * Returns true if the tags is acceptable, false otherwise.
     *
     * @param tagName the tags to verify for acceptability
     * @return true if the tags is acceptable, false otherwise.
     */
    private boolean isAcceptableTag(String tagName) {
        if (tagName != null && allowedTags.contains(tagName.toLowerCase())) {
            return true;
        }

        return false;
    }

    /**
     * Returns true if the tags is acceptable, false otherwise.
     *
     * @param tagName the tags to verify for acceptability
     * @return true if the tags is acceptable, false otherwise.
     */
    private boolean isUnAcceptableTag(String tagName) {
        if (tagName != null) {
            String lcTagName = tagName.toLowerCase();
            for (int i = 0; i < disallowedTags.size(); i++) {
                String tag = (String) disallowedTags.get(i);
                // check for wildcard mapping
                if (tag.charAt(tag.length() - 1) == '~') {
                    // match start of tags
                    if (lcTagName.indexOf(tag.substring(0, tag.length() - 1)) == 0) {
                        return true;
                    }
                } else {
                    if (tag.equals(tagName.toLowerCase())) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    /**
     * Returns true if the tags contains disallowed keywords, false otherwise.
     *
     * @param tag the tags to verify for acceptability
     * @return true if the tags is acceptable, false otherwise.
     */
    private boolean hasDisallowedKeywords(TagNode tag) {
        //Log.info("ENTERING: hasDisallowedKeywords - " + tags.getTagName());
        Vector attributes = tag.getAttributesEx();
        for (int i = 0; i < attributes.size(); i++) {
            Attribute attribute = (Attribute) attributes.get(i);
            for (int j = 0; j < disallowedKeywords.size(); j++) {
                if (attribute.getValue() != null &&
                        attribute.getValue().toLowerCase().indexOf(((String) disallowedKeywords.get(j)).toLowerCase()) != -1) {
                    //Log.info("RETURNS: true");
                    return true;
                }
            }
        }
        //Log.info("RETURNS: false");
        return false;
    }

    /**
     * Returns true if the tags contains only allowed attributes, false otherwise.
     *
     * @param tag the tags to verify for acceptability
     * @return true if the tags is acceptable, false otherwise.
     */
    private boolean allAttributesAllowed(TagNode tag) {
        //Log.info("ENTERING: allAttributesAllowed - " + tags.getTagName());
        String tagName = tag.getTagName().toLowerCase();
        Vector attributes = tag.getAttributesEx();
        ArrayList allowed = (ArrayList) allowedAttributes.get(tagName);
        for (int i = 1; i < attributes.size(); i++) {
            Attribute attribute = (Attribute) attributes.get(i);
            /* if (attribute.getName() == null) {
               Log.info("attribute: null");
           } else {
               Log.info("attribute: " + attribute.getName());
           } */
            if (allowed == null ||
                    (attribute.getName() != null && !(attribute.getName().equals("/")) &&
                            !allowed.contains(attribute.getName().toLowerCase()))) {
                //Log.info("RETURNS: false");
                return false;
            }
        }
        //Log.info("RETURNS: true");
        return true;
    }

    /**
     * Handles the cleansing of html tags.
     *
     * @param tag the complete tags minus the brackets
     * @return the cleansed tags or null if all required attributes of the tags are invalid.
     */
    private String cleanseTag(TagNode tag) {
        String tagName = tag.getTagName();

        if ("IMG".equalsIgnoreCase(tagName) || "A".equalsIgnoreCase(tagName)) {
            // verify src and href tags are only http and https
            if ("IMG".equalsIgnoreCase(tagName)) {
                String src = tag.getAttribute("src");
                if (src != null) {
                    src = src.trim().toLowerCase();
                    // If there is a scheme but it's not http:// or https://, set the src to #
                    if (!src.startsWith("http://") && !src.startsWith("https://") &&
                            src.indexOf("://") != -1) {
                        Attribute attr = tag.getAttributeEx("src");
                        attr.setValue("#");
                    }
                }

                if (restrictImageWidth) {
                    String widthStr = tag.getAttribute("width");
                    if (widthStr != null) {
                        if (widthStr.endsWith("/")) {
                            widthStr = widthStr.substring(0, widthStr.length() - 1);
                        }
                        try {
                            int width = Integer.parseInt(widthStr);
                            if (width > maxImageWidth) {
                                Attribute attrWidth = tag.getAttributeEx("width");
                                attrWidth.setValue(String.valueOf(maxImageWidth));
                            }
                        } catch (NumberFormatException nfe) {
                        }
                    } else {
                        try {
                            Image im = Toolkit.getDefaultToolkit().getImage(new URL(src));
                            MediaTracker tracker = new MediaTracker(new Frame());
                            tracker.addImage(im, 0);
                            tracker.waitForAll();

                            int width = im.getWidth(null);
                            String heightStr = tag.getAttribute("height");
                            if (heightStr != null && heightStr.endsWith("/")) {
                                heightStr = heightStr.substring(0, heightStr.length() - 1);
                            }
                            try {
                                int height = Integer.parseInt(heightStr);
                                width = width * (height / im.getHeight(null));
                            } catch (NumberFormatException nfe) {
                            }
                            if (width > maxImageWidth) {
                                Attribute attrWidth = tag.getAttributeEx("width");
                                attrWidth.setValue(String.valueOf(maxImageWidth));
                            }
                        } catch (InterruptedException ie) {
                            Log.error("TCHTMLFilter: InterruptedException encountered while retrieving image");
                        } catch (MalformedURLException mue) {
                            Log.error("TCHTMLFilter: MalformedURLException encountered while retrieving image (SRC = " + src + ")");
                        }
                    }
                }
            } else {
                String href = tag.getAttribute("href");
                if (href != null) {
                    href = href.trim().toLowerCase();
                    // If there is a scheme but it's not http://, https://, ftp://, or ftps://, set the href to #
                    if (!href.startsWith("http://") && !href.startsWith("https://") &&
                        !href.startsWith("ftp://") && href.indexOf("://") != -1) {
                        Attribute attr = tag.getAttributeEx("href");
                        attr.setValue("#");
                    }
                }
            }
        }

        cleanseOnEvents(tag);
        return tag.toHtml();
    }

    /**
     * Handles the removing of onEvents from html tags
     *
     * @param tag the TagNode to cleanse
     */
    private void cleanseOnEvents(TagNode tag) {
        Vector attributes = tag.getAttributesEx();
        List toRemove = new ArrayList();
        for (Iterator iterator = attributes.iterator(); iterator.hasNext();) {
            Attribute attribute = (Attribute) iterator.next();
            if (attribute.getName() != null && attribute.getName().toLowerCase().startsWith("on")) {
                toRemove.add(attribute.getName());
            }
        }

        for (int i = 0; i < toRemove.size(); i++) {
            String attr = (String) toRemove.get(i);
            tag.removeAttribute(attr);
        }
    }
}
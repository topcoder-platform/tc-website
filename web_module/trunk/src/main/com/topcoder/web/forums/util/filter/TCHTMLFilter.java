package com.topcoder.web.forums.util.filter;

import com.jivesoftware.base.*;
import com.jivesoftware.base.filter.*;

import java.util.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import org.htmlparser.*;
import org.htmlparser.lexer.Lexer;
import org.htmlparser.lexer.Page;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.Attribute;
import org.htmlparser.util.ParserException;

/**
 * <p>A Filter that takes a string which may contain HTML tags (ie, &lt;table&gt;, etc) and converts the
 * '<', '>' and '&' characters to their HTML escape sequences. If block mode is enabled HTML will
 * only be escaped inside of [html] [/html] blocks.</p>
 *
 * <p>This filter has the ability to allow specific HTML tags to pass through the filter when
 * not used in block mode. By default the following tags are allowed to bypass the filter:<ul><tt>
 *
 * &lt;annot&gt;, &lt;a&gt;, &lt;abbr&gt;, &lt;acronym&gt;, &lt;blockquote&gt;, &lt;b&gt;,
 * &lt;br&gt;, &lt;div&gt;, &lt;em&gt;, &lt;font&gt;, &lt;h1&gt; - &lt;h6&gt;, &lt;hr&gt;,
 * &lt;i&gt;, &lt;img&gt;, &lt;li&gt;, &lt;ol&gt;, &lt;p&gt;, &lt;s&gt;, &lt;span&gt;,
 * &lt;strike&gt;, &lt;sub&gt;, &lt;sup&gt;, &lt;strong&gt;, &lt;tt&gt;, &lt;u&gt;, &lt;ul&gt; </tt></ul></p>
 *
 * <p>Note: if you have this filter enabled you do <b>not</b> also need to have the {@link Newline} filter
 * enabled. This HTML filter will filter newline characters ('\n' or '\r\n') when the filter input does not
 * contain any HTML tags.</p>
 */
public class TCHTMLFilter extends HTMLFilter {

    // Filter properties //

    private boolean onlyFilterBlocksEnabled = false;
    private boolean stripDisallowedTags = false;
    private boolean allowSymbols = true;
    private String allowedTagsString = "";
    private String disallowedTagsString = "";

    // Other vars //

    private String blockStart = "<pre>";
    private String blockEnd = "</pre>";

    private List allowedTags = new ArrayList();
    private List disallowedTags = new ArrayList();

    /**
     * Creates a new default HTML filter.
     */
    public TCHTMLFilter() {
        super();
    }

    public String getName() {
        return "TCHTML";
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
     * Returns the HTML tag that starts a HTML block. For example, it could be
     * <code>&lt;pre&gt;</code>. This will only be used if we are filtering html
     * in [html] [/html] blocks.
     *
     * @return the HTML tag to start a HTML block.
     */
    public String getBlockStart() {
        return blockStart;
    }

    /**
     * Sets the HTML tag that starts a HTML block. For example, it could be
     * <code>&lt;pre&gt;</code>. This will only be used if we are filtering html
     * in [html] [/html] blocks.
     *
     * @param blockStart the HTML tag to start a HTML block.
     */

    public void setBlockStart(String blockStart) {
        this.blockStart = blockStart;
    }

    /**
     * Returns the HTML tag that ends a HTML block. For example, it could be
     * <code>&lt;/pre&gt;</code>. This will only be used if we are filtering html
     * in [html] [/html] blocks.
     *
     * @return the HTML tag to end a HTML block.
     */
    public String getBlockEnd() {
        return blockEnd;
    }

    /**
     * Sets the HTML tag that ends a HTML block. For example, it could be
     * <code>&lt;/pre&gt;</code>. This will only be used if we are filtering html
     * in [html/ [/html] blocks.
     *
     * @param blockEnd the HTML tag to end a HTML block.
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
        }
        else if (onlyFilterBlocksEnabled) {
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
        }
        else {
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
     * Handles the filtering of specific html tags. Any acceptable tag will be allowed
     * though it's attributes may be cleansed (i.e. the source attribute to the &lt;a&gt;
     * tag will be checked for proper urls). Unacceptable tags are either escaped or
     * explicitly removed depending on whether {@link #isStripDisallowedTags()} is false or not.<p>
     *
     * A few notes:
     * <ul>
     *  <li>No attempt is made to 'fix' or otherwise correct improperly balanced tags.</li>
     *  <li>Attribute cleaning is handled by the {@link #cleanseTag(TagNode)} method.</li>
     *  <li>Attribute cleansing is limited to checking src and href tags on 'img' and 'a' tags,
     *      and removing all on* attributes for handling javascript events</li>
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
            Log.warn("Problem when creating HTMLFilter page.", ioe);
            page = new Page(toFilter);
        }
        Lexer lexer = new Lexer(page);

        try {
            Node node = null;
            while ((node = lexer.nextNode()) != null) {
                if (node instanceof TagNode) {
                    TagNode tagNode = (TagNode) node;
                    String tagName = tagNode.getTagName();

                    // empty tag
                    if ("".equals(tagName) || tagName == null) {
                        buf.append("&lt;").append("&gt;");
                    }
                    // acceptable tag
                    else if (isAcceptableTag(tagName)) {
                        hasTag = true;
                        buf.append(cleanseTag(tagNode));
                    }
                    else if (isUnAcceptableTag(tagName)) {
                        // skip
                    }
                    // escape if allowed
                    else if (!isStripDisallowedTags()) {
                        doPlainFilter(tagNode.toHtml(), buf);
                    }
                }
                else if (node instanceof org.htmlparser.nodes.TextNode) {
                    buf.append(cleanseText(node.toHtml(), chain));
                }
                else {
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
                    if (f instanceof HTMLFilter) {
                        found = true;
                    }
                    else if (found && f instanceof Newline) {
                        if (((Newline) f).isNobrEnabled()) {
                            filtered.append("[nobr]").append(buf).append("[/nobr]");
                            return;
                        }
                    }
                }
            }
        }
        catch (ParserException e) { Log.error(e); }

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
                }
                else {
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
                    }
                    else {
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
     * Returns true if the tag is acceptable, false otherwise.
     *
     * @param tagName the tag to verify for acceptability
     * @return true if the tag is acceptable, false otherwise.
     */
    private boolean isAcceptableTag(String tagName) {
        if (tagName != null && allowedTags.contains(tagName.toLowerCase())) {
            return true;
        }

        return false;
    }

    /**
     * Returns true if the tag is acceptable, false otherwise.
     *
     * @param tagName the tag to verify for acceptability
     * @return true if the tag is acceptable, false otherwise.
     */
    private boolean isUnAcceptableTag(String tagName) {
        if (tagName != null) {
            String lcTagName = tagName.toLowerCase();
            for (int i = 0; i < disallowedTags.size(); i++) {
                String tag = (String) disallowedTags.get(i);
                // check for wildcard mapping
                if (tag.charAt(tag.length() -1) == '~') {
                    // match start of tag
                    if (lcTagName.indexOf(tag.substring(0, tag.length() - 1)) == 0) {
                        return true;
                    }
                }
                else {
                    if (tag.equals(tagName.toLowerCase())) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    /**
     * Handles the cleansing of html tags.
     *
     * @param tag the complete tag minus the brackets
     * @return the cleansed tag or null if all required attributes of the tag are invalid.
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
                            src.indexOf("://") != -1)
                    {
                        Attribute attr = tag.getAttributeEx("src");
                        attr.setValue("#");
                    }
                }
            }
            else {
                String href = tag.getAttribute("href");
                if (href != null) {
                    href = href.trim().toLowerCase();
                    // If there is a scheme but it's not http:// or https://, set the href to #
                    if (!href.startsWith("http://") && !href.startsWith("https://") &&
                            href.indexOf("://") != -1)
                    {
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
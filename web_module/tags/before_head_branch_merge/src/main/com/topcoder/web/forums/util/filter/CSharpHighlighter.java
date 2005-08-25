package com.topcoder.web.forums.util.filter;

import com.jivesoftware.base.*;

import java.io.*;

/**
 * A Filter that syntax highlights code appearing between [c#][/c#] tags.
 */
public class CSharpHighlighter implements Filter {

    private String commentStart;
    private String commentEnd;
    private String stringStart;
    private String stringEnd;
    private String reservedWordStart;
    private String reservedWordEnd;
    private String methodStart;
    private String methodEnd;
    private String characterStart;
    private String characterEnd;
    private String bracketStart;
    private String bracketEnd;
    private String numberStart;
    private String numberEnd;
    private boolean filterMethod;
    private boolean filterNumber;

    // for formatting code with an html table and printing line numbers
    private boolean applyTableSurround;
    private boolean showLineCount;

    private String tableBorderColor;
    private String tableLinePanelBackgroundColor;
    private String tableCodePanelBackgroundColor;
    private String lineNumberColor;
    
    private final static String TAG_NAME = "c#";
    private final static String BEGIN_TAG = "[" + TAG_NAME + "]";
    private final static String END_TAG = "[/" + TAG_NAME + "]";  
    private final static int BEGIN_TAG_LEN = BEGIN_TAG.length();
    private final static int END_TAG_LEN = END_TAG.length();

    /**
     * Much of the work of this filter is done by a CodeViewer object.
     */
    private CSharpViewer viewer;

    /**
     * Construct a new CSharpHighlighter filter.
     */
    public CSharpHighlighter() {
        viewer = new CSharpViewer();
        commentStart = viewer.getCommentStart();
        commentEnd = viewer.getCommentEnd();
        stringStart = viewer.getStringStart();
        stringEnd = viewer.getStringEnd();
        reservedWordStart = viewer.getReservedWordStart();
        reservedWordEnd = viewer.getReservedWordEnd();
        methodStart = viewer.getMethodStart();
        methodEnd = viewer.getMethodEnd();
        characterStart = viewer.getCharacterStart();
        characterEnd = viewer.getCharacterEnd();
        bracketStart = viewer.getBracketStart();
        bracketEnd = viewer.getBracketEnd();
        numberStart = viewer.getNumberStart();
        numberEnd = viewer.getNumberEnd();
        filterMethod = viewer.getFilterMethod();
        filterNumber = viewer.getFilterNumber();
        applyTableSurround = false;                // default
        showLineCount = false;                     // default
        tableBorderColor = "#999999";              // default
        tableLinePanelBackgroundColor = "#dddddd"; // default
        tableCodePanelBackgroundColor = "#ffffff"; // default
        lineNumberColor = "#555555";               // default
    }


    public String getName() {
        return "CSharpHighlighter";
    }

    public String applyFilter(String string, int currentIndex, FilterChain chain) {
        if (string == null || string.length() < 1) {
            return string;
        }

        int length = string.length();
        StringBuffer filtered = new StringBuffer(length);
        int startCodeTag = 0;
        int endCodeTag = 0;

        // short circuit this filter if no [c#] found
        if (string.indexOf(BEGIN_TAG) < 0) {
            return chain.applyFilters(currentIndex, string);
        }

        // we have something to filter
        while ((startCodeTag = string.indexOf(BEGIN_TAG, endCodeTag)) >= 0) {
            int end = string.indexOf(END_TAG, startCodeTag + BEGIN_TAG_LEN);

            if (end > 0) {
                if (endCodeTag < startCodeTag) {
                    // apply filters for content between [/c#] and [c#]
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

            code = cleanInput(code);

            if (applyTableSurround) {
                filtered.append(surroundWithTable(viewer.codeFilter(code), countLines(code)));
            }
            else {
                filtered.append("<pre>");
                filtered.append(viewer.codeFilter(code));
                filtered.append("</pre>");
            }
        }

        if (endCodeTag < length) {
            filtered.append(chain.applyFilters(currentIndex, string.substring(endCodeTag, length)));
        }

        return filtered.toString();
    }

    /**
     * Create an outer table that surrounds code. A benefit of this is that the table background
     * colors can be specified according to whatever maybe easier on the eyes, especially if the
     * existing page's background color does not display well with formatted code. Another useful
     * feature of the code table is the ability to conveniently output line numbers.
     *
     * @param text code already formatted with html markup
     * @param numLines number of lines in text
     * @return code surrounded with a table, possibly displaying line numbers
     */
    private String surroundWithTable(String text, int numLines) {
        StringBuffer buffer = new StringBuffer();
        buffer.append("<table border=\"0\" cellspacing=\"1\" cellpadding=\"3\" ");
        buffer.append("bgcolor=\"").append(tableBorderColor).append("\">");
        buffer.append("<tr>");

        // if line counts should be displayed
        // a cool feature to implement would be to be able to specify left or right sides
        if (showLineCount) {
            buffer.append("<td width=\"1\" align=\"left\" ");
            buffer.append(" bgcolor=\"").append(tableLinePanelBackgroundColor);
            buffer.append("\" valign=\"top\">");
            buffer.append("<font color=\"").append(lineNumberColor).append("\">");
            buffer.append("<pre>");
            buffer.append(makeLines(numLines));
            buffer.append("</pre>");
            buffer.append("</font>");
            buffer.append("</td>");
        }

        buffer.append("<td align=\"left\" ");
        buffer.append("bgcolor=\"").append(tableCodePanelBackgroundColor);
        buffer.append("\" valign=\"top\">");
        buffer.append("<pre>");
        buffer.append(text);
        buffer.append("</pre>");
        buffer.append("</td>").append("</tr>");
        buffer.append("</table>");

        return buffer.toString();
    }

    /**
     * Create line numbers - the effect is similar to an ide's line number display.
     */
    private String makeLines(int numLines) {
        StringBuffer buffer = new StringBuffer();

        for(int i = 1; i <= numLines; i++) {
            buffer.append(i + "<br>");

        }
        return buffer.toString();
    }

    public boolean getApplyTableSurround() {
        return applyTableSurround;
    }

    public void setApplyTableSurround(boolean applyTableSurround) {
        this.applyTableSurround = applyTableSurround;
    }

    public boolean getShowLineCount() {
        return showLineCount;
    }

    public void setShowLineCount(boolean showLineCount) {
        this.showLineCount = showLineCount;
    }

    /**
     * Returns the code table's border color. For example, it could be <code>red</code> or
     * <code>#123456</code>.
     *
     * @return the code table's border color
     */
    public String getTableBorderColor() {
        return tableBorderColor;
    }

    /**
     * Sets the code table's border color. For example, it could be <code>red</code> or
     * <code>#123456</code>.
     *
     * @param tableBorderColor the code table's border color
     */
    public void setTableBorderColor(String tableBorderColor) {
        this.tableBorderColor = tableBorderColor;
    }

    /**
     * Returns the line-number panel's background color. For example, it could
     * be <code>white</code> or <code>#123456</code>
     *
     * @return the line panel's background color.
     */
    public String getTableLinePanelBackgroundColor() {
        return tableLinePanelBackgroundColor;
    }

    /**
     * Sets the line-number panel's background color. For example, it could be <code>white</code>
     * or <code>#123456</code>.
     *
     * @param tableLinePanelBackgroundColor the line panel's background color
     */
    public void setTableLinePanelBackgroundColor(String tableLinePanelBackgroundColor) {
        this.tableLinePanelBackgroundColor = tableLinePanelBackgroundColor;
    }

    /**
     * Returns the code panel's background color. For example, it could be <code>blue</code> or
     * <code>#123456</code>.
     *
     * @return the code panel's background color
     */
    public String getTableCodePanelBackgroundColor() {
        return tableCodePanelBackgroundColor;
    }

    /**
     * Sets the code panel's background color. For example, it could be <code>blue</code> or
     * <code>#123456</code>.
     *
     * @param tableCodePanelBackgroundColor the code panel's background color
     */
    public void setTableCodePanelBackgroundColor(String tableCodePanelBackgroundColor) {
        this.tableCodePanelBackgroundColor = tableCodePanelBackgroundColor;
    }

    public String getLineNumberColor() {
        return lineNumberColor;
    }

    public void setLineNumberColor(String lineNumberColor) {
        this.lineNumberColor = lineNumberColor;
    }

    /**
     * Returns the HTML tag that starts comment blocks. For example, it could
     * be <code>&lt;i&gt;</code>.
     *
     * @return the HTML tag to start comment blocks
     */
    public String getCommentStart() {
        return commentStart;
    }

    /**
     * Sets the HTML tag that starts comment blocks. For example, it could be
     * <code>&lt;i&gt;</code>.
     *
     * @param commentStart the HTML tag to start comment blocks
     */
    public void setCommentStart(String commentStart) {
        this.commentStart = commentStart;
        viewer.setCommentStart(commentStart);
    }

    /**
     * Returns the HTML tag that ends comment blocks. For example, it could be
     * <code>&lt;/i&gt;</code>. The tag should correspond to the comment end tag.
     *
     * @return the HTML tag to end comment blocks
     */
    public String getCommentEnd() {
        return commentEnd;
    }

    /**
     * Sets the HTML tag that ends comment blocks. For example, it could be <code>&lt;/i&gt;</code>.
     * The tag should correspond to the comment end tag.
     *
     * @param commentEnd the HTML tag to end comment blocks
     */
    public void setCommentEnd(String commentEnd) {
        this.commentEnd = commentEnd;
        viewer.setCommentEnd(commentEnd);
    }

    /**
     * Returns the HTML tag that starts string blocks. For example, it could be
     * <code>&lt;font color=&quot;red&quot;&gt;</code>.
     *
     * @return the HTML tag to start string blocks
     */
    public String getStringStart() {
        return stringStart;
    }

    /**
     * Sets the HTML tag that starts string blocks. For example, it could be
     * <code>&lt;font color=&quot;red&quot;&gt;</code>.
     *
     * @param stringStart the HTML tag to start string blocks
     */
    public void setStringStart(String stringStart) {
        this.stringStart = stringStart;
        viewer.setStringStart(stringStart);
    }

    /**
     * Returns the HTML tag that ends string blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. The tag should correspond to the string end tag.
     *
     * @return the HTML tag to end string blocks
     */
    public String getStringEnd() {
        return stringEnd;
    }

    /**
     * Sets the HTML tag that ends string blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. The tag should correspond to the string end tag.
     *
     * @param stringEnd the HTML tag to end string blocks
     */
    public void setStringEnd(String stringEnd) {
        this.stringEnd = stringEnd;
        viewer.setStringEnd(stringEnd);
    }

    /**
     * Returns the HTML tag that starts keyword blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @return the HTML tag to start keyword blocks
     */
    public String getReservedWordStart() {
        return reservedWordStart;
    }

    /**
     * Sets the HTML tag that starts reserved word blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @param reservedWordStart the HTML tag to start keyword blocks
     */
    public void setReservedWordStart(String reservedWordStart) {
        this.reservedWordStart = reservedWordStart;
        viewer.setReservedWordStart(reservedWordStart);
    }

    /**
     * Returns the HTML tag that ends keyword blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for keyword blocks.
     *
     * @return the HTML tag to end keyword blocks
     */
    public String getReservedWordEnd() {
        return reservedWordEnd;
    }

    /**
     * Sets the HTML tag that ends keyword blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>. This should correspond to the end tag
     * for keyword blocks.
     *
     * @param reservedWordEnd the HTML tag to end keyword blocks
     */
    public void setReservedWordEnd(String reservedWordEnd) {
        this.reservedWordEnd = reservedWordEnd;
        viewer.setReservedWordEnd(reservedWordEnd);
    }

    /**
     * Returns the HTML tag that starts method blocks. For example, it could be
     * <code>&lt;font color=&quot;brown&quot;&gt;</code>.
     *
     * @return the HTML tag to start method blocks
     */
    public String getMethodStart() {
        return methodStart;
    }

    /**
     * Sets the HTML tag that starts method blocks. For example, it could be
     * <code>&lt;font color=&quot;brown&quot;&gt;</code>.
     *
     * @param methodStart the HTML tag to start method blocks
     */
    public void setMethodStart(String methodStart) {
        this.methodStart = methodStart;
        viewer.setMethodStart(methodStart);
    }

    /**
     * Returns the HTML tag that ends method blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for method blocks.
     *
     * @return the HTML tag to end method blocks
     */
    public String getMethodEnd() {
        return methodEnd;
    }

    /**
     * Sets the HTML tag that ends method blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for method blocks.
     *
     * @param methodEnd the HTML tag to end method blocks
     */
    public void setMethodEnd(String methodEnd) {
        this.methodEnd = methodEnd;
        viewer.setMethodEnd(methodEnd);
    }

    /**
     * Returns the HTML tag that starts character blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @return the HTML tag to start method blocks
     */
    public String getCharacterStart() {
        return characterStart;
    }

    /**
     * Sets the HTML tag that starts character blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @param characterStart the HTML tag to start method blocks
     */
    public void setCharacterStart(String characterStart) {
        this.characterStart = characterStart;
        viewer.setCharacterStart(characterStart);
    }

    /**
     * Returns the HTML tag that ends character blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for character blocks.
     *
     * @return the HTML tag to end method blocks
     */
    public String getCharacterEnd() {
        return characterEnd;
    }

    /**
     * Sets the HTML tag that ends character blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for character blocks.
     *
     * @param characterEnd the HTML tag to end character blocks
     */
    public void setCharacterEnd(String characterEnd) {
        this.characterEnd = characterEnd;
        viewer.setCharacterEnd(characterEnd);
    }

    /**
     * Returns the HTML tag that starts bracket blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @return the HTML tag to start bracket blocks
     */
    public String getBracketStart() {
        return bracketStart;
    }

    /**
     * Sets the HTML tag that starts character blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @param bracketStart the HTML tag to start bracket blocks
     */
    public void setBracketStart(String bracketStart) {
        this.bracketStart = bracketStart;
        viewer.setBracketStart(bracketStart);
    }

    /**
     * Returns the HTML tag that ends character blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for bracket blocks.
     *
     * @return the HTML tag to end bracket blocks.
     */
    public String getBracketEnd() {
        return bracketEnd;
    }

    /**
     * Sets the HTML tag that ends character blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for bracket blocks.
     *
     * @param bracketEnd the HTML tag to end bracket blocks.
     */
    public void setBracketEnd(String bracketEnd) {
        this.bracketEnd = bracketEnd;
        viewer.setBracketEnd(bracketEnd);
    }

    /**
     * Gets the string value of the string escape character.
     *
     * @return the string value of the string escape character
     */
    public String getNumberStart() {
        return numberStart;
    }

    /**
     * Sets the HTML tag that starts character blocks. For example, it could be
     * <code>&lt;font color=&quot;navy&quot;&gt;</code>.
     *
     * @param numberStart the HTML tag to start bracket blocks
     */
    public void setNumberStart(String numberStart) {
        this.numberStart = numberStart;
        viewer.setNumberStart(numberStart);
    }

    /**
     * Returns the HTML tag that ends character blocks. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for number literals.
     *
     * @return the HTML tag to end bracket blocks.
     */
    public String getNumberEnd() {
        return numberEnd;
    }

    /**
     * Sets the HTML tag that ends number literals. For example, it could be
     * <code>&lt;/font&gt;</code>. This should correspond to the end tag for number literals.
     *
     * @param numberEnd the HTML tag to end number literals.
     */
    public void setNumberEnd(String numberEnd) {
        this.numberEnd = numberEnd;
        viewer.setNumberEnd(numberEnd);
    }

    /**
     * See if method filtering is enabled.
     */
    public boolean getFilterMethod() {
        return filterMethod;
    }

    /**
     * Enables or disables method filtering.
     */
    public void setFilterMethod(boolean filterMethod) {
        this.filterMethod = filterMethod;
        viewer.setFilterMethod(filterMethod);
    }

    /**
     * See if number filtering is enabled.
     */
    public boolean getFilterNumber() {
        return filterNumber;
    }

    /**
     * Enables or disables number filtering.
     */
    public void setFilterNumber(boolean filterNumber) {
        this.filterNumber = filterNumber;
        viewer.setFilterNumber(filterNumber);
    }

    /**
     * Cleans up the input removing carriage returns and new lines appropriately
     *
     * @param code the string to clean
     * @return the cleaned code
     */
    private final String cleanInput(String code) {
        boolean endInNewline = true;
        boolean startWithNewline = true;

        int codeLength = code.length();
        if (codeLength == 0) {
            return code;
        }

        String cleaned = deleteCarriages(code);
        codeLength = cleaned.length();
        if (codeLength == 0) {
            return cleaned;
        }

        // if the last character is not a newline
        if (cleaned.charAt(codeLength-1) != '\n') {
            endInNewline = false;
        }

        // if the first character is not a newline
        if (cleaned.charAt(0) != '\n') {
            startWithNewline = false;
        }

        if (endInNewline) {
            if (startWithNewline) {
                // get rid of initial newline
                // [c#]\n(tokens)\n[/c#]
                cleaned = cleaned.substring(1);
            }
        }
        else {
            if (startWithNewline) {
                // get rid of initial newline, then append an extra newline to compensate
                // [c#]\n(tokens)[/c#]
                cleaned = cleaned.substring(1) + "\n";
            }
            else {
                // append an extra newline to compensate
                // [c#](tokens)[/c#]
                cleaned = cleaned + "\n";
            }
        }

        return cleaned;
    }

    private final int countLines(String text) {
        int lineCount = 0;
        BufferedReader reader = new BufferedReader(new StringReader(text));

        try {
            while(reader.readLine() != null) {
                lineCount++;
            }
        }
        catch (IOException ioe) { Log.error(ioe); }

        return lineCount;
    }

    private final String deleteCarriages(String line) {
        char curr_char;
        int i = 0;
        StringBuffer buf = new StringBuffer();

        while (i < line.length()) {
            curr_char = line.charAt(i);

            if (curr_char != '\r') {
                buf.append(curr_char);
            }
            i++;
        }

        return buf.toString();
    }
}
package com.topcoder.common.web.util;

import com.topcoder.common.web.error.TCException;
import com.topcoder.shared.util.logging.Logger;

import java.text.*;

/**
 * Perform class Conversion with validation and error checking.
 */
public final class Conversion {

    private static Logger log = Logger.getLogger(Conversion.class);

    private static final String SPC_TAG = "<spc>";
    private static final char SPC = ' ';
    private static final String SPC_REPLACEMENT = "&#160;";
    private static final String CR_TAG = "<cr>";
    private static final char CR = (char) 10;
    private static final String CR_REPLACEMENT = "<br><br>";
    private static final String LINEFEED_TAG = "<linefeed>";
    private static final char LINEFEED = (char) 10;
    private static final String LINEFEED_REPLACEMENT = "<br>";
    private static final String DETAB_TAG = "<detab>";
    private static final char TAB = (char) 9;
    private static final String TAB_REPLACEMENT = "&#160;&#160;";
    private static final String[] VALID_TIMESTAMP = {
        "MM/dd/yy hh:mm a"
        , "MM/dd/yyyy hh:mm a"
        , "MM/dd/yy"
        , "MM/dd/yyyy"
    };

    public static String checkNull(String temp) {
        if (temp == null)
            return "";
        else
            return temp;
    }

    public static String checkNullInt(String temp) {
        if (temp == null)
            return "0";
        else
            return temp;
    }

    public static String clean(String temp) {
        if (temp == null) return "";
        temp = temp.trim();
        return temp;
    }


    /**
     * Converts a String to a Date.
     * The String have to be in 'MM/DD/YYYY' formate
     */
    public static java.sql.Timestamp convertStringToTimestamp(String sDate) {
        java.sql.Timestamp result = null;
        if ((sDate == null) || sDate.equals("")) {
            return null;
        }
        try {
            // first, check date format
            sDate = sDate.replace('-', '/');
            sDate = sDate.replace('.', '/');
            for (int i = 0; i < VALID_TIMESTAMP.length; i++) {
                result = convertStringToTimestamp(sDate, VALID_TIMESTAMP[i]);
                if (result != null) break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static java.sql.Timestamp convertStringToTimestamp(String sDate, String sFormat) {
        java.sql.Timestamp result = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat(sFormat);
            format.setLenient(false);
            java.util.Date uDate = format.parse(sDate, new ParsePosition(0));
            if (uDate != null) {
                result = new java.sql.Timestamp(uDate.getTime());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    /**
     * Replace " with &quote;
     */
    public static String URLReplaceQuotes(String s) {
        if (s == null)
            return "";

        String front;
        String end;
        String result = s;

        int i = 0;
        while (i < result.length()) {
            if (result.charAt(i) == '"') {
                front = result.substring(0, i);
                if (i + 1 < result.length())
                    end = result.substring(i + 1, result.length());
                else
                    end = "";
                result = front + "&quot;" + end;
                i += 5; // move up the length of "&quote;"
            }
            i++;
        }
        return result;
    }


    /*******************************************************************************
     * takes an html document as a String and searches for <spc>...</spc>
     * sections to replace ansi character 10 with a <br> tag.<br><br>
     * <b>NOTE:</b> due to increased speed of processing, the <spc> and closing
     * </spc> tags are case sensitive and must not contain spaces withing the
     * tag (example: <spc > or <SPC> will not be processed).  Do not
     * nest <SPC> tags.  Nested <SPC> tags will also not be processed.
     *
     * @author Steve Burrows
     * @param String html
     * @return String html filtered for spaces.
     * @throws TCException
     ********************************************************************************
     */
    public static String spaceToISOSpace(String html)
            throws TCException {
        String result = html;
        try {
            result = replaceChar(new StringBuffer(html), SPC_TAG, SPC, SPC_REPLACEMENT).toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "common.web.util.Conversion.spaceToISOSpace(String):ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    /*******************************************************************************
     * takes an html document as a String and searches for <linefeed>...</linefeed>
     * sections to replace ansi character 10 with a <br> tag.<br><br>
     * <b>NOTE:</b> due to increased speed of processing, the <linefeed> and closing
     * </linefeed> tags are case sensitive and must not contain spaces withing the
     * tag (example: <linefeed > or <LINEFEED> will not be processed).  Do not
     * nest <linefeed> tags.  Nested <linefeed> tags will also not be processed.
     *
     * @author Steve Burrows
     * @param String html
     * @return String html filtered for linefeeds.
     * @throws TCException
     ********************************************************************************
     */
    public static String linefeedToBR(String html)
            throws TCException {
        String result = html;
        try {
            result = replaceChar(new StringBuffer(html), LINEFEED_TAG, LINEFEED, LINEFEED_REPLACEMENT).toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "common.web.util.Conversion.linefeedToBR(String):ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    /*******************************************************************************
     * takes an html document as a String and searches for <cr>...</cr>
     * sections to replace ansi character 10 with a <br> tag.<br><br>
     * <b>NOTE:</b> due to increased speed of processing, the <linefeed> and closing
     * </linefeed> tags are case sensitive and must not contain spaces withing the
     * tag (example: <cr > or <CR> will not be processed).  Do not
     * nest <cr> tags.  Nested <cr> tags will also not be processed.
     *
     * @author Steve Burrows
     * @param String html
     * @return String html filtered for linefeeds.
     * @throws TCException
     ********************************************************************************
     */
    public static String crToBR(String html)
            throws TCException {
        String result = html;
        try {
            result = replaceChar(new StringBuffer(html), CR_TAG, CR, CR_REPLACEMENT).toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "common.web.util.Conversion.crToBR(String):ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    /*******************************************************************************
     * takes an html document as a String and searches for <detab>...</detab>
     * sections to replace ansi character 9 with two &#160; (space) tags.<br><br>
     * <b>NOTE:</b> due to increased speed of processing, the <detab> and closing
     * </detab> tags are case sensitive and must not contain spaces withing the
     * tag (example: <detab > or <DETAB> will not be processed).  Do not
     * nest <detab> tags.  Nested <detab> tags will also not be processed.
     *
     * @author Steve Burrows
     * @param String html
     * @return String html filtered for tabs.
     * @throws TCException
     ********************************************************************************
     */
    public static String tabToSpaces(String html)
            throws TCException {
        String result = html;
        try {
            result = replaceChar(new StringBuffer(html), DETAB_TAG, TAB, TAB_REPLACEMENT).toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "common.web.util.Conversion.tabToSpaces(String):ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    /*******************************************************************************
     * takes an html document as a StringBuffer and searches in the document for
     * a given set of tags to indicate a sections to replace a given ansi character
     * with a given replacement string.
     * <b>NOTE:</b> Nested tags will not be processed.
     *
     * @author Steve Burrows
     * @param StringBuffer html StringBuffer.
     * @param String tag region where to begin find and replace.
     * @param char find character to look for in tag region.
     * @param String replace find character with this String.
     * @return StringBuffer html filtered for linefeeds.
     * @throws TCException
     ********************************************************************************
     */
    public static StringBuffer replaceChar(StringBuffer html, String tag, char find, String replace)
            throws TCException {
        StringBuffer result = html;
        int position = 0;
        try {
            int replaceLen = replace.length();
            int tagLen = tag.length();
            String closeTag = tag.substring(0, 1) + "/" + tag.substring(1);
            int closeTagLen = closeTag.length();
            int outerLoop = 0;
            for (
                    int startTagPos = html.toString().indexOf(tag, 0);
                    startTagPos > -1;
                    startTagPos = html.toString().indexOf(tag, position)
                    ) {
                startTagPos += tagLen;
                int endTagPos = html.toString().indexOf(closeTag, position);
                if (startTagPos == endTagPos) break;
                if (endTagPos > startTagPos) {
                    StringBuffer buf = new StringBuffer(html.substring(startTagPos, endTagPos));
                    for (int i = buf.toString().indexOf(find); i > -1; i = buf.toString().indexOf(find, i)) {
                        buf = buf.replace(i, i + 1, replace);
                        i += replaceLen;
                    }
                    html.replace(startTagPos, endTagPos, buf.toString());
                    int oldEndPos = endTagPos + closeTagLen;
                    int oldLen = endTagPos - startTagPos;
                    int newLen = buf.length();
                    int difLen = newLen - oldLen;
                    position = oldEndPos + difLen;
                }
                outerLoop++;
                if (outerLoop > 1000) {
                    StringBuffer msg = new StringBuffer(html.length() + 300);
                    msg.append("util.Conversion.replaceChar:OUTER LOOP BREAK");
                    msg.append(":tag=");
                    msg.append(tag);
                    msg.append(":find=");
                    msg.append(find);
                    msg.append(":replace=");
                    msg.append(replace);
                    msg.append(":startTagPos=");
                    msg.append(startTagPos);
                    msg.append(":endTagPos=");
                    msg.append(endTagPos);
                    msg.append(":html=");
                    msg.append(html);
                    log.debug(msg.toString());
                    break;
                }
            }
            result = html;
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "common.web.util.Conversion.linefeedToBR(StringBuffer,String,char,String):ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    public static String ipBytesToString(byte[] ipByte) throws TCException {
        String result = null;
        if (ipByte.length == 4) {
            try {
                DecimalFormat byteFormat = new DecimalFormat("000");
                StringBuffer buffer = new StringBuffer(12);
                for (int i = 0; i < 4; i++) {
                    float floatByte = Float.parseFloat(Byte.toString(ipByte[i]));
                    if (floatByte < 0) {
                        buffer.append(byteFormat.format(256F + floatByte));
                    } else {
                        buffer.append(byteFormat.format(floatByte));
                    }
                }
                result = buffer.toString();
            } catch (Exception e) {
                e.printStackTrace();
                throw new TCException(
                        "common.web.util.Conversion:ipBytesToString:ERROR:" + e.getMessage()
                );
            }
        } else {
            throw new TCException(
                    "common.web.util.Conversion:ipBytesToString:ERROR:invalidIPByteArray"
            );
        }
        return result;
    }

    /**
     * Converts a Date to a String.
     * The String have to be in 'MM/DD/YYYY' format
     */
    public static String dateToString(java.sql.Date dDate) {
        if (dDate == null)
            return null;

        // first, check date format
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss aaa");
        format.setLenient(false);

        StringBuffer sDate = new StringBuffer();
        sDate = format.format(dDate, sDate, new FieldPosition(0));

        if (sDate == null) return "";

        return sDate.toString();
    }


}

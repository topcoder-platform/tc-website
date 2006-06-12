package com.topcoder.web.common;

import com.topcoder.shared.util.StringUtil;

import java.math.BigInteger;
import java.util.Random;

/**
 * Class for some frequently used (small and simple but still required to be
 * coded every time) string processing utilities.
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public final class StringUtils {
    public static final String ALPHABET_ALPHA_UPPER_EN = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static final String ALPHABET_ALPHA_LOWER_EN = "abcdefghijklmnopqrstuvwxyz";

    public static final String ALPHABET_ALPHA_EN =
            ALPHABET_ALPHA_LOWER_EN +
                    ALPHABET_ALPHA_UPPER_EN;

    public static final String ALPHABET_DIGITS_EN = "0123456789";
    public static final String ALPHABET_ZIPCODE_EN = "0123456789-";

    public static final String ALPHABET_PUNCTUATION_EN = "-,._";

    public static final String ALPHABET_ALPHA_PUNCT_EN =
            ALPHABET_ALPHA_EN +
                    ALPHABET_PUNCTUATION_EN;

    public static final String ALPHABET_WHITESPACE_EN = " \t\r\n";

    public static final String ALPHABET_ALPHA_NUM_EN =
            ALPHABET_ALPHA_UPPER_EN +
                    ALPHABET_ALPHA_LOWER_EN +
                    ALPHABET_DIGITS_EN +
                    ALPHABET_PUNCTUATION_EN;

    public static final String ALPHABET_ALPHA_NUM_PUNCT_EN =
            ALPHABET_ALPHA_NUM_EN +
                    ALPHABET_PUNCTUATION_EN;

    public static final String ALPHABET_NUM_PUNCT_EN =
            ALPHABET_DIGITS_EN +
                    ALPHABET_PUNCTUATION_EN;

    public static final String ALPHABET_HEX_UPPER = "0123456789ABCDEF";
    public static final String ALPHABET_PHONE_NUMBER = " -0123456789()+ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.";
    public static final String ALPHABET_USERNAME_EN = ALPHABET_ALPHA_NUM_EN + "!";

    /**
     * Checks if string has all its characters in alphabet given.
     *
     * @param string    String to be tested
     * @param alphabet  Alphabet to match
     * @param wsAllowed specifies if whitespaces are allowed or not
     * @return boolean true if string supplied matches the rules and false
     *         otherwise
     */
    public static boolean containsOnly(String string, String alphabet, boolean wsAllowed) {
        int n = string.length();
        for (int i = 0; i < n; ++i) {
            char ch = string.charAt(i);
            int foundAt = alphabet.indexOf(ch);
            if (foundAt < 0) {
                if (wsAllowed) {
                    if (ALPHABET_WHITESPACE_EN.indexOf(ch) >= 0) continue;
                }
                return false;
            }
        }
        return true;
    }

    /**
     * Checks if string has not more words than specified.
     *
     * @param string   string to be checked
     * @param maxWords max words allower
     * @return boolean true if string contains less (or equal) than
     *         maxWords and false otherwise.
     */
    public static boolean hasNotMoreWords(String string, int maxWords) {
        int wordCnt = 1;
        //String chkString = string.trim();
        int n = string.length();
        boolean skippingWs = false;
        for (int i = 0; i < n; ++i) {
            char ch = string.charAt(i);
            boolean isWs = ALPHABET_WHITESPACE_EN.indexOf(ch) >= 0;
            if (isWs) {
                if (skippingWs) continue;
                ++wordCnt;
                skippingWs = true;
            } else {
                if (skippingWs) skippingWs = false;
            }
        }
        return wordCnt <= maxWords;
    }

    /**
     * Returns hexadecimat representation of input array of bytes as String.
     *
     * @param buf array of byter to get representation of
     * @return String hexadecimal representation in uppercase
     */
    public static String getHexRepresentation(byte[] buf) {
        StringBuffer b = new StringBuffer();
        for (int i = 0; i < buf.length; ++i) {
            int iv = buf[i];
            if (iv < 0) iv += 256;
            int v = iv / 16;
            b.append(ALPHABET_HEX_UPPER.charAt(v));
            v = iv % 16;
            b.append(ALPHABET_HEX_UPPER.charAt(v));
        }
        return b.toString();
    }


    /**
     * Takes the given string and converts it so that it will maintain it's
     * format on an html page.
     *
     * @return String
     */
    public static String htmlEncode(String s) {
        StringBuffer sb = new StringBuffer();
        char ch = ' ';
        if (s == null) return "";
        for (int i = 0; i < s.length(); i++) {
            if ((ch = s.charAt(i)) == '>') {
                sb.append("&gt;");
            } else if (ch == 9) {  //we'll go with 4 spaces for a tab
                sb.append("&#160;&#160;&#160;&#160;");
            } else if (ch == '<') {
                sb.append("&lt;");
            } else if (ch == '\"') {
                sb.append("&quot;");
            } else if (ch == '&') {
                sb.append("&amp;");
            } else if (ch == 13 && s.length() > (i + 1) && s.charAt(i + 1) == 10) {
                sb.append("<br />");
                i++;
            } else if (ch == 10 || ch == 13) {
                sb.append("<br />");
            } else if (ch == '\'') {
                sb.append("&#039;");
            } else if (ch == '\\') {
                sb.append("&#092;");

/*
            } else if (((int) ch) < 32) {
                //anything less than a "space" character is technically unprintable
                sb.append("[\\u" + (int) ch + "]");
            } else if ((((int) ch) > 126) && (((int) ch) < 160)) {
                //anything in this range is unprintable per latin-1
                sb.append("[\\u" + (int) ch + "]");
            } else if ((((int) ch) >= 160) && (((int) ch) <= 255)) {
                //anything in this range is printable per latin-1 with a little massaging
                sb.append("&#" + (int) ch + ";");
            } else if ((int) ch > 255) {
                //anything in this range is unprintable per latin-1
                //html4.0 has some support but it isn't worth picking out a few cases that
                //some browsers won't display properly.
                sb.append("[\\u" + (int) ch + "]");
*/
            } else {
                sb.append(ch);
            }
        }
        return sb.toString();
    }

    //can't think of a better place to put these....
    public static String getActivationCode(long coderId) {
        String id = Long.toString(coderId);
        String hash = new BigInteger(new BigInteger(id).bitLength(), new Random(coderId)).add(new BigInteger("TopCoder", 36)).toString();
        while (hash.length() < id.length()) {
            hash = "0" + hash;
        }
        hash = hash.substring(hash.length() - id.length());
        return new BigInteger(id + hash).toString(36).toUpperCase();
    }

    //can't think of a better place to put these....
    public static int getCoderId(String activationCode) {
        try {
            String idhash = new BigInteger(activationCode, 36).toString();
            if (idhash.length() % 2 != 0) return 0;
            String id = idhash.substring(0, idhash.length() / 2);
            String hash = idhash.substring(idhash.length() / 2);
            if (new BigInteger(new BigInteger(id).bitLength(), new Random(Long.parseLong(id))).add(new BigInteger("TopCoder", 36)).toString().endsWith(hash))
            {
                return Integer.parseInt(id);
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }


    public static void main(String[] args) {
//        String blabla = "bla bla";
//        System.out.println(containsOnly(blabla, ALPHABET_ALPHA_EN, true));
//        System.out.println(hasNotMoreWords(blabla, 1));
        System.out.println(replace("heleel", "e", "ee"));
        System.out.println(replace("hell", "e", "ee"));
        System.out.println(replace("helle", "e", "ee"));
        System.out.println(replace("ehell", "e", "ee"));
        System.out.println(replace("heell", "e", "ee"));
        System.out.println("");
        System.out.println(replace("heeleeeel", "ee", "e"));
        System.out.println(replace("heell", "ee", "e"));
        System.out.println(replace("heellee", "ee", "e"));
        System.out.println(replace("eeheell", "ee", "e"));
        System.out.println(replace("heeeell", "ee", "e"));
        System.out.println(replace("hadkhekadk", "adk", "33"));
        System.out.println(replace("hadkhekadk", "adk", "33333"));
        System.out.println(replace("hadkhekadk", "adk", ""));

    }

    /**
     * Replaces null strings with "", others are returned untouched.
     */
    public static String checkNull(String s) {
        return s == null ? "" : s;
    }

    public static boolean contains(String s, char c) {
        return s.indexOf(c) > -1;
    }

    /**
     * Change all occurrances of <code>changeFrom</code> in <code>original</code>
     * to <code>changeTo</code>
     *
     * @param original
     * @param changeFrom
     * @param changeTo
     * @return String
     */
    public static String replace(String original, String changeFrom, String changeTo) {
        return StringUtil.replace(original, changeFrom, changeTo);
    }

    public static boolean isNumber(String s) {
        try {
            Long.parseLong(s);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static String getTrimmedParameter(TCRequest r, String param) {
        String val = r.getParameter(param);
        if (val == null) {
            return null;
        } else {
            return val.trim();
        }

    }

}

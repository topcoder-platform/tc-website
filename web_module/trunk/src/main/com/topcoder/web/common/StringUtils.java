package com.topcoder.web.common;

/**
 * Class for some frequently used (small and simple but still required to be
 * coded every time) string processing utilities.
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public final class StringUtils {
    public static final String ALPHABET_ALPHA_UPPER_EN = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static final String ALPHABET_ALPHA_LOWER_EN = "@abcdefghijklmnopqrstuvwxyz";

    public static final String ALPHABET_ALPHA_EN =
            ALPHABET_ALPHA_LOWER_EN +
            ALPHABET_ALPHA_UPPER_EN;

    public static final String ALPHABET_DIGITS_EN = "0123456789";
    public static final String ALPHABET_ZIPCODE_EN = "0123456789-";

    public static final String ALPHABET_PUNCTUATION_EN = "-,.";

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
    public static final String ALPHABET_PHONE_NUMBER = "-0123456789()+";
    public static final String ALPHABET_USERNAME_EN = ALPHABET_ALPHA_NUM_EN;

    /**
     * Checks if string has all its charachters in alphabet given.
     *
     * @param string String to be tested
     * @param alphabet Alphabet to match
     * @param wsAllowed specifies if whitespaces is allowed or not
     * @return boolean true if string supplied matches the rules and false
     * otherwise
     */
    public static boolean consistsOf(String string, String alphabet, boolean wsAllowed) {
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
     * @param string string to be checked
     * @param maxWords max words allower
     * @return boolean true if string contains less (or equal) than
     * maxWords and false otherwise.
     */
    public static boolean hasNotMoreWords(String string, int maxWords) {
        int wordCnt = 1;
        String chkString = string.trim();
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

    public static void main(String[] args) {
        String blabla = "bla bla";
        System.out.println(consistsOf(blabla, ALPHABET_ALPHA_EN, true));
        System.out.println(hasNotMoreWords(blabla, 1));
    }
}

package com.topcoder.web.email.bean;


import java.util.*;


/**

 * Common utilities used by the beans.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class Utilities {


    /**

     * This method checks if an e-mail address is valid.

     * Currently, an e-mail address is valid if it

     * contains a '@', there is text before the '@',

     * and there is text followed by a '.' followed

     * by more text after the '@'

     *

     * @return boolean	true if the address appears to be valid.

     */


    public static boolean isEmailAddressValid(String emailAddress) {

        boolean emailValid = true;


        if (emailAddress != null) {

            emailAddress = emailAddress.trim();


            int atIndex = emailAddress.indexOf("@");

            // make sure @ is not the first letter, and also not

            // one of the last three letters

            if (atIndex <= 0 || atIndex > (emailAddress.length() - 4)) {

                emailValid = false;

            } else {

                // make sure character after @ is not .

                if (emailAddress.charAt(atIndex + 1) == '.') {

                    emailValid = false;

                } else {

                    // make sure there's a . after that... and that dot

                    // is not the last character

                    int dotIndex = emailAddress.indexOf(".", atIndex + 2);

                    if (dotIndex == -1 || dotIndex == (emailAddress.length() - 1)) {

                        emailValid = false;

                    }

                }

            }

        }


        return emailValid;

    }


    /**

     * Tokenizes a String into a List of tokens using the specified delimiter(s).

     * The tokenization process assumes the String begins and ends with

     * tokens (so if the first character is a delimiter, the first token will

     * be considered an empty string, and if the last character is a delimiter,

     * the last token will be an empty string).  Consecutive delimiter characters

     * indicate that there's an empty string token between those delimiters.

     *

     * For example, if the delimiter is "/" and the string is "/hello///goodbye/",

     * the return value will be { "", "hello", "", "", "goodbye", "" }.

     *

     * @param str		the String to tokenize

     * @param delimiters	the String containing characters that are delimiters

     *

     * @return List		the List of tokens

     */


    public static List tokenize(String str, String delimiters) {

        List tokens = new ArrayList();


        StringTokenizer st = new StringTokenizer(str, delimiters, true);

        boolean delimiterExpected = false;


        while (st.hasMoreTokens()) {

            String token = st.nextToken();

            if (delimiters.indexOf(token) != -1) {

                // here's a delimiter

                if (!delimiterExpected) {

                    // here's a delimiter when we didn't expect one - so add an empty token

                    tokens.add("");

                } else {

                    // found a delimiter as expected... now look for a token

                    delimiterExpected = false;

                }

            } else {

                // here's a token

                tokens.add(token);

                delimiterExpected = true;

            }

        }

        // check if we were expecting one last token

        if (!delimiterExpected) {

            // the last character was a delimiter - so add an empty token

            tokens.add("");

        }


        return tokens;

    }

}
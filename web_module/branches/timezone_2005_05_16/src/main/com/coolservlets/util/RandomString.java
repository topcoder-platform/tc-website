/**
 * RandomString.java
 * Bill Lynch
 * CoolServlets.com
 * March 26, 1999
 * Version 1.0
 *
 *    Copyright (C) 1999  Bill Lynch
 *
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 2 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

package com.coolservlets.util;

/**
 * A class that generates random strings of letters and numbers.
 *
 * The class defaults to making a string of length five but can also generate
 * an arbitrary length string. This class is suitable for making low security
 * passwords or keys but may not be entirely secure since it depends on
 * Java's random method.
 *
 * @author  Bill Lynch
 * @version 1.0
 */
public class RandomString {
    public static String randomString() {
        return makeRandom(5);
    }

    public static String randomString(int numCharacters) {
        return makeRandom(numCharacters);
    }

    private static String makeRandom(int numChars) {
        String s = "";
        int d1, d2;
        char[] letters = initLetters();
        int[] numbers = initNumbers();

        for (int i = 0; i < numChars; i++) {
            d1 = ((int) (Math.random() * 10) % 2);
            if (d1 == 0) { // use a letter
                d2 = ((int) (Math.random() * 100) % 26);
                s += letters[d2];
            } else if (d1 == 1) { // use a number
                s += (int) (Math.random() * 10);
            }
        }
        return s;
    }

    private static char[] initLetters() {
        char[] ca = new char[26];
        for (int i = 0; i < 26; i++)
            ca[i] = (char) (65 + i);
        return ca;
    }

    private static int[] initNumbers() {
        int[] na = new int[10];
        for (int i = 0; i < 10; i++)
            na[i] = i;
        return na;
    }
}
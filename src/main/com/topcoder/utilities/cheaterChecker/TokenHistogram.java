package com.topcoder.utilities.cheaterChecker;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 *
 */
public class TokenHistogram {
    private HashMap histogram = null;

    private TokenHistogram() {

    }

    public TokenHistogram(List tokens) {
        String token = null;
        Bar bar = null;
        histogram = new HashMap(tokens.size() / 2);
        for (int i = 0; i < tokens.size(); i++) {
            token = (String) tokens.get(i);
            if (histogram.containsKey(token)) {
                bar = (Bar) histogram.get(token);
            } else {
                bar = new Bar(token);
            }
            bar.increment();
            histogram.put(token, bar);
        }
    }

    /**
     * figure out how difference two token histograms are.
     * we'll begin comparison at the high end and work our way down,
     * we'll only go as far as the histogram with fewer tokens allows.
     *
     * it might be useful to do common subsequences on the bars
     * instead of just direct comparison.
     *
     * @param other
     * @return
     */
    public int getDifference(TokenHistogram other) {
        Bar[] b1 = this.getHistogram();
        Bar[] b2 = other.getHistogram();
        Arrays.sort(b1);
        Arrays.sort(b2);
        int ret = 0;
        int len = Math.min(b1.length, b2.length);
        for (int i = 0; i < len; i++) {
            ret += b1[i].getDifference(b2[i]);
        }
        return ret;
    }

    private Bar[] getHistogram() {
        ArrayList a = new ArrayList(100);
        a.addAll(histogram.values());
        return (Bar[]) a.toArray(new Bar[0]);
    }

    private class Bar implements Comparable {
        String key = null;
        int length = 0;

        Bar(String key) {
            this.key = key;
        }

        /**
         * return the opposite so that we go in descending order
         * @param o
         * @return
         */
        public int compareTo(Object o) {
            Bar other = (Bar) o;
            return -1 * (new Integer(length).compareTo(new Integer(other.getLength())));
        }

        int getDifference(Bar other) {
            return Math.abs(other.getLength() - this.length);
        }

        String getKey() {
            return key;
        }

        int getLength() {
            return length;
        }

        void increment() {
            length++;
        }
    }
}

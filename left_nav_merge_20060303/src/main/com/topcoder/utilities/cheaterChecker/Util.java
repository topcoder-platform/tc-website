package com.topcoder.utilities.cheaterChecker;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.TreeSet;

public class Util {
    private static TreeSet javaTokens;

    public static List getNormalizedJavaTokens(String source) {
        StringTokenizer st = new StringTokenizer(source, "()[]{}.,:;*/-+<>!=#&|~", true);
        List tokens = new ArrayList();
        while (st.hasMoreTokens()) {
            String tok = st.nextToken();
            if ((tok.charAt(0) >= 'a' && tok.charAt(0) <= 'z') ||
                    (tok.charAt(0) >= 'A' && tok.charAt(0) <= 'Z'))
                if (!javaTokens.contains(tok)) tok = "a";
            tokens.add(tok);
        }
        return tokens;
    }

    public static List getJavaTokens(String source) {
        StringTokenizer st = new StringTokenizer(source, "()[]{}.,:;*/-+<>!=#&|~", true);
        List tokens = new ArrayList();
        while (st.hasMoreTokens()) {
            String tok = st.nextToken();
            if ((tok.charAt(0) >= 'a' && tok.charAt(0) <= 'z') ||
                    (tok.charAt(0) >= 'A' && tok.charAt(0) <= 'Z'))
                tokens.add(tok);
        }
        return tokens;
    }

    /**
     * Given two lists, determine the how many items they share in common.
     * the consecutive flag determines whether or not the items have to
     * be next to each other in the list when determining the output.
     * ie: if (consecutive) {a,b,c}, {a,e,b,c} return 2
     *     else return 3
     *
     * @param list1
     * @param list2
     * @param consecutive
     * @return
     */
    public static int getLongestCommonSubsequence(List list1, List list2, boolean consecutive) {
        int table[][] = new int[list1.size() + 1][list2.size() + 1];
        int i = 0;
        int k = 0;

        if (consecutive) {
            int m = 0;
            for (i = 0; i < list1.size(); i++) {
                for (k = 0; k < list2.size(); k++) {
                    if (list1.get(i).equals(list2.get(k))) {
                        table[i + 1][k + 1] = table[i][k] + 1;
                        m = Math.max(m, table[i + 1][k + 1]);
                    }
                }
            }
            return m;
        } else {
            for (i = 0; i < list1.size(); i++) {
                for (k = 0; k < list2.size(); k++) {
                    if ((list1.get(i).equals(list2.get(k))))
                        table[i + 1][k + 1] = table[i][k] + 1;
                    else
                        table[i + 1][k + 1] = max(table[i][k], table[i + 1][k], table[i][k + 1]);
                }
            }
            return table[i][k];
        }
    }


    public static int getLevenshteinDistance(List list1, List list2) {
        int table[][] = new int[list1.size() + 1][list2.size() + 1];
        int i, k = 0;

        for (i = 0; i <= list1.size(); i++)
            table[i][0] = i;
        for (i = 0; i <= list2.size(); i++)
            table[0][i] = i;
        for (i = 0; i < list1.size(); i++) {
            for (k = 0; k < list2.size(); k++) {
                if (list1.get(i).equals(list2.get(k)))
                    table[i + 1][k + 1] = table[i][k];
                else
                    table[i + 1][k + 1] = 1 + min(table[i][k], table[i + 1][k], table[i][k + 1]);
            }
        }

        return table[i][k];
    }

    public static double stddev(List values) {
        double sum = 0;
        double avg = avg(values);
        Result r = null;
        for (int i = 0; i < values.size(); i++) {
            r = (Result) values.get(i);
            sum += (r.getValue() - avg) * (r.getValue() - avg);
        }
        return Math.sqrt(sum / (values.size() - 1));
    }

    public static double avg(List values) {
        double sum = 0;
        Result r = null;
        for (int i = 0; i < values.size(); i++) {
            r = (Result) values.get(i);
            sum += r.getValue();
        }
        return sum / values.size();
    }

    /**
     * given three integers, return the largest
     * @param a
     * @param b
     * @param c
     * @return
     */
    private static int max(int a, int b, int c) {
        return Math.max(a, Math.max(b, c));
    }

    /**
     * given three integers, return the smallest
     * @param a
     * @param b
     * @param c
     * @return
     */
    private static int min(int a, int b, int c) {
        return Math.min(a, Math.min(b, c));
    }

    /**
     * given a number that indicated how many items
     * you have, return how many comparisons it would
     * take to compare every item to every other item.
     * x*(x-1)/2
     * @param n
     * @return
     */
    protected static int magic(int n) {
        if (n == 0)
            return 0;
        else if (n < 3)
            return 1;
        else
            return (n - 1) + magic(n - 1);
    }

    static {
        javaTokens = new TreeSet();
        javaTokens.add("abstract");
        javaTokens.add("boolean");
        javaTokens.add("break");
        javaTokens.add("byte");
        javaTokens.add("case");
        javaTokens.add("catch");
        javaTokens.add("chat");
        javaTokens.add("class");
        javaTokens.add("const");
        javaTokens.add("continue");
        javaTokens.add("default");
        javaTokens.add("do");
        javaTokens.add("double");
        javaTokens.add("else");
        javaTokens.add("extends");
        javaTokens.add("final");
        javaTokens.add("finally");
        javaTokens.add("float");
        javaTokens.add("for");
        javaTokens.add("goto");
        javaTokens.add("if");
        javaTokens.add("implemenjavaTokens");
        javaTokens.add("import");
        javaTokens.add("instanceof");
        javaTokens.add("int");
        javaTokens.add("interface");
        javaTokens.add("long");
        javaTokens.add("native");
        javaTokens.add("new");
        javaTokens.add("package");
        javaTokens.add("private");
        javaTokens.add("protected");
        javaTokens.add("public");
        javaTokens.add("return");
        javaTokens.add("short");
        javaTokens.add("static");
        javaTokens.add("strictfp");
        javaTokens.add("super");
        javaTokens.add("switch");
        javaTokens.add("synchronized");
        javaTokens.add("this");
        javaTokens.add("throw");
        javaTokens.add("throws");
        javaTokens.add("transient");
        javaTokens.add("try");
        javaTokens.add("void");
        javaTokens.add("volatile");
        javaTokens.add("while");
    }


}

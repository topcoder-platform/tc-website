package com.topcoder.utilities.fraudDetect;

import java.util.*;

public class JavaTokenizer {

    ArrayList tokens;
    static boolean init = false;
    static TreeSet ts;
    public boolean copyright;

    public JavaTokenizer(String s) {
        if (!init) {
            doInit();
        }
        tokens = new ArrayList();
        StringTokenizer st = new StringTokenizer(s);
        while (st.hasMoreTokens()) {
            addParse(st.nextToken());
        }
        copyright = false;
    }

    public void doInit() {
        ts = new TreeSet();
        ts.add("abstract");
        ts.add("boolean");
        ts.add("break");
        ts.add("byte");
        ts.add("case");
        ts.add("catch");
        ts.add("chat");
        ts.add("class");
        ts.add("const");
        ts.add("continue");
        ts.add("default");
        ts.add("do");
        ts.add("double");
        ts.add("else");
        ts.add("extends");
        ts.add("final");
        ts.add("finally");
        ts.add("float");
        ts.add("for");
        ts.add("goto");
        ts.add("if");
        ts.add("implements");
        ts.add("import");
        ts.add("instanceof");
        ts.add("int");
        ts.add("interface");
        ts.add("long");
        ts.add("native");
        ts.add("new");
        ts.add("package");
        ts.add("private");
        ts.add("protected");
        ts.add("public");
        ts.add("return");
        ts.add("short");
        ts.add("static");
        ts.add("strictfp");
        ts.add("super");
        ts.add("switch");
        ts.add("synchronized");
        ts.add("this");
        ts.add("throw");
        ts.add("throws");
        ts.add("transient");
        ts.add("try");
        ts.add("void");
        ts.add("volatile");
        ts.add("while");
        init = true;
    }

    int size() {
        return tokens.size();
    }

    void addParse(String s) {
        StringTokenizer st = new StringTokenizer(s, "()[]{}.,:;*/-+<>!=#&|~",
                true);
        while (st.hasMoreTokens()) {
            String tok = st.nextToken();
            copyright |= tok.equalsIgnoreCase("copyright");
            if ((tok.charAt(0) >= 'a' && tok.charAt(0) <= 'z') ||
                    (tok.charAt(0) >= 'A' && tok.charAt(0) <= 'Z'))
                if (!ts.contains(tok)) tok = "a";
            tokens.add(tok);
        }
    }

    int longestCommonSubstring(JavaTokenizer j) {
        int table[][] = new int[tokens.size() + 1][j.tokens.size() + 1];
        int i, k, m = 0;

        for (i = 0; i < tokens.size(); i++)
            for (k = 0; k < j.tokens.size(); k++)
                if (tokens.get(i).toString().equals(
                        j.tokens.get(k).toString())) {
                    table[i + 1][k + 1] = table[i][k] + 1;
                    m = Math.max(m, table[i + 1][k + 1]);
                }
        return m;
    }

    int longestCommonSubsequence(JavaTokenizer j) {
        int table[][] = new int[tokens.size() + 1][j.tokens.size() + 1];
        int i, k = 0;

        for (i = 0; i < tokens.size(); i++)
            for (k = 0; k < j.tokens.size(); k++) {
                table[i + 1][k + 1] = (tokens.get(i).toString().equals(
                        j.tokens.get(k).toString())) ? table[i][k] + 1 :
                        Math.max(table[i][k], Math.max(table[i + 1][k],
                                table[i][k + 1]));
            }
        return table[i][k];
    }

    int levinsteinDistance(JavaTokenizer j) {
        int table[][] = new int[tokens.size() + 1][j.tokens.size() + 1];
        int i, k = 0;

        for (i = 0; i <= tokens.size(); i++)
            table[i][0] = i;
        for (i = 0; i <= j.tokens.size(); i++)
            table[0][i] = i;
        for (i = 0; i < tokens.size(); i++)
            for (k = 0; k < j.tokens.size(); k++) {
                table[i + 1][k + 1] = (tokens.get(i).toString().equals(
                        j.tokens.get(k).toString())) ? table[i][k] :
                        1 + Math.min(table[i][k], Math.min(table[i + 1][k],
                                table[i][k + 1]));
            }
        return table[i][k];
    }
}

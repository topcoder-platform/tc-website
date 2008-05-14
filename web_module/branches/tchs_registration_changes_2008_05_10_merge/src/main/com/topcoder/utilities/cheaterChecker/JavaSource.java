package com.topcoder.utilities.cheaterChecker;

import java.util.List;

public class JavaSource implements TokenizedSource {
    private List tokens = null;

    private JavaSource() {
    }

    public JavaSource(String s) {
        tokens = Util.getJavaTokens(s);
    }

    public List getTokens() {
        return tokens;
    }

}

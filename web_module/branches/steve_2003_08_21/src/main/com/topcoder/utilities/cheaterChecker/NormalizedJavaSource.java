package com.topcoder.utilities.cheaterChecker;

import java.util.List;

public class NormalizedJavaSource implements TokenizedSource {
    private List tokens = null;
    private NormalizedJavaSource() {

    }
    public NormalizedJavaSource(String s) {
        tokens = Util.getNormalizedJavaTokens(s);
    }

    public List getTokens() {
        return tokens;
    }

}

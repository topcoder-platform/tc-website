/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.authentication.strategies.impl;

import java.util.Date;
import java.util.Random;

import com.topcoder.reg.authentication.strategies.TokenGenerator;

/**
 * <p>A simple token generator.</p>
 *
 * Version 1.0 (Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
 * Copy this class from the trunk branch
 *
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class SimpleTokenGenerator implements TokenGenerator {

    /**
     * <p>The look up table to construct a token.</p>
     */
    private final String charSheet;

    /**
     * <p>The constructor who will initiate the field<code>charSheet<code>. </p>
     */
    public SimpleTokenGenerator() {
        StringBuffer chars = new StringBuffer();
        for (char a = 'a'; a <= 'z'; a++) {
            chars.append(a);
        }
        for (char a = 'A'; a <= 'Z'; a++) {
            chars.append(a);
        }
        for (char a = '0'; a <= '9'; a++) {
            chars.append(a);
        }
        charSheet = chars.toString();
    }

    /**
     * <p>The method to generate a token.</p>
     * @return a token.
     */
    public String generate() {
        StringBuffer token = new StringBuffer();
        Random random = new Random(new Date().getTime());
        for (int i = 0; i < 6; i++) {
            token.append(charSheet.charAt(random.nextInt(charSheet.length())));
        }
        return token.toString();
    }

}

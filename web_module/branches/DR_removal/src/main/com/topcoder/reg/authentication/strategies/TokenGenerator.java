/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.authentication.strategies;

/**
 * <p>This interface declares the token generator.</p>
 *
 * Version 1.0 (Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
 * Copy this class from the trunk branch
 *
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public interface TokenGenerator {
    /**
     * <p>The method to generate a token.</p>
     * @return a token.
     */
    public String generate();
}

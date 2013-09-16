/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication.strategies;

/**
 * <p>This interface declares the token generator.</p>
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

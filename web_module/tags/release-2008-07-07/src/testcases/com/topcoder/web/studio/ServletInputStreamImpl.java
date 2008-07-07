/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import javax.servlet.ServletInputStream;
import java.io.InputStream;
import java.io.IOException;

/**
 * <p>A helper class providing the default implementation of {@link ServletInputStream} functionality to be used
 * for testing purposes.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly
 */
public class ServletInputStreamImpl extends ServletInputStream {

    /**
     * <p>An <code>InputStream</code> providing the content of this servlet stream.</p>
     */
    private InputStream input = null;

    /**
     * <p>Constructs new <code>SubmitTestCase$ServletInputStreamImpl</code> instance with specified content.</p>
     *
     * @param input an <code>InputStream</code> providing the content of this stream.
     */
    public ServletInputStreamImpl(InputStream input) {
        this.input = input;
    }

    /**
     * <p>Reads the next byte of data from the input stream.</p>
     *
     * @return the next byte of data, or <code>-1</code> if the end of the stream is reached.
     * @throws IOException if an I/O error occurs.
     */
    public int read() throws IOException {
        return this.input.read();
    }
}

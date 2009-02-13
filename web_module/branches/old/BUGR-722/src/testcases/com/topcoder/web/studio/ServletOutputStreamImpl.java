/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * <p>A helper class providing the default implementation of {@link ServletOutputStream} functionality to be used
 * for testing purposes.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly
 */
public class ServletOutputStreamImpl extends ServletOutputStream {

    /**
     * <p>An <code>InputStream</code> providing the content of this servlet stream.</p>
     */
    private OutputStream out = null;

    /**
     * <p>Constructs new <code>SubmitTestCase$ServletInputStreamImpl</code> instance with specified destination to write
     * the written content to.</p>
     *
     * @param out an <code>OutputStream</code> providing the content of this stream.
     */
    public ServletOutputStreamImpl(OutputStream out) {
        this.out = out;
    }

    /**
     * <p>Writes the specified byte to this output stream.</p>
     *
     * @param b the <code>byte</code>.
     * @throws IOException if an I/O error occurs.
     */
    public void write(int b) throws IOException {
        this.out.write(b);
    }
}

package com.topcoder.shared.docGen.xml.xsl;

/**
 * XSLTransformerWrapperException.java
 * We dont use this class because it would hide the meat of the stack
 * trace that we need to find out the line number of the problem in the
 * xsl file.  With 1.4 this can be fixed, but we'll have to wait.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class XSLTransformerWrapperException
    extends Exception
{
    public XSLTransformerWrapperException()
    {
        super();
    }

    public XSLTransformerWrapperException(String message)
    {
        super(message);
    }

    public XSLTransformerWrapperException(Throwable t)
    {
        super(t.getMessage());
    }
}

package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.*;

import java.io.*;

/**
 * The <code>Element</code> class is an abstraction of the notion of a problem statement ``element.''
 * An element is an entity that has the following properties:
 *
 * <ul>
 *  <li>Is serializable, with only client-side dependencies
 *  <li>Can generate an XML String describing itself
 * </ul>
 *
 * @author Logan Hanks
 */
public interface Element extends Serializable, Cloneable, CustomSerializable {
    void customWriteObject(CSWriter writer)
            throws IOException;

    void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException;

    /**
     * An <code>Element</code> must be cable of transforming the information it represents
     * into well-formed, valid XML (validated against the problem statement schema).
     *
     * @return A fragment of XML
     */
    String toXML();

    void setRenderer(ElementRenderer renderer);

    ElementRenderer getRenderer();
}

package com.topcoder.shared.problem;

import com.topcoder.shared.language.Language;

import com.topcoder.shared.netCommon.CustomSerializable;
import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;
import java.io.Serializable;

/**
 * The <code>Element</code> class is an abstraction of the notion of a problem statement ``element.''
 * An element is an entity that has the following properties:
 *
 * <ul>
 *  <li>Is serializable, with only client-side dependencies
 *  <li>Can generate an XML String describing itself
 *  <li>Can transform itself to language-specific HTML
 * </ul>
 *
 * @author Logan Hanks
 */
public interface Element
    extends Serializable, Cloneable, CustomSerializable
{
    public void customWriteObject(CSWriter writer)
        throws IOException;

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException;

    /**
     * An <code>Element</code> must be capable of transforming the information it represents
     * into a language-specific HTML fragment.
     *
     * @param language  The language for which the HTML fragment should be generated.  E.g., if the
     *                  language is C++, references to array types should be presented as vector
     *                  template instantiations (a transformation the <code>Language</code> object
     *                  is intended to perform).
     * @return A fragment of language-specific HTML
     * @see Language
     */
    public String toHTML(Language language);

    /**
     * An <code>Element</code> must be cable of transforming the information it represents
     * into well-formed, valid XML (validated against the problem statement schema).
     *
     * @return A fragment of XML
     */
    public String toXML();

    public String toPlainText(Language language);
}


package com.topcoder.shared.problem;

import com.topcoder.shared.language.Language;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/**
 * A <code>NodeElement</code> represents an XML element.  It has a name, a (possibly empty) set
 * of attributes, and a sequence of children that consists of any number of <code>Elements</code>.
 * This structure is necessary so that we do not lose the structure of writer-submitted text, so
 * that we can treat the <code>type</code> element properly, for instance.
 *
 * @see com.topcoder.server.common.problem.NodeElementFactory
 */
public class NodeElement
    implements Element
{
    private String name;
    private HashMap attributes;
    private ArrayList children;
    private String text;

    public NodeElement()
    {
    }

    /**
     * @param name          The name of the element
     * @param attributes    A mapping of attribute names to attribute values
     * @param children      A sequence of elements that are children of the element
     * @param text          An XML fragment corresponding to the content of this element
     */
    public NodeElement(String name, HashMap attributes, ArrayList children, String text)
    {
        this.name = name;
        this.attributes = attributes;
        this.children = children;
        this.text = text;
    }

    public void customWriteObject(CSWriter writer)
        throws IOException
    {
        writer.writeString(name);
        writer.writeHashMap(attributes);
        writer.writeArrayList(children);
        writer.writeString(text);
    }

    public void customReadObject(CSReader reader)
        throws IOException, ObjectStreamException
    {
        name = reader.readString();
        attributes = reader.readHashMap();
        children = reader.readArrayList();
        text = reader.readString();
    }

    String getText()
    {
        return text;
    }

    ArrayList getChildren()
    {
        return children;
    }

    String toMarkup(Language language)
    {
        StringBuffer buf = new StringBuffer(64 * children.size());

        buf.append('<');
        buf.append(name);
        for(Iterator i = attributes.keySet().iterator(); i.hasNext(); ) {
            String key = (String)i.next();

            buf.append(' ');
            buf.append(key);
            buf.append("=\"");
            buf.append(ProblemComponent.encodeHTML((String)attributes.get(key)));
            buf.append('"');
        }
        buf.append('>');
        for(int i = 0; i < children.size(); i++) {
            Element e = (Element)children.get(i);

            if(language == null)
                buf.append(e.toXML());
            else
                buf.append(e.toHTML(language));
        }
        buf.append("</");
        buf.append(name);
        buf.append('>');
        return buf.toString();
    }

    public String toHTML(Language language)
    {
        return toMarkup(language);
    }

    public String toXML()
    {
        return toMarkup(null);
    }
}



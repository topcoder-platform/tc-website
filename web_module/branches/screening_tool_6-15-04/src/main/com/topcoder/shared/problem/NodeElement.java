package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;
import java.util.*;

/**
 * A <code>NodeElement</code> represents an XML element.  It has a name, a (possibly empty) set
 * of attributes, and a sequence of children that consists of any number of <code>Elements</code>.
 * This structure is necessary so that we do not lose the structure of writer-submitted text, so
 * that we can treat the <code>type</code> element properly, for instance.
 */
public class NodeElement extends BaseElement implements Element {
    private String name;
    private HashMap attributes;
    private ArrayList children;
    private String text;

    public NodeElement() {
    }

    /**
     * @param name          The name of the element
     * @param attributes    A mapping of attribute names to attribute values
     * @param children      A sequence of elements that are children of the element
     * @param text          An XML fragment corresponding to the content of this element
     */
    public NodeElement(String name, HashMap attributes, ArrayList children, String text) {
        this.name = name;
        this.attributes = attributes;
        this.children = children;
        this.text = text;
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeString(name);
        writer.writeHashMap(attributes);
        writer.writeArrayList(children);
        writer.writeString(text);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        name = reader.readString();
        attributes = reader.readHashMap();
        children = reader.readArrayList();
        text = reader.readString();
    }

    public String getText() {
        return text;
    }

    public HashMap getAttributes() {
        return attributes;
    }

    public String getName() {
        return name;
    }

    public ArrayList getChildren() {
        return children;
    }

    public String toXML() {
/*
        com.topcoder.shared.language.Language language = null;

        StringBuffer buf = new StringBuffer(64 * children.size());
        boolean print = true;

        if(language == null || print)
        {
          buf.append('<');
          buf.append(name);
          for(Iterator i = attributes.keySet().iterator(); i.hasNext(); ) {
              String key = (String)i.next();
   
              buf.append(' ');
              buf.append(key);
              buf.append("=\"");
              buf.append(BaseRenderer.encodeHTML((String)attributes.get(key)));
              buf.append('"');
          }
          buf.append('>');
        }
        for(int i = 0; i < children.size(); i++) {
            Element e = (Element)children.get(i);

            if(language == null)
                buf.append(e.toXML());
            else
                buf.append(e.toHTML(language));
        }
        if(language == null || print)
        {
          buf.append("</");
          buf.append(name);
          buf.append('>');
        }
        return buf.toString();
*/


        StringBuffer buf = new StringBuffer(64 * children.size());

        buf.append('<');
        buf.append(name);
        for (Iterator i = attributes.keySet().iterator(); i.hasNext();) {
            String key = (String) i.next();

            buf.append(' ');
            buf.append(key);
            buf.append("=\"");
            buf.append(ProblemComponent.encodeHTML((String) attributes.get(key)));
            buf.append('"');
        }
        buf.append('>');
        for (int i = 0; i < children.size(); i++) {
            Element e = (Element) children.get(i);
            buf.append(e.toXML());
        }
        buf.append("</");
        buf.append(name);
        buf.append('>');
        return buf.toString();

    }

}



package com.topcoder.shared.problemParser;

import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.problem.DataTypeFactory;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.InvalidTypeException;
import com.topcoder.shared.problem.NodeElement;
import com.topcoder.shared.problem.TextElement;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.NamedNodeMap;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * This factory can build <code>Element</code>s from arbitrary node-sets, corresponding
 * to structured text.  That is, the intro and spec sections, or the contents of notes,
 * user constraints, and annotations in general.
 *
 * @see Element
 * @author Logan Hanks
 */
public class NodeElementFactory
{
    /**
     * Builds an <code>Element</code> appropriate for the given node-set.
     *
     * @param node  The node-set specifying the element
     * @see Element
     */
    static public Element build(Node node)
    {
        if(node.getNodeType() != node.ELEMENT_NODE)
            return new TextElement(node.getNodeValue());

        String name = node.getNodeName();
        HashMap attributes = new HashMap();
        ArrayList children = new ArrayList();
        StringBuffer text = new StringBuffer(128);
 
        NamedNodeMap map = node.getAttributes();
 
        for(int i = 0; i < map.getLength(); i++) {
            Node n = map.item(i);
  
            attributes.put(n.getNodeName(), n.getNodeValue());
        }
 
        NodeList nl = node.getChildNodes();
 
        for(int i = 0; i < nl.getLength(); i++) {
            Node n = nl.item(i);
 
            if(n.getNodeType() == n.ELEMENT_NODE) {
                if(n.getNodeName().equals(ProblemComponentFactory.TYPE)) {
                    try {
                        DataType type = DataTypeFactory.getDataType(n.getFirstChild().getNodeValue());

                        children.add(type);
                    } catch(InvalidTypeException ex) {
                    }
                } else
                    children.add(build(n));
            } else
                children.add(new TextElement(n.getNodeValue()));
            text.append(n.getNodeValue());
        }

        return new NodeElement(name, attributes, children, text.toString());
    }
}


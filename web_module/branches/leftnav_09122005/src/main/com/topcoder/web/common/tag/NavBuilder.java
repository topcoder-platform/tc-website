package com.topcoder.web.common.tag;

import com.topcoder.web.common.model.NavTree;
import com.topcoder.web.common.model.NavNode;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.util.Iterator;
import java.util.Set;
import java.util.HashSet;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 20, 2005
 */
public class NavBuilder extends TagSupport {
    private static final Logger log = Logger.getLogger(NavBuilder.class);
    private NavTree nav = null;
    private String selectedNode = null;
    private String openClass = null;
    private String selectedClass = null;

    public void setNavTree(String navTree) {
        this.nav = (NavTree)pageContext.findAttribute(navTree);
    }

    public void setSelectedNode(String selectedNode) {
        this.selectedNode = selectedNode;
    }

    public void setOpenClass(String openClass) {
        this.openClass = openClass;
    }

    public void setSelectedClass(String selectedClass) {
        this.selectedClass = selectedClass;
    }

    public int doStartTag() throws JspException {
        try {
            NavNode root;
            NavNode selectedNode;
            pageContext.getOut().print("\n<ul>");
            for(Iterator it = nav.getRoots(); it.hasNext();) {
                root = (NavNode)it.next();
                selectedNode = root.search(this.selectedNode);

                HashSet path = new HashSet(5);
                if (selectedNode!=null) {
                    for (NavNode node = selectedNode.getParent(); node!=null; node = node.getParent()) {
                        path.add(node.getKey());
                    }
                }

                printOutput(root, path);
            }
            pageContext.getOut().print("</ul>\n");

        } catch (Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }

    private void printOutput(NavNode node, Set parents) throws IOException {
        JspWriter out = pageContext.getOut();
        out.print("\n<li>");
        if (node.isLink()&&node.isLeaf()) {
            out.print("<a href=\"");
            out.print(node.getHref());
            out.print("\"");
            out.print(" class=\"");
            out.print(selectedClass);
            out.print("\"");
            out.print(">");
            out.print(node.getContents());
            out.print("</a>");
        } else {
            out.print(node.getContents());
        }
        if (!node.isLeaf() && !node.getKey().equals(selectedNode)) {
            out.print("\n<ul id=\"");
            out.print(node.getKey());
            out.print("\"");
            if (parents.contains(node.getKey())) {
                out.print(" class=\"");
                out.print(openClass);
                out.print("\"");
            }
            out.print(">");
            for (int i=0; i<node.getChildCount(); i++) {
                printOutput(node.getChildAt(i), parents);
            }
            out.print("\n</ul>");
        }
        out.print("</li>");

    }

    /**
     * Because the app server (JBoss) is caching the tag,
     * we have to clear out all the instance variables at the
     * end of execution.
     */
    public int doEndTag() throws JspException {
        this.nav = null;
        this.selectedNode = null;
        this.openClass = null;
        this.selectedClass = null;
        return super.doEndTag();
    }


}

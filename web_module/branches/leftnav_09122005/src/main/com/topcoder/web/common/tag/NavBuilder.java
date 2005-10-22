package com.topcoder.web.common.tag;

import com.topcoder.web.common.model.NavTree;
import com.topcoder.web.common.model.NavNode;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.util.Iterator;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 20, 2005
 */
public class NavBuilder extends TagSupport {
    private NavTree nav = null;
    private String selectedNode = null;

    public void setNavTree(String navTree) {
        this.nav = (NavTree)pageContext.findAttribute(navTree);
    }

    public void setSelectedNode(String selectedNode) {
        this.selectedNode = selectedNode;
    }

    public int doStartTag() throws JspException {
        try {
            NavNode root;
            NavNode selectedNode;
            pageContext.getOut().print("<ul>");
            for(Iterator it = nav.getRoots(); it.hasNext();) {
                root = (NavNode)it.next();
                selectedNode = root.search(this.selectedNode);
                printOutput(root, selectedNode!=null);
            }
            pageContext.getOut().print("</ul>\n");

        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    private void printOutput(NavNode node, boolean descend) throws IOException {

        JspWriter out = pageContext.getOut();
        out.print("<li>");
        out.print(node.getContents());
        if (descend && !node.isLeaf() && !node.getKey().equals(selectedNode)) {
            out.print("<ul id=\"");
            out.print(node.getKey());
            out.print("\">");
            for (int i=0; i<node.getChildCount(); i++) {
                //don't descend if the node we're working with is the selected one.  just show it's siblings
                printOutput(node.getChildAt(i), !node.getChildAt(i).getKey().equals(selectedNode));
            }
            out.print("</ul>\n");
        }
        out.print("</li>\n");

    }

    /**
     * Because the app server (JBoss) is caching the tag,
     * we have to clear out all the instance variables at the
     * end of execution.
     */
    public int doEndTag() throws JspException {
        this.nav = null;
        this.selectedNode = null;
        return super.doEndTag();
    }


}

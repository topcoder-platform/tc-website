package com.topcoder.web.common.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.NavNode;
import com.topcoder.web.common.model.NavTree;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 62270 $ $Date$
 *          Create Date: Oct 20, 2005
 */
public class NavBuilder extends TagSupport {
    private static final Logger log = Logger.getLogger(NavBuilder.class);
    private NavTree nav = null;
    private String selectedNode = "";
    private String openClass = null;
    private String selectedLeafClass = null;
    private String selectedParentClass = null;
    private String unSelectedLeafClass = null;
    private String unSelectedParentClass = null;

    public void setNavTree(String navTree) {
        this.nav = (NavTree) pageContext.findAttribute(navTree);
    }

    public void setSelectedNode(String selectedNode) {
        if (selectedNode != null) {
            this.selectedNode = selectedNode;
        }
    }

    public void setOpenClass(String openClass) {
        this.openClass = openClass;
    }

    public void setSelectedLeafClass(String selectedLeafClass) {
        this.selectedLeafClass = selectedLeafClass;
    }

    public void setSelectedParentClass(String selectedParentClass) {
        this.selectedParentClass = selectedParentClass;
    }

    public void setUnSelectedLeafClass(String unSelectedLeafClass) {
        this.unSelectedLeafClass = unSelectedLeafClass;
    }

    public void setUnSelectedParentClass(String unSelectedParentClass) {
        this.unSelectedParentClass = unSelectedParentClass;
    }

    public int doStartTag() throws JspException {
        try {
            NavNode root;
            NavNode selectedNode;
            pageContext.getOut().print("\n<ul>");
            for (Iterator it = nav.getRoots(); it.hasNext();) {
                root = (NavNode) it.next();
                selectedNode = root.search(this.selectedNode);

                HashSet path = new HashSet(5);
                if (selectedNode != null) {
                    for (NavNode node = selectedNode.getParent(); node != null; node = node.getParent()) {
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
        String serverUrl = "http://"+(pageContext==null?"null":pageContext.getRequest().getServerName());
/*
        if (log.isDebugEnabled()) {
            log.debug("serverUrl " + serverUrl);
        }
*/

        JspWriter out = pageContext.getOut();
        out.print("\n<li");
        if (node.isLink() && node.isLeaf()) {
            if (selectedNode.equals(node.getKey())) {
                out.print(" class=\"");
                out.print(selectedLeafClass);
                out.print("\"");
            } else if (unSelectedLeafClass != null) {
                out.print(" class=\"");
                out.print(unSelectedLeafClass);
                out.print("\"");
            }
            out.print(">");//close the li
            //log.debug("leaf link " + node.getKey());
            out.print("<a href=\"");
/*
            if (log.isDebugEnabled()) {
                log.debug("href " + node.getHref());
            }
*/
            if (node.getHref().toLowerCase().startsWith(serverUrl.toLowerCase())) {
                out.print(node.getHref().substring(serverUrl.length()));
            } else {
                out.print(node.getHref());
            }
            out.print("\"");
            if (node.getOnClick() != null) {
                out.print(" \"");
                out.print(node.getOnClick());
                out.print("\"");
            }
            out.print(">");
            out.print(node.getContents());
            out.print("</a>");
        } else if (!node.isLink()) {
            out.print(">");//close the li
            //log.debug("not link " + node.getKey());
            out.print(node.getContents());
        } else {
            if (parents.contains(node.getKey()) || selectedNode.equals(node.getKey())) {
                out.print(" class=\"");
                out.print(selectedParentClass);
                out.print("\"");
            } else {
                out.print(" class=\"");
                out.print(unSelectedParentClass);
                out.print("\"");
            }
            out.print(">");//close the li
            //log.debug("link not leaf " + node.getKey());
            //is link and not leaf
            out.print("<a href=\"");
/*
            if (log.isDebugEnabled()) {
                log.debug("href " + node.getHref());
            }
*/
            if (node.getHref().toLowerCase().startsWith(serverUrl.toLowerCase())) {
                out.print(node.getHref().substring(serverUrl.length()));
            } else {
                out.print(node.getHref());
            }
            out.print("\"");
            if (node.getOnClick() != null) {
                out.print(" onclick=\"");
                out.print(node.getOnClick());
                out.print("\"");
            }
            out.print(">");
            out.print(node.getContents());
            out.print("</a>");

            out.print("\n<ul id=\"");
            out.print(node.getKey());
            out.print("\"");
            if (parents.contains(node.getKey()) || selectedNode.equals(node.getKey())) {
                out.print(" class=\"");
                out.print(openClass);
                out.print("\"");
            }
            out.print(">");
            for (int i = 0; i < node.getChildCount(); i++) {
                //log.debug("there are " + node.getChildCount() + " childer of " + node.getKey());
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
        this.selectedNode = "";
        this.openClass = null;
        this.selectedLeafClass = null;
        this.selectedParentClass = null;
        this.unSelectedLeafClass = null;
        this.unSelectedParentClass = null;
        return super.doEndTag();
    }


}

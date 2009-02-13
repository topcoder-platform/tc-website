package com.topcoder.common.web.data.report;

import com.topcoder.common.web.data.TreeNode;


public class ReportNode extends TreeNode {

    public ReportNode() {
        super();
    }

    public ReportNode(Report report) {
        super(report);
    }

    public ReportNode(String string) {
        super(string);
    }

    public Report findReport(Integer id) {
        return findReport(this, id);
    }

    private Report findReport(ReportNode node, Integer id) {
        ReportNode child = null;
        Report report = null;
        Report result = null;
        for (int i = 0; i < node.getChildCount() && result == null; i++) {
            child = (ReportNode) node.getChildAt(i);
            if (child.getContents() instanceof Report) {
                report = (Report) child.getContents();
                if (report.getId().compareTo(id) == 0)
                    result = report;
                else if (!child.isLeaf())
                    result = findReport(child, id);
            } else if (!child.isLeaf()) {
                result = findReport(child, id);
            }
        }
        return result;
    }

    public String toString() {
        return getContents().toString();
    }

}


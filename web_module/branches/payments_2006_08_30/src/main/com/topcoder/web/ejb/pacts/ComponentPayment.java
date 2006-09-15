package com.topcoder.web.ejb.pacts;

/**
 * Payment for a component contest.  It includes a reference to a project.
 * 
 * @author cucu
 *
 */
public class ComponentPayment extends BasePayment {
	private long projectId;

	public ComponentPayment(long id, long coderId, long projectId) {
		super(id, coderId);
		this.projectId = projectId;
	}

	public long getProjectId() {
		return projectId;
	}
}

package com.topcoder.web.ejb.pacts;

/**
 * Payment for a component contest.  It includes a reference to a project.
 * 
 * @author cucu
 *
 */
public abstract class ComponentPayment extends BasePayment {
	private long projectId;

	public ComponentPayment(long coderId, double grossAmount, long projectId) {
		super(coderId, grossAmount);
		this.projectId = projectId;
	}

	public long getProjectId() {
		return projectId;
	}
}

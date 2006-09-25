package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for a component that includes a reference to a project.
 * 
 * @author cucu
 *
 */
public abstract class ComponentProjectReferencePayment extends BasePayment {
	private long projectId;
	private String client = null;
	
	public ComponentProjectReferencePayment(long coderId, double grossAmount, long projectId) {
		this(coderId, grossAmount, null, projectId);		
	}

	protected ComponentProjectReferencePayment(long coderId, double grossAmount, long projectId, int placed) {
		this(coderId, grossAmount, null, projectId, placed);
	}

	public ComponentProjectReferencePayment(long coderId, double grossAmount, String client, long projectId) {
		super(coderId, grossAmount);
		this.projectId = projectId;
		this.client = client;
	}

	protected ComponentProjectReferencePayment(long coderId, double grossAmount, String client, long projectId, int placed) {
		super(coderId, grossAmount, placed);
		this.projectId = projectId;
		this.client = client;
	}

	protected void fillPaymentReference(Payment p) {
		p.getHeader().setComponentProjectId(getProjectId());	
		p.getHeader().setClient(getClient());
	}
	
	public long getProjectId() {
		return projectId;
	}
	
	public String getClient() {
		return client;
	}
	
	protected static abstract class Processor extends BasePayment.Processor {
		private String componentName = null;
		private String projectType = null;
		private Date completeDate = null;

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return getCompleteDate((ComponentProjectReferencePayment) payment);
		}	

		private void lookupData(ComponentProjectReferencePayment payment) throws SQLException {
	        StringBuffer query = new StringBuffer(300);
	        query.append("SELECT cc.component_name, p.complete_date, p.project_type_id ");
	        query.append("FROM project p, comp_versions cv, comp_catalog cc ");
	        query.append("WHERE p.comp_vers_id = cv.comp_vers_id ");
	        query.append("AND cv.component_id = cc.component_id ");
	        query.append("AND p.project_id = " + payment.getProjectId() + " ");
	        query.append("AND p.cur_version = 1");
	        ResultSetContainer rsc = runSelectQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query.toString());
	        
	        if (rsc.getRowCount() != 1) {
	            throw new IllegalArgumentException("Project " + payment.getProjectId() + " does not exist or is not unique");
	        }
	        
	        componentName = rsc.getStringItem(0, "component_name");
	        completeDate =  rsc.getItem(0, "complete_date") == null? new Date() : rsc.getTimestampItem(0, "complete_date");
	        projectType = rsc.getIntItem(0, "project_type_id") == 1? "Design" : "Development";
		}

		protected Date getCompleteDate(ComponentProjectReferencePayment payment) throws SQLException {
			if (completeDate == null) {
				lookupData(payment);
			}
			return completeDate;
		}

		protected String getComponentName(ComponentProjectReferencePayment payment) throws SQLException {
			if (componentName == null) {
				lookupData(payment);
			}
			return componentName;
		}

		protected String getProjectType(ComponentProjectReferencePayment payment) throws SQLException {
			if (projectType == null) {
				lookupData(payment);
			}
			return projectType;
		}
		
	}

}

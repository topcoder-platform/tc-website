package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment that references another payment as the parent.
 * 
 * @author cucu
 *
 */
public abstract class ParentReferencePayment extends BasePayment {
	private long parentId;

	public ParentReferencePayment(long coderId, double grossAmount, long parentId) {
		super(coderId, grossAmount);
		this.parentId = parentId;
	}

	public long getParentId() {
		return parentId;
	}
	
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setParentPaymentId(getParentId());
	}
	
	
	protected static abstract class Processor extends BasePayment.Processor {
		private String paymentDesc = null;
		private String referredCoder = null;

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return new Date();
		}

		protected String getPaymentDesc(ParentReferencePayment payment) throws SQLException {
			if (paymentDesc == null) {
				lookupData(payment);
			}
			return paymentDesc;
		}

		protected String getReferredCoder(ParentReferencePayment payment) throws SQLException {
			if (referredCoder == null) {
				lookupData(payment);
			}
			return referredCoder;
		}


		private void lookupData(ParentReferencePayment payment) throws SQLException {
			StringBuffer query = new StringBuffer(300);
			
			query.append(" SELECT pd.payment_desc, u.handle FROM "); 
			query.append(" payment p, payment_Detail pd, payment_detail_xref x, user u ");
			query.append(" WHERE p.payment_id  = x.payment_id  ");
			query.append(" AND x.payment_detail_id = pd.payment_detail_id "); 
			query.append(" AND p.most_recent_detail_id = pd.payment_detail_id "); 
			query.append(" AND u.user_id = p.user_id ");
			query.append(" AND p.payment_id = " + payment.getParentId());
			
			ResultSetContainer rsc = runSelectQuery(query.toString());
			
			if (rsc.getRowCount() != 1) {
				throw new IllegalArgumentException("Not exactly 1 row returned for payment_id=" + payment.getParentId());
			}
			
			paymentDesc = rsc.getStringItem(0, "payment_desc");
			referredCoder = rsc.getStringItem(0, "referred_coder");
		}
		
	}
}

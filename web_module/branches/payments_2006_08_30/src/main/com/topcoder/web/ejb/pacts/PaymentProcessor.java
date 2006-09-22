package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.SQLException;

public abstract class PaymentProcessor {

	protected abstract void fillData(Connection c) throws SQLException;
	
}

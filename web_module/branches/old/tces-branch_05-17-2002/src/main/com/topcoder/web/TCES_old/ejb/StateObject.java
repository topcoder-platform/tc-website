package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the state table.
 * @see com.topcoder.web.TCES.ejb.State
 * @author Phil Selby, May 22nd, 2002
 */

public class StateObject 
  implements Serializable {
	public String	state_code;
	public String	state_name;
	public String	region_code;
	public Integer	demographic_decline;
}

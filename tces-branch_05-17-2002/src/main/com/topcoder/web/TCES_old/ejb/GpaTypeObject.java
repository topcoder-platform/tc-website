package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the gpa_type table.
 * @see com.topcoder.web.TCES.ejb.GpaType
 * @author Phil Selby, May 22nd, 2002
 */

public class GpaTypeObject 
  implements Serializable {
	public Integer	gpa_type_id;
	public String	gpa_type_desc;
	public Integer	gpa_type_value;
}

package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the gpa table.
 * @see com.topcoder.web.TCES.ejb.Gpa
 * @author Phil Selby, May 22nd, 2002
 */

public class GpaObject 
  implements Serializable {
	public Integer	gpa_id;
	public Integer	gpa_type_id;
	public String	gpa_desc;
	public Integer	gpa_value;
}

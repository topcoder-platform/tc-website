package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the organization_size_lu table.
 * @see com.topcoder.web.TCES.ejb.OrganizationSizeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class OrganizationSizeLuObject 
  implements Serializable {
	public Integer	organization_size_id;
	public String	organization_size_desc;
}

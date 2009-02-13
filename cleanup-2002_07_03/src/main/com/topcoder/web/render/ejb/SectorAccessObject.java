package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class SectorAccessObject 
  implements Serializable {
	public Integer	sector_id;
	public Integer	user_id;
	public Date	access;
	public String	authorized;
}

package com.topcoder.web.tc.controller.request.data;

import java.io.IOException;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletOutputStream;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.datafeed.CommandRunner;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author geldridge
 * @version $Revision$ Date: 2008/04/15 00:00:00
 *          Create Date: Apr 15, 2008
 */
public class DistanceFeed extends Base {

	class Coder { 
		public String ID = null;
		public String handle = null;
		public int rating = 0;
		public Vector dist = new Vector();
		public String desc = "";
		public int overlap;
		
		public Coder(String ID, String handle, int rating)
		{
			this.ID = ID;
			this.handle = handle;
			this.rating = rating;
		}
	}
	
    protected void businessProcessing() throws Exception {
    	Vector<Coder> them = getOverlapCoders();
    	Coder me = getOverlapMe();
                
        CoderOverlap co = new CoderOverlap(me, them);
        
        int tflag = Integer.parseInt(getRequest().getParameter("tf"));
        int cflag = Integer.parseInt(getRequest().getParameter("cf"));
        
        co.process(tflag, cflag);
        
        getResponse().setContentType("text/xml");
        writeAsXML(me, them);
        getResponse().flushBuffer();
    }
	
    private void writeAsXML(Coder first, Vector<Coder> v)	
	{
    	try { 
			ServletOutputStream os = getResponse().getOutputStream();
	
			os.println("<map>");
			
			writeCoder(os, first);
			
			for(Coder c : v)
			{
				writeCoder(os, c);
			}
	
			os.println("</map>");
    	} catch (IOException e) { throw new RuntimeException(e); }
	}
    
    private void writeCoder(ServletOutputStream os, Coder cur)
    {
    	try { 
		os.print("<coder>\n");
		os.print("<coder_id>");
		os.print(cur.ID);
		os.print("</coder_id>\n");	
		os.print("<handle>");
		os.print(cur.handle);
		os.print("</handle>\n");
		os.print("<rating>");
		os.print(String.valueOf(cur.rating));
		os.print("</rating>\n");
		os.print("<image>placeholder</image>\n");
		os.print("<distance>");
		os.print(String.valueOf(cur.dist.get(0)));
		os.print("</distance>\n");
		os.print("<desc>");
		os.print(cur.desc);
		os.print("</desc>");
		os.print("</coder>\n");
    	} catch (IOException e) { throw new RuntimeException(e); }
    }		

	private Vector<Coder> getOverlapCoders()
	{
		Vector<Coder> ret = new Vector<Coder>();	
		try {
	    	Request r = new Request();
	    	
	    	r.setContentHandle("dd_fast_overlap");
	        r.setProperty("cr", getRequest().getParameter("cr"));	        
	        DataAccessInt da = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
	        CommandRunner cmd = new CommandRunner(da, r);        
	        Map<String, ResultSetContainer> dm = cmd.getData();
		
	        ResultSetContainer rsc = dm.get("dd_fast_overlap");
	        for (ResultSetContainer.ResultSetRow row : rsc) {        	
	        	long ID = row.getLongItem("coder_id");
	        	String handle = row.getStringItem("handle");
	        	int rating = row.getIntItem("rating");
	        	int shared_rounds = row.getIntItem("shared_rounds");
	        	
	        	Coder c = new Coder(String.valueOf(ID), handle, rating );
	        	c.overlap = shared_rounds;    	
	        	
	        	ret.add(c);
	        }
		} catch (Exception e) { throw new RuntimeException(e); }
        
        return ret;	
	}
	
	private Coder getOverlapMe()
	{
		Coder ret = null;	
		try {
	    	Request r = new Request();	    	
	    	r.setContentHandle("dd_fast_overlap_me");
	        r.setProperty("cr", getRequest().getParameter("cr"));
	        
	        DataAccessInt da = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
	        CommandRunner cmd = new CommandRunner(da, r);        
	        Map<String, ResultSetContainer> dm = cmd.getData();	        
	        ResultSetContainer rsc = dm.get("dd_fast_overlap_me");
	        long ID = rsc.get(0).getLongItem("coder_id");
        	String handle = rsc.get(0).getStringItem("handle");
        	int rating = rsc.get(0).getIntItem("rating");
        	int shared_rounds = rsc.get(0).getIntItem("shared_rounds");
        	
	        ret = new Coder(String.valueOf(ID), handle, rating );
	        ret.overlap = shared_rounds;    	
	        ret.dist.add(0.0);
		} catch (Exception e) { throw new RuntimeException(e); }
        
        return ret;			
	}
   	
	private class CoderOverlap
	{
		private Coder me = null;
		private Vector<Coder> them = null;
		private int maxOverlap = Integer.MIN_VALUE;
		private int minOverlap = Integer.MAX_VALUE;
		
		public CoderOverlap(Coder me, Vector<Coder> them)
		{
			this.me = me;
			this.them = them;			
		}
		
		public void process(int tflag, int cflag) 
		{		
			for(Coder cur : them)
			{
				if (cur.overlap > maxOverlap)
				{
					maxOverlap = cur.overlap;
				}
				
				if (cur.overlap < minOverlap)
				{
					minOverlap = cur.overlap;
				}
			}
			maxOverlap -= minOverlap - 1;
			
			if (tflag == 1)
			{				
				for(Coder cur : them)
				{
					overlapDistance(cur);
				}
			}
			else if (tflag == 2)
			{
				for(Coder cur : them)
				{
					ratingDistance(cur);
				}				
			}
			else if (tflag == 3)
			{
				for (Coder cur : them)
				{
					ratingOverlapDistance(cur);
				}
			}
		}
		
		private void overlapDistance(Coder target)
		{
			if (me.ID == target.ID) {
				target.dist.add(0.0);
				return;
			}
					
			double adj = target.overlap - minOverlap;
			
			target.dist.add(1- (adj / maxOverlap));
			
			target.desc += "Shared matches: " + target.overlap + "\n"; 
		}
		
		private void ratingDistance(Coder target)
		{
			if (me.ID == target.ID) {
				target.dist.add(0.0);
				return;
			}
					
			//double adj = target.overlap - minOverlap;
			
			//target.dist.add(1- (adj / maxOverlap));
			
			target.dist.add(Math.abs(target.rating - me.rating) / 4000.0);
			
			target.desc += "Distance based on rating\n"; 
		}
		
		private void ratingOverlapDistance(Coder target)
		{
			if (me.ID == target.ID) {
				target.dist.add(0.0);
				return;
			}
					
			double adj = target.overlap - minOverlap;
			
			target.dist.add(((1- (adj / maxOverlap)) + (Math.abs(target.rating - me.rating) / 4000.0)) / 2.0);
			
			target.desc += "Shared matches: " + target.overlap + "\nDistance also based on rating.\n"; 
		}

	}

    
}

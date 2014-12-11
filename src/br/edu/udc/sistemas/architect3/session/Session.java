package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;

public abstract class Session {
	
	protected Dao dao;
	
	public Session(Dao dao) {
		this.dao = dao;
	}
	
	public void save(Object obj) throws Exception {
		this.save(obj,true);
	}
	
	public void save(Object obj, Boolean bCommit) throws Exception {
		this.dao.save(obj);
		if (bCommit) {
			this.dao.commit();
		}
	}
	
	public void delete(Object obj) throws Exception {
		this.delete(obj,true);
	}
	
	public void delete(Object obj, Boolean bCommit) throws Exception {
		this.dao.delete(obj);
		if (bCommit) {
			this.dao.commit();
		}
	}
	
	public Object[] find(Object obj) throws Exception {
		return this.dao.find(obj);
	}
		
	public Object detail(Object obj) throws Exception{
		return this.findByPrimaryKey(obj);
	}
	
	public Object findByPrimaryKey(Object obj) throws Exception {
		return this.dao.findByPrimaryKey(obj);
	}

}

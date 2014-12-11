package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.Pais;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionPais extends Session{
	
	public SessionPais() throws Exception{
		super(FactoryDao.createDao(new Pais()));
	}
	
	public SessionPais(Dao dao) {
		super(dao);
	}

}

package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.Fabricante;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionFabricante extends Session{
	
	public SessionFabricante() throws Exception{
		super(FactoryDao.createDao(new Fabricante()));
	}
	
	public SessionFabricante(Dao dao) {
		super(dao);
	}

}

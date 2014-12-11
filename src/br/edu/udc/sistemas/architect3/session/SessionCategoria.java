package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.Categoria;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionCategoria extends Session{
	
	public SessionCategoria() throws Exception{
		super(FactoryDao.createDao(new Categoria()));
	}
	
	public SessionCategoria(Dao dao) {
		super(dao);
	}

}

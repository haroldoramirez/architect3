package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.UnidadeDeMedida;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionUnidadeDeMedida extends Session{
	
	public SessionUnidadeDeMedida() throws Exception{
		super(FactoryDao.createDao(new UnidadeDeMedida()));
	}
	
	public SessionUnidadeDeMedida(Dao dao) {
		super(dao);
	}

}

package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.Usuario;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionUsuario extends Session{
	
	public SessionUsuario() throws Exception{
		super(FactoryDao.createDao(new Usuario()));
	}
	
	public SessionUsuario(Dao dao) {
		super(dao);
	}

}

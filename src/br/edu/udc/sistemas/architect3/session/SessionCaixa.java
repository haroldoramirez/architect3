package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.Caixa;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionCaixa extends Session{
	
	public SessionCaixa() throws Exception{
		super(FactoryDao.createDao(new Caixa()));
	}
	
	public SessionCaixa(Dao dao) {
		super(dao);
	}

}

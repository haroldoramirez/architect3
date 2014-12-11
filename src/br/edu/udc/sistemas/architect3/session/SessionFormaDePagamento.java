package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionFormaDePagamento extends Session{
	
	public SessionFormaDePagamento() throws Exception{
		super(FactoryDao.createDao(new FormaDePagamento()));
	}
	
	public SessionFormaDePagamento(Dao dao) {
		super(dao);
	}

}

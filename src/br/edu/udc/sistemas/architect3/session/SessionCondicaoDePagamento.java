package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionCondicaoDePagamento extends Session{
	
	public SessionCondicaoDePagamento() throws Exception{
		super(FactoryDao.createDao(new CondicaoDePagamento()));
	}
	
	public SessionCondicaoDePagamento(Dao dao) {
		super(dao);
	}

}

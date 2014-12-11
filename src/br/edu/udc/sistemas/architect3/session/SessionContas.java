package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoFormaDePagamento;
import br.edu.udc.sistemas.architect3.entity.Contas;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionContas extends Session{
	
	public SessionContas() throws Exception{
		super(FactoryDao.createDao(new Contas()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoFormaDePagamento daoFormaDePagamento = new DaoFormaDePagamento();
		for (int i = 0; i < list.length; i++) {
			Contas contas = (Contas) list[i];
			contas.setFormaDePagamento((FormaDePagamento) daoFormaDePagamento.findByPrimaryKey(contas.getFormaDePagamento()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Contas contas = (Contas) super.findByPrimaryKey(obj);
		DaoFormaDePagamento daoFormaDePagamento = new DaoFormaDePagamento();
		contas.setFormaDePagamento((FormaDePagamento) daoFormaDePagamento.findByPrimaryKey(contas.getFormaDePagamento()));
		return contas;
	}
	
	public SessionContas(Dao dao) {
		super(dao);
	}

}

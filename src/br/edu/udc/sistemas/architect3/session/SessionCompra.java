package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoCondicaoDePagamento;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoFormaDePagamento;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoFornecedor;
import br.edu.udc.sistemas.architect3.entity.Compra;
import br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.entity.Fornecedor;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionCompra extends Session {
	
	public SessionCompra(Dao dao) {
		super(dao);
	}
	
	public SessionCompra() throws Exception {
		super(FactoryDao.createDao(new Compra()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoFornecedor daoFornecedor = new DaoFornecedor();
		DaoFormaDePagamento daoFormaDePagamento = new DaoFormaDePagamento();
		DaoCondicaoDePagamento daoCondicaoDePagamento = new DaoCondicaoDePagamento();
		for (int i = 0; i < list.length; i++) {
			Compra compra = (Compra) list[i];
			compra.setFornecedor((Fornecedor) daoFornecedor.findByPrimaryKey(compra.getFornecedor()));
			compra.setFormaDePagamento((FormaDePagamento) daoFormaDePagamento.findByPrimaryKey(compra.getFormaDePagamento()));
			compra.setCondicaoDePagamento((CondicaoDePagamento) daoCondicaoDePagamento.findByPrimaryKey(compra.getCondicaoDePagamento()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Compra compra = (Compra) super.findByPrimaryKey(obj);
		
		DaoFornecedor daoFornecedor = new DaoFornecedor();
		DaoFormaDePagamento daoFormaDePagamento = new DaoFormaDePagamento();
		DaoCondicaoDePagamento daoCondicaoDePagamento = new DaoCondicaoDePagamento();
		
		compra.setFornecedor((Fornecedor) daoFornecedor.findByPrimaryKey(compra.getFornecedor()));
		compra.setFormaDePagamento((FormaDePagamento) daoFormaDePagamento.findByPrimaryKey(compra.getFormaDePagamento()));
		compra.setCondicaoDePagamento((CondicaoDePagamento) daoCondicaoDePagamento.findByPrimaryKey(compra.getCondicaoDePagamento()));
		return compra;
	}

}

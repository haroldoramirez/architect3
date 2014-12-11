package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoCliente;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoCondicaoDePagamento;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoFormaDePagamento;
import br.edu.udc.sistemas.architect3.entity.Cliente;
import br.edu.udc.sistemas.architect3.entity.Compra;
import br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.entity.Venda;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionVenda extends Session{

	public SessionVenda(Dao dao) {
		super(dao);
	}
	
	public SessionVenda() throws Exception{
		super(FactoryDao.createDao(new Compra()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoCliente daoCliente = new DaoCliente();
		DaoCondicaoDePagamento daoCondicaoDePagamento = new DaoCondicaoDePagamento();
		DaoFormaDePagamento daoFormaDePagamento = new DaoFormaDePagamento();
		for (int i = 0; i < list.length; i++) {
			Venda venda = (Venda) list[i];
			venda.setCliente((Cliente) daoCliente.findByPrimaryKey(venda.getCliente()));
			venda.setCondicaoDePagamento((CondicaoDePagamento) daoCondicaoDePagamento.findByPrimaryKey(venda.getCondicaoDePagamento()));
			venda.setFormaDePagamento((FormaDePagamento) daoFormaDePagamento.findByPrimaryKey(venda.getFormaDePagamento()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Venda venda = (Venda) super.findByPrimaryKey(obj);
		
		DaoCliente daoCliente = new DaoCliente();
		DaoCondicaoDePagamento daoCondicaoDePagamento = new DaoCondicaoDePagamento();
		DaoFormaDePagamento daoFormaDePagamento = new DaoFormaDePagamento();
		
		venda.setCliente((Cliente) daoCliente.findByPrimaryKey(venda.getCliente()));
		venda.setCondicaoDePagamento((CondicaoDePagamento) daoCondicaoDePagamento.findByPrimaryKey(venda.getCondicaoDePagamento()));
		venda.setFormaDePagamento((FormaDePagamento) daoFormaDePagamento.findByPrimaryKey(venda.getFormaDePagamento()));
		return venda;
	}
	
}

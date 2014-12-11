package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoProduto;
import br.edu.udc.sistemas.architect3.entity.ItemCompra;
import br.edu.udc.sistemas.architect3.entity.Produto;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionItemCompra extends Session {

	public SessionItemCompra(Dao dao) {
		super(dao);
	}
	
	public SessionItemCompra() throws Exception {
		super(FactoryDao.createDao(new ItemCompra()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoProduto daoProduto = new DaoProduto();
		for (int i = 0; i < list.length; i++) {
			ItemCompra itemCompra = (ItemCompra) list[i];
			itemCompra.setProduto((Produto) daoProduto.findByPrimaryKey(itemCompra.getProduto()));
		}
		return list;
		
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		ItemCompra itemCompra = (ItemCompra) super.findByPrimaryKey(obj);
		DaoProduto daoProduto = new DaoProduto();
		
		itemCompra.setProduto((Produto) daoProduto.findByPrimaryKey(itemCompra.getProduto()));
		
		return obj;
	}

}

package br.edu.udc.sistemas.architect3.controller;

public class ControllerCondicaoDePagamento extends Controller{
	
	public ControllerCondicaoDePagamento() throws Exception {
		super("CondicaoDePagamento");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./condicaodepagamento/cadastrarCondicaoDePagamento.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./condicaodepagamento/consultarCondicaoDePagamento.jsp");
	}

	@Override
	public void save(Object obj) throws Exception {
		this.goNew();
	}

	@Override
	public void delete(Object obj) throws Exception {
		this.goFind();
	}

	@Override
	public void detail(Object obj) throws Exception {
		request.setAttribute("object",obj);
		this.goNew();
	}
	
	@Override
	public void find(Object obj) throws Exception {
		request.setAttribute("list",obj);
		this.goFind();
	}

	@Override
	public void clean() throws Exception {
		this.goFind();
	}
}

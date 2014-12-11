package br.edu.udc.sistemas.architect3.controller;

public class ControllerFormaDePagamento extends Controller{
	
	public ControllerFormaDePagamento() throws Exception {
		super("FormaDePagamento");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./formadepagamento/cadastrarFormaDePagamento.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./formadepagamento/consultarFormaDePagamento.jsp");
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

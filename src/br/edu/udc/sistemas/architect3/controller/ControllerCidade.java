package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.Estado;
import br.edu.udc.sistemas.architect3.session.SessionEstado;

public class ControllerCidade extends Controller{
	
	public ControllerCidade() throws Exception {
		super("Cidade");
	}

	@Override
	public void goNew() throws Exception {
		SessionEstado sessionEstado = new SessionEstado();
		Object listEstado[] = sessionEstado.find(new Estado());
		request.setAttribute("listEstado",listEstado);
		request.setAttribute("nextPage","./cidade/cadastrarCidade.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionEstado sessionEstado = new SessionEstado();
		Object listEstado[] = sessionEstado.find(new Estado());
		request.setAttribute("listEstado",listEstado);
		request.setAttribute("nextPage","./cidade/consultarCidade.jsp");
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

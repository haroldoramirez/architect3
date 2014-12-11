package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.Pais;
import br.edu.udc.sistemas.architect3.session.SessionPais;

public class ControllerEstado extends Controller{
	
	public ControllerEstado() throws Exception {
		super("Estado");
	}

	@Override
	public void goNew() throws Exception {
		SessionPais sessionPais = new SessionPais();
		Object listPais[] = sessionPais.find(new Pais());
		request.setAttribute("listPais",listPais);
		request.setAttribute("nextPage","./estado/cadastrarEstado.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionPais sessionPais = new SessionPais();
		Object listPais[] = sessionPais.find(new Pais());
		request.setAttribute("listPais",listPais);
		request.setAttribute("nextPage","./estado/consultarEstado.jsp");
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

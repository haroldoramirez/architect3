package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.Cidade;
import br.edu.udc.sistemas.architect3.entity.Estado;
import br.edu.udc.sistemas.architect3.entity.Pais;
import br.edu.udc.sistemas.architect3.session.SessionCidade;
import br.edu.udc.sistemas.architect3.session.SessionEstado;
import br.edu.udc.sistemas.architect3.session.SessionPais;

public class ControllerFornecedor extends Controller{
	
	public ControllerFornecedor() throws Exception {
		super("Fornecedor");
	}

	@Override
	public void goNew() throws Exception {
		SessionPais sessionPais = new SessionPais();
		SessionEstado sessionEstado = new SessionEstado();
		SessionCidade sessionCidade = new SessionCidade();
		
		Object listPais[] = sessionPais.find(new Pais());
		Object listEstado[] = sessionEstado.find(new Estado());
		Object listCidade[] = sessionCidade.find(new Cidade());
		
		request.setAttribute("listPais",listPais);
		request.setAttribute("listEstado",listEstado);
		request.setAttribute("listCidade",listCidade);
		request.setAttribute("nextPage","./fornecedor/cadastrarFornecedor.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionPais sessionPais = new SessionPais();
		SessionEstado sessionEstado = new SessionEstado();
		SessionCidade sessionCidade = new SessionCidade();
		
		Object listPais[] = sessionPais.find(new Pais());
		Object listEstado[] = sessionEstado.find(new Estado());
		Object listCidade[] = sessionCidade.find(new Cidade());
		
		request.setAttribute("listPais",listPais);
		request.setAttribute("listEstado",listEstado);
		request.setAttribute("listCliente",listCidade);
		request.setAttribute("nextPage","./fornecedor/consultarFornecedor.jsp");
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

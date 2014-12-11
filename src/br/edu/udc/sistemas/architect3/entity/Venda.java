package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="venda")

public class Venda {
	
	@Id
	@GeneratedValue
	@Column(name = "idvenda", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idVenda;
	
	@Column(name = "cliente", type = Column.OBJECT, nullable = false)
	private Cliente cliente;
	
	@Column(name = "usuario", type = Column.OBJECT, nullable = false)
	private Usuario usuario;
	
	@Column(name = "condicaodepagamento", type = Column.OBJECT, nullable = false)
	private CondicaoDePagamento condicaoDePagamento;
	
	@Column(name = "formadepagamento", type = Column.OBJECT, nullable = false)
	private FormaDePagamento formaDePagamento;
	
	@Column(name = "caixa", type = Column.OBJECT, nullable = false)
	private Caixa caixa;

	@Column(name = "valorTotal", type = Column.STRING, length = 10, nullable = false)
	private String valorTotal;
	
	@Column(name = "data", type = Column.STRING, length = 10, nullable = false)
	private String data;
	
	@Column(name = "desconto", type = Column.STRING, length = 10, nullable = false)
	private String desconto;
	
	@Column(name = "quantidade", type = Column.INTEGER, nullable = false)
	private Integer quantidade;
	
	@Column(name = "preco", type = Column.FLOAT, nullable = false)
	private Float preco;

	public Integer getIdVenda() {
		return idVenda;
	}

	public void setIdVenda(Integer idVenda) {
		this.idVenda = idVenda;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public CondicaoDePagamento getCondicaoDePagamento() {
		return condicaoDePagamento;
	}

	public void setCondicaoDePagamento(CondicaoDePagamento condicaoDePagamento) {
		this.condicaoDePagamento = condicaoDePagamento;
	}

	public FormaDePagamento getFormaDePagamento() {
		return formaDePagamento;
	}

	public void setFormaDePagamento(FormaDePagamento formaDePagamento) {
		this.formaDePagamento = formaDePagamento;
	}

	public Caixa getCaixa() {
		return caixa;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}

	public String getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(String valorTotal) {
		this.valorTotal = valorTotal;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getDesconto() {
		return desconto;
	}

	public void setDesconto(String desconto) {
		this.desconto = desconto;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Float getPreco() {
		return preco;
	}

	public void setPreco(Float preco) {
		this.preco = preco;
	}

	@Override
	public String toString() {
		return "Venda [idVenda=" + this.idVenda + ", cliente=" + this.cliente
				+ ", usuario=" + this.usuario + ", condicaoDePagamento="
				+ this.condicaoDePagamento + ", formaDePagamento="
				+ this.formaDePagamento + ", caixa=" + this.caixa + ", valorTotal="
				+ this.valorTotal + ", data=" + this.data + ", desconto=" + this.desconto
				+ ", quantidade=" + this.quantidade + ", preco=" + this.preco + "]";
	}
	
}

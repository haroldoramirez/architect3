package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="compra")

public class Compra {
	
	@Id
	@GeneratedValue
	@Column(name = "idcompra", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idCompra;
	
	@Column(name = "data", type = Column.STRING, length = 10, nullable = false)
	private String data;
	
	@Column(name = "fornecedor", type = Column.OBJECT, nullable = false)
	private Fornecedor fornecedor;
	
	@Column(name = "formadepagamento", type = Column.OBJECT, nullable = false)
	private FormaDePagamento formaDePagamento;
	
	@Column(name = "condicaodepagamento", type = Column.OBJECT, nullable = false)
	private CondicaoDePagamento condicaoDePagamento;
	
	@Column(name = "desconto", type = Column.STRING, length = 10, nullable = false)
	private String desconto;
	
	@Column(name = "valortotal", type = Column.STRING, length = 10, nullable = false)
	private String valorTotal;
	
	@Column(name = "usuario", type = Column.OBJECT, nullable = false)
	private Usuario usuario;

	@Column(name = "caixa", type = Column.OBJECT, nullable = false)
	private Caixa caixa;
	
	@Column(name = "quantidade", type = Column.INTEGER, nullable = false)
	private Integer quantidade;
	
	@Column(name = "preco", type = Column.FLOAT, nullable = false)
	private Float preco;

	public Integer getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(Integer idCompra) {
		this.idCompra = idCompra;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public FormaDePagamento getFormaDePagamento() {
		return formaDePagamento;
	}

	public void setFormaDePagamento(FormaDePagamento formaDePagamento) {
		this.formaDePagamento = formaDePagamento;
	}

	public CondicaoDePagamento getCondicaoDePagamento() {
		return condicaoDePagamento;
	}

	public void setCondicaoDePagamento(CondicaoDePagamento condicaoDePagamento) {
		this.condicaoDePagamento = condicaoDePagamento;
	}

	public String getDesconto() {
		return desconto;
	}

	public void setDesconto(String desconto) {
		this.desconto = desconto;
	}

	public String getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(String valorTotal) {
		this.valorTotal = valorTotal;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Caixa getCaixa() {
		return caixa;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
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
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Compra other = (Compra) obj;
		if (caixa == null) {
			if (other.caixa != null)
				return false;
		} else if (!caixa.equals(other.caixa))
			return false;
		if (condicaoDePagamento == null) {
			if (other.condicaoDePagamento != null)
				return false;
		} else if (!condicaoDePagamento.equals(other.condicaoDePagamento))
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (desconto == null) {
			if (other.desconto != null)
				return false;
		} else if (!desconto.equals(other.desconto))
			return false;
		if (formaDePagamento == null) {
			if (other.formaDePagamento != null)
				return false;
		} else if (!formaDePagamento.equals(other.formaDePagamento))
			return false;
		if (fornecedor == null) {
			if (other.fornecedor != null)
				return false;
		} else if (!fornecedor.equals(other.fornecedor))
			return false;
		if (idCompra == null) {
			if (other.idCompra != null)
				return false;
		} else if (!idCompra.equals(other.idCompra))
			return false;
		if (preco == null) {
			if (other.preco != null)
				return false;
		} else if (!preco.equals(other.preco))
			return false;
		if (quantidade == null) {
			if (other.quantidade != null)
				return false;
		} else if (!quantidade.equals(other.quantidade))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		if (valorTotal == null) {
			if (other.valorTotal != null)
				return false;
		} else if (!valorTotal.equals(other.valorTotal))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Compra [idCompra=" + this.idCompra + ", data=" + this.data
				+ ", fornecedor=" + this.fornecedor + ", formaDePagamento="
				+ this.formaDePagamento + ", condicaoDePagamento="
				+ this.condicaoDePagamento + ", desconto=" + this.desconto
				+ ", valorTotal=" + this.valorTotal + ", usuario=" + this.usuario
				+ ", caixa=" + this.caixa + ", quantidade=" + this.quantidade
				+ ", preco=" + this.preco + "]";
	}
	
}

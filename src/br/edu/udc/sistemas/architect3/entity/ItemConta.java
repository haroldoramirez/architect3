package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="itemconta")

public class ItemConta {
	
	@Id
	@GeneratedValue
	@Column(name = "iditemconta", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idItemConta;
	
	@Id
	@Column(name = "idconta", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idConta;
	
	@Column(name = "produto", type = Column.OBJECT, nullable = false)
	private Produto produto;
	
	@Column(name = "quantidade", type = Column.INTEGER, length = 8, nullable = false)
	private Integer quantidade;
	
	@Column(name = "valorUnitario", type = Column.FLOAT, nullable = false)
	private Float valorUnitario;

	@Column(name = "subtotal", type = Column.FLOAT, nullable = false)
	private Float subTotal;

	public Integer getIdItemConta() {
		return idItemConta;
	}

	public void setIdItemConta(Integer idItemConta) {
		this.idItemConta = idItemConta;
	}

	public Integer getIdConta() {
		return idConta;
	}

	public void setIdConta(Integer idConta) {
		this.idConta = idConta;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Float getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(Float valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	public Float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Float subTotal) {
		this.subTotal = subTotal;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemConta other = (ItemConta) obj;
		if (idConta == null) {
			if (other.idConta != null)
				return false;
		} else if (!idConta.equals(other.idConta))
			return false;
		if (idItemConta == null) {
			if (other.idItemConta != null)
				return false;
		} else if (!idItemConta.equals(other.idItemConta))
			return false;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		if (quantidade == null) {
			if (other.quantidade != null)
				return false;
		} else if (!quantidade.equals(other.quantidade))
			return false;
		if (subTotal == null) {
			if (other.subTotal != null)
				return false;
		} else if (!subTotal.equals(other.subTotal))
			return false;
		if (valorUnitario == null) {
			if (other.valorUnitario != null)
				return false;
		} else if (!valorUnitario.equals(other.valorUnitario))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ItemConta [idItemConta=" + this.idItemConta + ", idConta=" + this.idConta
				+ ", produto=" + this.produto + ", quantidade=" + this.quantidade
				+ ", valorUnitario=" + this.valorUnitario + ", subTotal=" + this.subTotal
				+ "]";
	}
	
}

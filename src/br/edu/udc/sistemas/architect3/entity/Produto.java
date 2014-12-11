package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="produto")

public class Produto {
	
	@Id
	@GeneratedValue
	@Column(name = "idproduto", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idProduto;

	@Column(name = "descricao", type = Column.STRING, length = 150, nullable = false)
	private String descricao;
	
	@Column(name = "quantidademinima", type = Column.INTEGER, length = 9, nullable = false)
	private Integer quantidadeMinima;
	
	@Column(name = "quantidadeemestoque", type = Column.INTEGER, length = 9, nullable = false)
	private Integer quantidadeEmEstoque;
	
	@Column(name = "unidadedemedida", type = Column.OBJECT, nullable = false)
	private UnidadeDeMedida unidadeDeMedida;
	
	@Column(name = "fornecedor", type = Column.OBJECT, nullable = false)
	private Fornecedor fornecedor;
	
	@Column(name = "fabricante", type = Column.OBJECT, nullable = false)
	private Fabricante fabricante;
	
	@Column(name = "categoria", type = Column.OBJECT, nullable = false)
	private Categoria categoria;
	
	@Column(name = "precodecusto", type = Column.STRING, length = 10, nullable = false)
	private String precoDeCusto;
	
	@Column(name = "precodevenda", type = Column.STRING, length = 10, nullable = false)
	private String precoDeVenda;
	
	@Column(name = "observacoes", type = Column.STRING, length = 400, nullable = false)
	private String observacoes;
	
	@Column(name = "codigodebarras", type = Column.STRING, length = 200, nullable = false)
	private String codigodebarras;

	public Integer getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getQuantidadeMinima() {
		return quantidadeMinima;
	}

	public void setQuantidadeMinima(Integer quantidadeMinima) {
		this.quantidadeMinima = quantidadeMinima;
	}

	public Integer getQuantidadeEmEstoque() {
		return quantidadeEmEstoque;
	}

	public void setQuantidadeEmEstoque(Integer quantidadeEmEstoque) {
		this.quantidadeEmEstoque = quantidadeEmEstoque;
	}

	public UnidadeDeMedida getUnidadeDeMedida() {
		return unidadeDeMedida;
	}

	public void setUnidadeDeMedida(UnidadeDeMedida unidadeDeMedida) {
		this.unidadeDeMedida = unidadeDeMedida;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Fabricante getFabricante() {
		return fabricante;
	}

	public void setFabricante(Fabricante fabricante) {
		this.fabricante = fabricante;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getPrecoDeCusto() {
		return precoDeCusto;
	}

	public void setPrecoDeCusto(String precoDeCusto) {
		this.precoDeCusto = precoDeCusto;
	}

	public String getPrecoDeVenda() {
		return precoDeVenda;
	}

	public void setPrecoDeVenda(String precoDeVenda) {
		this.precoDeVenda = precoDeVenda;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public String getCodigodebarras() {
		return codigodebarras;
	}

	public void setCodigodebarras(String codigodebarras) {
		this.codigodebarras = codigodebarras;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Produto other = (Produto) obj;
		if (categoria == null) {
			if (other.categoria != null)
				return false;
		} else if (!categoria.equals(other.categoria))
			return false;
		if (codigodebarras == null) {
			if (other.codigodebarras != null)
				return false;
		} else if (!codigodebarras.equals(other.codigodebarras))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (fabricante == null) {
			if (other.fabricante != null)
				return false;
		} else if (!fabricante.equals(other.fabricante))
			return false;
		if (fornecedor == null) {
			if (other.fornecedor != null)
				return false;
		} else if (!fornecedor.equals(other.fornecedor))
			return false;
		if (idProduto == null) {
			if (other.idProduto != null)
				return false;
		} else if (!idProduto.equals(other.idProduto))
			return false;
		if (observacoes == null) {
			if (other.observacoes != null)
				return false;
		} else if (!observacoes.equals(other.observacoes))
			return false;
		if (precoDeCusto == null) {
			if (other.precoDeCusto != null)
				return false;
		} else if (!precoDeCusto.equals(other.precoDeCusto))
			return false;
		if (precoDeVenda == null) {
			if (other.precoDeVenda != null)
				return false;
		} else if (!precoDeVenda.equals(other.precoDeVenda))
			return false;
		if (quantidadeEmEstoque == null) {
			if (other.quantidadeEmEstoque != null)
				return false;
		} else if (!quantidadeEmEstoque.equals(other.quantidadeEmEstoque))
			return false;
		if (quantidadeMinima == null) {
			if (other.quantidadeMinima != null)
				return false;
		} else if (!quantidadeMinima.equals(other.quantidadeMinima))
			return false;
		if (unidadeDeMedida == null) {
			if (other.unidadeDeMedida != null)
				return false;
		} else if (!unidadeDeMedida.equals(other.unidadeDeMedida))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Produto [idProduto=" + this.idProduto + ", descricao=" + this.descricao
				+ ", quantidadeMinima=" + this.quantidadeMinima
				+ ", quantidadeEmEstoque=" + this.quantidadeEmEstoque
				+ ", unidadeDeMedida=" + this.unidadeDeMedida + ", fornecedor="
				+ this.fornecedor + ", fabricante=" + this.fabricante + ", categoria="
				+ this.categoria + ", precoDeCusto=" + this.precoDeCusto
				+ ", precoDeVenda=" + this.precoDeVenda + ", observacoes="
				+ this.observacoes + ", codigodebarras=" + this.codigodebarras + "]";
	}
	
}

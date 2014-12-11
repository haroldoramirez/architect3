package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="contas")

public class Contas {
	
	@Id
	@GeneratedValue
	@Column(name = "idconta", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idConta;
	
	@Column(name = "numerofatura", type = Column.INTEGER, length = 50, nullable = false)
	private Integer numeroFatura;
	
	@Column(name = "datavencimento", type = Column.STRING, length = 10, nullable = false)
	private String dataVencimento;
	
	@Column(name = "datapagamento", type = Column.STRING, length = 10, nullable = false)
	private String dataPagamento;
	
	@Column(name = "descricao", type = Column.STRING, length = 150, nullable = false)
	private String descricao;
	
	@Column(name = "formadepagamento", type = Column.OBJECT, nullable = false)
	private FormaDePagamento formaDePagamento;
	
	@Column(name = "condicaodepagamento", type = Column.OBJECT, nullable = false)
	private CondicaoDePagamento condicaoDePagamento;
	
	@Column(name = "valorfatura", type = Column.STRING, length = 15, nullable = false)
	private String valorFatura;
	
	@Column(name = "tipodeconta", type = Column.STRING, length = 1, nullable = false)
	private String tipoDeConta;
	
	@Column(name = "juros", type = Column.STRING, length = 15, nullable = false)
	private String juros;
	
	@Column(name = "desconto", type = Column.STRING, length = 15, nullable = false)
	private String desconto;
	
	@Column(name = "multa", type = Column.STRING, length = 15, nullable = false)
	private String multa;
		
	@Column(name = "observacoes", type = Column.STRING, length = 400, nullable = false)
	private String obsevacoes;
	
	@Column(name = "parcelas", type = Column.INTEGER, length = 400, nullable = false)
	private Integer parcelas;

	public Integer getIdConta() {
		return idConta;
	}

	public void setIdConta(Integer idConta) {
		this.idConta = idConta;
	}

	public Integer getNumeroFatura() {
		return numeroFatura;
	}

	public void setNumeroFatura(Integer numeroFatura) {
		this.numeroFatura = numeroFatura;
	}

	public String getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(String dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public String getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(String dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
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

	public String getValorFatura() {
		return valorFatura;
	}

	public void setValorFatura(String valorFatura) {
		this.valorFatura = valorFatura;
	}

	public String getTipoDeConta() {
		return tipoDeConta;
	}

	public void setTipoDeConta(String tipoDeConta) {
		this.tipoDeConta = tipoDeConta;
	}

	public String getJuros() {
		return juros;
	}

	public void setJuros(String juros) {
		this.juros = juros;
	}

	public String getDesconto() {
		return desconto;
	}

	public void setDesconto(String desconto) {
		this.desconto = desconto;
	}

	public String getMulta() {
		return multa;
	}

	public void setMulta(String multa) {
		this.multa = multa;
	}

	public String getObsevacoes() {
		return obsevacoes;
	}

	public void setObsevacoes(String obsevacoes) {
		this.obsevacoes = obsevacoes;
	}

	public Integer getParcelas() {
		return parcelas;
	}

	public void setParcelas(Integer parcelas) {
		this.parcelas = parcelas;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Contas other = (Contas) obj;
		if (condicaoDePagamento == null) {
			if (other.condicaoDePagamento != null)
				return false;
		} else if (!condicaoDePagamento.equals(other.condicaoDePagamento))
			return false;
		if (dataPagamento == null) {
			if (other.dataPagamento != null)
				return false;
		} else if (!dataPagamento.equals(other.dataPagamento))
			return false;
		if (dataVencimento == null) {
			if (other.dataVencimento != null)
				return false;
		} else if (!dataVencimento.equals(other.dataVencimento))
			return false;
		if (desconto == null) {
			if (other.desconto != null)
				return false;
		} else if (!desconto.equals(other.desconto))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (formaDePagamento == null) {
			if (other.formaDePagamento != null)
				return false;
		} else if (!formaDePagamento.equals(other.formaDePagamento))
			return false;
		if (idConta == null) {
			if (other.idConta != null)
				return false;
		} else if (!idConta.equals(other.idConta))
			return false;
		if (juros == null) {
			if (other.juros != null)
				return false;
		} else if (!juros.equals(other.juros))
			return false;
		if (multa == null) {
			if (other.multa != null)
				return false;
		} else if (!multa.equals(other.multa))
			return false;
		if (numeroFatura == null) {
			if (other.numeroFatura != null)
				return false;
		} else if (!numeroFatura.equals(other.numeroFatura))
			return false;
		if (obsevacoes == null) {
			if (other.obsevacoes != null)
				return false;
		} else if (!obsevacoes.equals(other.obsevacoes))
			return false;
		if (parcelas == null) {
			if (other.parcelas != null)
				return false;
		} else if (!parcelas.equals(other.parcelas))
			return false;
		if (tipoDeConta == null) {
			if (other.tipoDeConta != null)
				return false;
		} else if (!tipoDeConta.equals(other.tipoDeConta))
			return false;
		if (valorFatura == null) {
			if (other.valorFatura != null)
				return false;
		} else if (!valorFatura.equals(other.valorFatura))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Contas [idConta=" + this.idConta + ", numeroFatura=" + this.numeroFatura
				+ ", dataVencimento=" + this.dataVencimento + ", dataPagamento="
				+ this.dataPagamento + ", descricao=" + this.descricao
				+ ", formaDePagamento=" + this.formaDePagamento
				+ ", condicaoDePagamento=" + this.condicaoDePagamento
				+ ", valorFatura=" + this.valorFatura + ", tipoDeConta="
				+ this.tipoDeConta + ", juros=" + this.juros + ", desconto=" + this.desconto
				+ ", multa=" + this.multa + ", obsevacoes=" + this.obsevacoes
				+ ", parcelas=" + this.parcelas + "]";
	}

}
